

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:elan/data/repository/user_repository.dart';
import 'package:elan/domain/error_response/error_response.dart';
import 'package:elan/domain/file_response/file_response.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'file_upload_event.dart';
part 'file_upload_state.dart';
part 'file_upload_bloc.freezed.dart';
part 'file_upload_bloc.g.dart';

@injectable
class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  final UserRepository repository;

  FileUploadBloc(this.repository) : super(const FileUploadState()) {
    on<_Send>(_onSend);
  }

  Future<void> _onSend(
    _Send event,
    Emitter<FileUploadState> emit,
  ) async {
    emit(state.copyWith(status: FileUploadStatus.loading));
    final result = await repository.fileUpload(file: File(event.file.path!));

    result.fold(
      (l) => emit(state.copyWith(
        errorResponse: l,
        status: FileUploadStatus.error,
      )),
      (r) {
        emit(state.copyWith(status: FileUploadStatus.success, response: r));
      },
    );
  }
}
