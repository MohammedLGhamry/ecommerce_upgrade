part of 'auth_user_cubit.dart';

@immutable
abstract class AuthUserState {}

class AuthUserInitial extends AuthUserState {}

class AuthLoading extends AuthUserState {}

class AuthSuccess extends AuthUserState {}

class AuthDataNotValid extends AuthUserState {
  final String msg;

  AuthDataNotValid(this.msg);
}

class AuthFailedUnExpected extends AuthUserState {
  final String msg;

  AuthFailedUnExpected(this.msg);
}

class GetUserData extends AuthUserState {
  final String name;
  final String phone;

  GetUserData(this.name,this.phone);
}

class LogoutSuccessfully extends AuthUserState{
}
