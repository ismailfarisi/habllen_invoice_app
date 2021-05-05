part of 'drive_bloc.dart';

enum FileFetchStatus { initial, success, failure }

class DriveState extends Equatable {
  const DriveState(
      {this.nextPageToken = 'initial',
      this.hasReachedMax = false,
      this.listdata = const <DriveFileList>[],
      this.status = FileFetchStatus.initial});
  final FileFetchStatus status;
  final List<DriveFileList> listdata;
  final String? nextPageToken;
  final bool hasReachedMax;
  @override
  List<Object?> get props => [listdata];

  DriveState copywith(
      {List<DriveFileList>? listdata,
      bool? hasReachedMax,
      FileFetchStatus? status}) {
    return DriveState(
      listdata: listdata ?? this.listdata,
    );
  }
}
