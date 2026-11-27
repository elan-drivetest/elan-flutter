import 'package:dartz/dartz.dart';
import 'package:elan/data/api_service/legal_api_service.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/legal/legal_status.dart';
import 'package:injectable/injectable.dart';

abstract class LegalRepository {
  final LegalApiService legalApiService;

  LegalRepository(this.legalApiService);

  Future<Either<ErrorResponse, LegalStatus>> getStatus();
  Future<Either<ErrorResponse, LegalStatus>> accept(
      List<LegalDocument> documents);
}

@LazySingleton(as: LegalRepository)
class ILegalRepository extends LegalRepository {
  ILegalRepository(super.legalApiService);

  @override
  Future<Either<ErrorResponse, LegalStatus>> getStatus() =>
      legalApiService.getStatus();

  @override
  Future<Either<ErrorResponse, LegalStatus>> accept(
          List<LegalDocument> documents) =>
      legalApiService.accept(documents);
}
