import 'package:drive_api/src/model/drive_file.dart';
import 'package:googleapis/drive/v3.dart' as drive;

import '../drive_api.dart';

class DriveApiLocal {
  final Map<String, String> authHeaders;
  final GDriveClient gDriveClient;

  DriveApiLocal(this.authHeaders) : gDriveClient = GDriveClient(authHeaders);

  Future<DriveFile> listInvoiceFromDrive() async {
    final drive.DriveApi driveApi = drive.DriveApi(gDriveClient);
    var files = driveApi.files;
    var filelist = await files.list(
        q: "mimeType = 'application/vnd.google-apps.folder' and '1BqNY8_mUiIpIs7wIuGuQjqlfdvGaAt6n' in parents",
        pageSize: 12,
        $fields: 'nextPageToken');
    List<DriveFileList> list = [];
    String? nextPageToken = filelist.nextPageToken;
    print(nextPageToken);
    if (filelist.files != null) {
      for (var file in filelist.files!) {
        print("Found file: ${file.name}, ${file.id}");
        list.add(DriveFileList(file.name!, file.id!));
      }
    }
    return DriveFile(list, nextPageToken);
  }
}
