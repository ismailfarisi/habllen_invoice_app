import 'package:googleapis/drive/v3.dart' as drive;

import '../drive_api.dart';

class DriveApiLocal {
  final Map<String, String> authHeaders;
  final GDriveClient gDriveClient;

  DriveApiLocal(this.authHeaders) : gDriveClient = GDriveClient(authHeaders);

  Future<void> listInvoiceFromDrive() async {
    final drive.DriveApi driveApi = drive.DriveApi(gDriveClient);
    var files = driveApi.files;
    var filelist =
        await files.list(q: "mimeType = 'application/vnd.google-apps.folder'");
    if (filelist.files != null) {
      for (var file in filelist.files!) {
        print("Found file: ${file.name}, ${file.id}");
      }
    }
  }
}
