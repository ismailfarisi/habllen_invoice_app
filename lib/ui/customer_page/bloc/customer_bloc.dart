import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/repository/repositoryimpl.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerInitial()) {
    late final Repository repository =
        RepositoryImpl(firebaseRepository: FirebaseRepository());
    on<WidgetInitiated>((event, emit) async {
      if (state.hasReachedMax) return;
      print(state.hasReachedMax);
      try {
        emit(state.copywith(status: Status.loading));
        List<Company> list = await repository.getCustomers();
        emit(state.copywith(
            customerList: list,
            status: Status.filesFetched,
            hasReachedMax: true));
      } on Exception {
        emit(state.copywith(status: Status.filesFetchingFailed));
      }
    });
  }
}
