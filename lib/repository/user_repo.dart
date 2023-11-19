import 'package:dio/dio.dart';

class UserRepo {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
  ));

  Future<Response> registerNewUser(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    final response = await dio.post('register', data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "image": "",
    });

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<Response> loginUser(
    String email,
    String password,
  ) async {
    final response = await dio.post('login', data: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to register');
    }
  }
}
