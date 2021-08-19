import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/bloc/drive/drive_bloc.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit(this.authenticationRepository)
      : driveBloc = DriveBloc(authenticationRepository),
        super(InvoiceInitial());
  final AuthenticationRepository authenticationRepository;
  final DriveBloc driveBloc;
}
