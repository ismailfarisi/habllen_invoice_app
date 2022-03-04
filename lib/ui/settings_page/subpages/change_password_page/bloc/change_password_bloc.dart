import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/repository/auth_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';
part 'change_password_bloc.freezed.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({required AuthenticationRepository repository})
      : _authRepository = repository,
        super(ChangePasswordState()) {
    on<ChangePasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final AuthenticationRepository _authRepository;
}
