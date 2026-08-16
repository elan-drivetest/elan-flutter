import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/data/api_service/pricing_config_api_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/pricing_config/pricing_config.dart';
import 'package:injectable/injectable.dart';

abstract class PricingConfigRepository {
  final PricingConfigApiService pricingConfigApiService;
  final CacheManagerImpl cacheManager;

  PricingConfigRepository(this.pricingConfigApiService, this.cacheManager);

  /// Live config, with the last-good cached copy written on success.
  Future<Either<ErrorResponse, PricingConfig>> getPricingConfig();

  /// The last successfully fetched config, or null if there has never been one.
  Future<PricingConfig?> getCachedPricingConfig();
}

@LazySingleton(as: PricingConfigRepository)
class IPricingConfigRepository extends PricingConfigRepository {
  IPricingConfigRepository(super.pricingConfigApiService, super.cacheManager);

  @override
  Future<Either<ErrorResponse, PricingConfig>> getPricingConfig() async {
    final result = await pricingConfigApiService.getPricingConfig();

    // Cache on success only, so a failed fetch never clobbers a good copy.
    await result.fold(
      (_) async {},
      (config) async {
        try {
          await cacheManager.setPricingConfig(
            rawJson: jsonEncode(config.toJson()),
          );
        } catch (e) {
          // Caching is best-effort — never fail the fetch because of it.
          AppLog.e('Failed to cache pricing config', error: e);
        }
      },
    );

    return result;
  }

  @override
  Future<PricingConfig?> getCachedPricingConfig() async {
    try {
      final raw = await cacheManager.getPricingConfig();
      if (raw == null || raw.isEmpty) return null;
      return PricingConfig.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (e) {
      // A corrupt or stale-shaped cache must degrade to defaults, not crash.
      AppLog.e('Failed to read cached pricing config', error: e);
      return null;
    }
  }
}
