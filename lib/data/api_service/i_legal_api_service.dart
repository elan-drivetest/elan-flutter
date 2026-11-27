import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:elan/core/error/api_error_mapper.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/data/api_service/legal_api_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/legal/legal_status.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LegalApiService)
class ILegalApiService extends LegalApiService {
  final Dio dio;
  ILegalApiService(this.dio);

  ErrorResponse checkResponseError(DioException err) {
    AppLog.d("legal_error -> ${err.response}");
    return ErrorResponse.fromJson(ApiErrorMapper.humanizeBody(err));
  }

  @override
  Future<Either<ErrorResponse, LegalStatus>> getStatus() async {
    try {
      final response =
          await dio.get(ApiEndpoints.baseUrl + ApiEndpoints.legalStatusUrl);
      return right(
          LegalStatus.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return left(checkResponseError(e));
    }
  }

  @override
  Future<Either<ErrorResponse, LegalStatus>> accept(
      List<LegalDocument> documents) async {
    try {
      final response = await dio.post(
        ApiEndpoints.baseUrl + ApiEndpoints.legalAcceptUrl,
        data: {
          'acceptances': [
            for (final d in documents)
              {'document': d.document, 'version': d.version},
          ],
          'platform': Platform.isIOS ? 'ios' : 'android',
          // Provider Agreement §16: tapping "I Agree and Accept" is the
          // electronic signature.
          'action': 'button',
        },
      );
      return right(
          LegalStatus.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return left(checkResponseError(e));
    }
  }
}
