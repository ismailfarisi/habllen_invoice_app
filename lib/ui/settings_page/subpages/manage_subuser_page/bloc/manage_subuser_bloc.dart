import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/repository/repository.dart';

part 'manage_subuser_event.dart';
part 'manage_subuser_state.dart';
part 'manage_subuser_bloc.freezed.dart';

class ManageSubusersBloc extends Bloc<ManageSubuserEvent, ManageSubuserState> {
  ManageSubusersBloc({required this.repository}) : super(_Initial()) {
    on<ManageSubuserEvent>((event, emit) {});
  }
  final Repository repository;
}
