import 'package:equatable/equatable.dart';

class DriveFileList extends Equatable {
  final String folderName;
  final String folderId;

  DriveFileList(this.folderName, this.folderId);
  @override
  List<Object?> get props => [folderName, folderId];
}

class DriveFile extends Equatable {
  final List<DriveFileList> list;
  final String? nextPageToken;

  DriveFile(this.list, this.nextPageToken);

  @override
  List<Object?> get props => [list, nextPageToken];
}
