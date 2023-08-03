import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:download_manager/main.dart';

part 'download_manager.state.freezed.dart';

@freezed
class DownloadManagerState with _$DownloadManagerState {
  const factory DownloadManagerState({
    required List<DownloadEntityState> downloads,
  }) = _DownloadManagerState;
}

@freezed
class DownloadEntityState with _$DownloadEntityState {
  const factory DownloadEntityState({
    required DownloadTask task,
    required double progress,
  }) = _DownloadEntityState;
}