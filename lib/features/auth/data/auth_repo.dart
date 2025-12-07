import 'package:dio/dio.dart';
import 'package:foodapp/core/error/failure.dart';
import 'package:foodapp/core/network/api_service.dart';
import 'package:foodapp/core/utils/pref_helper.dart';
import 'package:foodapp/features/auth/data/model/user_model.dart';

class AuthRepo {
  final ApiService apiService;
  AuthRepo(this.apiService);

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.postRequest('/login', {
        'email': email,
        'password': password,
      });
      final user = UserModel.fromJson(response['data']);
      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }
      return user;
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw failure;
    } catch (e) {
      throw ServerFailure('Unexpected Error, Please try again!');
    }
  }

  Future<UserModel?> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.postRequest('/register', {
        'name': name,
        'email': email,
        'password': password,
      });
      final user = UserModel.fromJson(response['data']);
      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }
      return user;
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw failure;
    } catch (e) {
      throw ServerFailure('Unexpected Error, Please try again!');
    }
  }

  Future<UserModel?> getUserProfile() async {
    try {
      final response = await apiService.getRequest('/profile');
      final user = UserModel.fromJson(response['data']);
      return user;
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw failure;
    } catch (e) {
      throw ServerFailure('Unexpected Error, Please try again!');
    }
  }

  // في ملف auth_repo.dart
  
}
