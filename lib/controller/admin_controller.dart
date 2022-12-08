import 'dart:convert';
import 'dart:developer';

import 'package:ev_ui_admin/services/globals.dart';
import 'package:http/http.dart';

class AdminController {
  static Future<Map<String, dynamic>?> register({
    required String name,
    required String identityno,
    required String password,
  }) async {
    String url = baseURL + 'auth/register';
    var response = await post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'name': name,
          'identityno': identityno,
          'password': password,
        },
      ),
      headers: headersWithoutToken,
    );
    log(response.body);
    if (response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> login({
    required String identityno,
    required String password,
  }) async {
    String url = baseURL + 'auth/login';
    var response = await post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'identityno': identityno,
          'password': password,
        },
      ),
      headers: headersWithoutToken,
    );
    log(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    return null;
  }
}
