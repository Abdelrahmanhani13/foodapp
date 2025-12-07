import 'package:dio/dio.dart';
import 'package:foodapp/core/utils/pref_helper.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // this part is for adding token to each request if available
  // before any request is sent interceptor add token to headers automatically
  // you don't need to add it manually in each request to authorization headers
  ApiClient() {
    _dio.interceptors.add(
      // interceptor to add token to each request and add responsible to add it
      InterceptorsWrapper(
        // wrapper allowing you to control in three stages of request/response lifecycle
        onRequest: (options, handler) async {
          // options have all request info like headers,method,url and handler to apply or cancel the request
          final token = await PrefHelper.getToken() ?? '';
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options); // complete the request after adding token (edit)
        },
      ),
    );
  }
  Dio get dio => _dio;
}
