import 'package:googleapis/drive/v3.dart' as drive;
import 'package:sales_api/drive_api/drive.dart';
import 'package:sales_api/model/drive_file.dart';

class DriveApiLocal {
  final Map<String, String> authHeaders;
  final GDriveClient gDriveClient;

  DriveApiLocal(this.authHeaders) : gDriveClient = GDriveClient(authHeaders);

  Future<DriveFile> listInvoiceFromDrive(
      [String? nextPageTokens, String? contains]) async {
    final drive.DriveApi driveApi = drive.DriveApi(gDriveClient);
    final contain = (contains != null) ? contains : "";
    var files = driveApi.files;
    var filelist = await files.list(
        q: "mimeType = 'application/vnd.google-apps.folder' and '1BqNY8_mUiIpIs7wIuGuQjqlfdvGaAt6n' in parents and name contains '$contain'",
        pageSize: 10,
        pageToken: nextPageTokens,
        $fields: "nextPageToken,files");
    List<DriveFileList> list = [];
    String? nextPageToken = filelist.nextPageToken;
    print('nextPageToken is $nextPageToken');
    if (filelist.files != null) {
      for (var file in filelist.files!) {
        print("Found file: ${file.name}, ${file.id}");
        list.add(DriveFileList(file.name!, file.id!));
      }
    }
    return DriveFile(list, nextPageToken);
  }
}
