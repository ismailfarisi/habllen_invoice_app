import 'package:flutter/foundation.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis/sheets/v4.dart';
import 'package:sales_api/drive_api/drive.dart';
import 'package:sales_api/model/invoice_details.dart';

final spreadsheetId = "1pfTY4YrJxXGpcm3SqT01O-3ZJ_L6E1jaz8AUVcTbcEQ";
final range = "invoice_details";

class DriveApiLocal {
  final GDriveClient gDriveClient;
  final SheetsApi sheetsApi;

  DriveApiLocal(this.gDriveClient) : sheetsApi = SheetsApi(gDriveClient);

  Future<List<InvoiceDetails>> get getInvoiceDetailListFromSheets =>
      getInvoiceDetailListPrivate(sheetsApi);

  Future<Stream<List<int>>> getInvoicePDFFromDrive(
          String invoiceNo, String path) =>
      getInvoicePDFFromDrivePrivate(
          drive.DriveApi(gDriveClient), invoiceNo, path);

  @visibleForTesting
  Future<Stream<List<int>>> getInvoicePDFFromDrivePrivate(
      drive.DriveApi driveApi, String invoiceNo, String path) async {
    try {
      final pdfName = "$invoiceNo.pdf";
      final files = driveApi.files;
      final file = await files.list(
          q: "mimeType = 'application/pdf' and '1LmLePp8J1qTeQ3BCxD8nYQt7Wx71XJmY' in parents and name contains '$pdfName'",
          $fields: "files/id");
      String? fileId = file.files?[0].id;
      print(fileId);
      final drive.Media pdf = await files.get(fileId!,
          downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;
      return pdf.stream;
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @visibleForTesting
  Future<List<InvoiceDetails>> getInvoiceDetailListPrivate(
      SheetsApi sheetsApi) async {
    try {
      final sheet =
          await sheetsApi.spreadsheets.values.get(spreadsheetId, '$range');
      final List<InvoiceDetails> invoiceList = [];
      for (final row in sheet.values!.toList()) {
        invoiceList.add(InvoiceDetails.fromList(row));
      }
      final sorted = invoiceList.reversed.toList();
      print(sorted);
      return sorted;
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }
}
