import 'package:bloc/bloc.dart';
import 'package:ecommerce/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  final UserRepo userRepo = UserRepo();

}
