import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis/sheets/v4.dart';
import 'package:sales_api/drive_api/drive.dart';
import 'package:sales_api/model/drive_file.dart';
import 'package:sales_api/model/invoice_details.dart';

final spreadsheetId = "1pfTY4YrJxXGpcm3SqT01O-3ZJ_L6E1jaz8AUVcTbcEQ";
final range = "invoice_details";

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
        q: "mimeType = 'application/vnd.google-apps.folder' and '1kfJOMMrie7zWdx3bKw3zslCvTmolqkuT' in parents and name contains '$contain'",
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

  Future<List<InvoiceDetails>> getInvoiceDetailList() async {
    final SheetsApi sheetsApi = SheetsApi(gDriveClient);
    final sheet = await sheetsApi.spreadsheets.values.get(spreadsheetId, range);
    final invoiceList = InvoiceDetailsList.fromJson(sheet.values?.toList());
    final sorted = invoiceList.invoiceDetailList.reversed.toList();
    return sorted;
  }
}
