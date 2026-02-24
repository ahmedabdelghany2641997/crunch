import 'package:bloc/bloc.dart';
import 'package:crunch/features/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.dio) : super(InitialState());
  final Dio dio;

  Future<void> login({required String name, required String pass}) async {
    emit(LoadingState());
    try {
      final res = await dio.post(
        "https://dummyjson.com/auth/login",
        data: {
          "username": name, "password": pass,
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (res.statusCode == 200) {
        String token = res.data["accessToken"];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);
        emit(SuccessState());
      }
    } on DioException catch (e) {
      print(e.toString());
      emit(ErrorState(error: e.toString()));
    }
  }
}
