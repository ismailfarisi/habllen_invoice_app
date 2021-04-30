import 'package:googleapis/drive/v3.dart' as drive;

import '../drive_api.dart';

class DriveApi{
  final Map<String, String> authHeaders;
  final GDriveClient gDriveClient;

  DriveApi(this.authHeaders):
    gDriveClient = GDriveClient(authHeaders);
  
  void listInvoiceFromDrive() async{
    final drive.DriveApi driveApi = drive.DriveApi(gDriveClient);
    var files = driveApi.files;
    var filelist = await files.list(q: "mimeType = 'application/vnd.google-apps.folder'");
    for( var file in filelist.files){
      print("Found file: ${file.name}, ${file.id}");
    }
  }  
}