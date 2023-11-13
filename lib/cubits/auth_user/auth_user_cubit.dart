import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/login_response_model.dart';
import 'package:ecommerce/models/registration_response_model.dart';
import 'package:ecommerce/repository/user_repo.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_user_state.dart';

class AuthUserCubit extends Cubit<AuthUserState> {
  AuthUserCubit() : super(AuthUserInitial());

  final UserRepo userRepo = UserRepo();

  void register(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      emit(AuthLoading());

      final res = await userRepo.registerNewUser(name, email, phone, password);
      // print(res);
      final regRes = RegistrationResponseModel.fromJson(res.data);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (regRes.status == true) {
        await prefs.setString('access-token', regRes.data?.token ?? '');

        emit(AuthSuccess());
      } else {
        emit(AuthDataNotValid(regRes.message));
      }
    } catch (e) {
      emit(AuthFailedUnExpected(e.toString()));
    }
  }

  void login(
    String email,
    String password,
  ) async {
    try {
      emit(AuthLoading());
      final res = await userRepo.loginUser(email, password);
      final loginRes = LoginResponseModel.fromJson(res.data);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (loginRes.status == true) {
        await prefs.setString('access-token', loginRes.data?.token ?? '');
        emit(AuthSuccess());

        await prefs.setString('name', loginRes.data?.name ?? '');
        await prefs.setString('phone', loginRes.data?.phone ?? '');

        emit(GetUserData(loginRes.data?.name ?? '', loginRes.data?.phone ?? ''));
      } else {
        emit(AuthDataNotValid(loginRes.message));
      }

    } catch (e) {
      emit(AuthFailedUnExpected(e.toString()));
    }
  }
}
