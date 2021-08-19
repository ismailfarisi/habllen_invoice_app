import 'package:_discoveryapis_commons/src/api_requester.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:mockito/mockito.dart';
import 'package:sales_api/drive_api/drive.dart';
import 'package:sales_api/model/invoice_details.dart';
import 'package:sales_api/sales_api.dart';

class MockGDriveClient extends Mock implements GDriveClient {}

class MockDriveApi extends Mock implements DriveApi {
  @override
  FilesResource get files => super
      .noSuchMethod(Invocation.getter(#files), returnValue: MockFileResource());
}

class MockFileResource extends Mock implements FilesResource {
  @override
  Future<Object> get(String fileId,
      {bool? acknowledgeAbuse,
      String? includePermissionsForView,
      bool? supportsAllDrives,
      bool? supportsTeamDrives,
      String? $fields,
      DownloadOptions downloadOptions = DownloadOptions.metadata}) {
    final Stream<List<int>> stream = Stream.value([12225555]);
    return Future.value(Media(stream, 10));
  }

  @override
  Future<FileList> list(
      {String? corpora,
      String? corpus,
      String? driveId,
      bool? includeItemsFromAllDrives,
      String? includePermissionsForView,
      bool? includeTeamDriveItems,
      String? orderBy,
      int? pageSize,
      String? pageToken,
      String? q,
      String? spaces,
      bool? supportsAllDrives,
      bool? supportsTeamDrives,
      String? teamDriveId,
      String? $fields}) {
    return Future.value(FileList.fromJson({
      "files": [
        {"id": "1MH62iJqvL7iDMujfLBFYTYx1jkDohsgS"}
      ]
    }));
  }
}

class MockSpreadSheetResource extends Mock implements SpreadsheetsResource {
  @override
  SpreadsheetsValuesResource get values =>
      super.noSuchMethod(Invocation.getter(#values),
          returnValue: MockSpreadsheetsValuesResource());
}

class MockSpreadsheetsValuesResource extends Mock
    implements SpreadsheetsValuesResource {
  @override
  Future<ValueRange> get(String spreadsheetId, String range,
      {String? dateTimeRenderOption,
      String? majorDimension,
      String? valueRenderOption,
      String? $fields}) {
    return Future.value(ValueRange.fromJson(json));
  }
}

class MockValueRange extends Mock implements Future<ValueRange> {}

class MockApiRequester extends Mock implements ApiRequester {}

class MockSheetsApi extends Mock implements SheetsApi {
  @override
  SpreadsheetsResource get spreadsheets =>
      super.noSuchMethod(Invocation.getter(#spreadsheets),
          returnValue: SpreadsheetsResource(client));

  MockApiRequester get client => MockApiRequester();
}

// @GenerateMocks(
//     [GDriveClient, SheetsApi, SpreadsheetsResource, SpreadsheetsValuesResource])
void main() {
  final MockGDriveClient _mockClient = MockGDriveClient();
  final DriveApiLocal driveApiLocal = DriveApiLocal(_mockClient);
  setUp(() {});
  tearDown(() {});

  test('pull data from sheets', () async {
    final mockSheetsApi = MockSheetsApi();
    MockSpreadSheetResource spreadsheets = MockSpreadSheetResource();
    MockSpreadsheetsValuesResource values = MockSpreadsheetsValuesResource();

    when(mockSheetsApi.spreadsheets).thenReturn(spreadsheets);
    when(spreadsheets.values).thenReturn(values);
    expect(await driveApiLocal.getInvoiceDetailListPrivate(mockSheetsApi),
        isA<List<InvoiceDetails>>());
  });
  setUp(() async {
    // Create a temporary directory.
  });
  final MockDriveApi mockDriveApi = MockDriveApi();
  final MockFileResource mockFileResource = MockFileResource();
  test('download and save pdf form drive', () {
    when(mockDriveApi.files).thenReturn(mockFileResource);
    driveApiLocal.getInvoicePDFFromDrivePrivate(mockDriveApi, "100001", '');
  });
}

final json = {
  "range": "invoice_details!A1:Z998",
  "majorDimension": "ROWS",
  "values": [
    [
      "1",
      "100001",
      "18-Feb-20",
      "Aishwarya Enterprises",
      "180,600.00",
      "closed"
    ],
    ["2", "100002", "3-Mar-20", "Aishwarya Enterprises", "36,400.00", "closed"],
    ["3", "100003", "6-Jul-20", "Banque Group", "22,800.00", "closed"],
    ["4", "100004", "29-Jul-20", "Dia Retail Solutions", "2,210.00", "closed"],
    ["5", "100005", "6-Aug-20", "Dia Retail Solutions", "742.00", "open"],
    ["6", "100006", "19-Aug-20", "Dia Retail Solutions", "53,760.00", "closed"],
    [
      "7",
      "100007",
      "21-Aug-20",
      "Aishwarya Enterprises",
      "21,560.00",
      "closed"
    ],
    ["8", "100008", "21-Aug-20", "Boson Packaging", "21,560.00", "closed"],
    ["9", "100009", "7-Sep-20", "Banque Group", "23,800.00", "closed"],
    ["10", "100010", "10-Sep-20", "Dia Retail Solutions", "7,840.00", "closed"],
    ["11", "100011", "16-Sep-20", "Banque Group", "45,920.00", "closed"],
    [
      "12",
      "100012",
      "21-Sep-20",
      "Dia Retail Solutions",
      "35,840.00",
      "closed"
    ],
    ["13", "100013", "6-Oct-20", "Dia Retail Solutions", "38,640.00", "closed"],
    [
      "14",
      "100014",
      "6-Oct-20",
      "Aishwarya Enterprises",
      "21,560.00",
      "closed"
    ],
    ["15", "100015", "6-Oct-20", "Beauty Velvettes", "24,640.00", "closed"],
    ["16", "100016", "24-Oct-20", "Dia Retail Solutions", "2,800.00", "closed"],
    ["17", "100017", "25-Oct-20", "Banque Group", "22,960.00", "closed"],
    ["18", "100018", "25-Oct-20", "Banque Group", "22,960.00", "closed"],
    [
      "19",
      "100019",
      "24-Dec-20",
      "Dia Retail Solutions",
      "38,640.00",
      "closed"
    ],
    ["20", "100020", "24-Dec-20", "Boson Packaging", "21,560.00", "open"],
    ["21", "100021", "6-Jan-21", "Banque Group", "27,160.00", "closed"],
    ["22", "100022", "8-Jan-21", "Boson Packaging", "21,560.00", "open"],
    ["23", "100023", "12-Jan-21", "Banque Group", "27,160.00", "closed"],
    [
      "24",
      "100024",
      "22-Jan-21",
      "Dia Retail Solutions",
      "35,840.00",
      "closed"
    ],
    ["25", "100025", "12-Feb-21", "Boson Packaging", "21,000.00", "open"],
    [
      "26",
      "100026",
      "18-Feb-21",
      "Dia Retail Solutions",
      "49,817.00",
      "closed"
    ],
    ["27", "100027", "23-Feb-21", "Banque Group", "54,320.00", "closed"],
    ["28", "100028", "25-Feb-21", "Boson Packaging", "43,120.00", "open"],
    ["29", "100029", "25-Mar-21", "Boson Packaging", "79,520.00", "open"],
    ["30", "100030", "25-Mar-21", "Beauty Velvettes", "35,840.00", "open"],
    ["31", "100031", "29-Mar-21", "Beauty Velvettes", "24,640.00", "open"],
    ["32", "100032", "15-Apr-21", "Spero", "38,640.00", "open"]
  ]
};
