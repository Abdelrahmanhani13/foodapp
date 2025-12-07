// this class will be used to store token in app by shared preferences and retrieve it when needed
// token will be store when user login or register successfully to avoid asking user to login again and again
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const String _tokenKey ='auth_token';

  static Future<void> saveToken(String token) async {
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs=await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final prefs=await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}