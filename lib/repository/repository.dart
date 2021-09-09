import 'package:habllen/repository/remote/remote.dart';

class Repository {
  getCustomers() async => await RemoteRepository().getCustomers();
}
