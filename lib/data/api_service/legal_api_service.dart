import 'package:dartz/dartz.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/legal/legal_status.dart';

abstract class LegalApiService {
  Future<Either<ErrorResponse, LegalStatus>> getStatus();
  Future<Either<ErrorResponse, LegalStatus>> accept(
      List<LegalDocument> documents);
}
