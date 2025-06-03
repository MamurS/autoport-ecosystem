import 'package:dio/dio.dart';
import 'package:shared_preferences.dart';

import '../constants/app_constants.dart';

class DioClient {
  final Dio _dio;
  final SharedPreferences _prefs;
  
  DioClient(this._dio) : _prefs = SharedPreferences.getInstance() {
    _dio.options.baseUrl = AppConstants.baseUrl;
    _dio.options.connectTimeout = Duration(milliseconds: AppConstants.connectionTimeout);
    _dio.options.receiveTimeout = Duration(milliseconds: AppConstants.receiveTimeout);
    
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _prefs.getString(AppConstants.tokenKey);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expired, try to refresh
            final newToken = await _refreshToken();
            if (newToken != null) {
              // Retry the original request with new token
              error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
              final response = await _dio.fetch(error.requestOptions);
              return handler.resolve(response);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }
  
  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _prefs.getString(AppConstants.refreshTokenKey);
      if (refreshToken == null) return null;
      
      final response = await _dio.post(
        '${AppConstants.authEndpoint}/refresh',
        data: {'refresh_token': refreshToken},
      );
      
      if (response.statusCode == 200) {
        final newToken = response.data['access_token'];
        await _prefs.setString(AppConstants.tokenKey, newToken);
        return newToken;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
  
  Dio get dio => _dio;
} 