
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_manager.state.freezed.dart';

@freezed
class DownloadManagerState with _$DownloadManagerState {
  const factory DownloadManagerState({
    required List<dynamic> downloads,
  }) = _DownloadManagerState;
}