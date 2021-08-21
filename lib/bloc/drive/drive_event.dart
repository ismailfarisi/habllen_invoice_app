part of 'drive_bloc.dart';

class DriveEvent extends Equatable {
  const DriveEvent();

  @override
  List<Object?> get props => [];
}

class FilesFetched extends DriveEvent {}

<<<<<<< HEAD
class CreateNewInvoicwBtnPressed extends DriveEvent {}

=======
>>>>>>> refs/remotes/origin/master
class KeywordChanged extends DriveEvent {
  final String keyword;

  const KeywordChanged(this.keyword);

  @override
  List<Object?> get props => [keyword];
}
