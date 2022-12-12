import 'package:admin_dashboard/service/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base del url
    // _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
      // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      // "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el GET');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }
}
