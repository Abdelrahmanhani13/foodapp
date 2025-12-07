import 'package:dio/dio.dart';
import 'package:foodapp/core/error/failure.dart';
import 'package:foodapp/core/network/api_client.dart';

class ApiService {
  final ApiClient _apiClient;
  ApiService(this._apiClient);

  Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await _apiClient.dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw failure;
    } catch (e) {
      throw ServerFailure('Unexpected Error, Please try again!');
    }
  }

  Future<dynamic> postRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await _apiClient.dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw failure;
    } catch (e) {
      throw ServerFailure('Unexpected Error, Please try again!');
    }
  }

  Future<dynamic> putRequest(String endpoint, dynamic data) async {
    try {
      final response = await _apiClient.dio.put(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw failure;
    } catch (e) {
      throw ServerFailure('Unexpected Error, Please try again!');
    }
  }

  Future<dynamic> deleteRequest(String endpoint) async {
    try {
      final response = await _apiClient.dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      throw failure;
    } catch (e) {
      throw ServerFailure('Unexpected Error, Please try again!');
    }
  }
}
