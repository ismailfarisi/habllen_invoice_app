import 'package:http/http.dart' as http;

class GDriveClient extends http.BaseClient {
  final http.Client _client = new http.Client();
  final Map<String, String> _authHeaders;

  GDriveClient(this._authHeaders);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_authHeaders));
  }
}
