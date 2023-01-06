import 'dart:convert';
import 'dart:developer';

import 'package:ev_ui_admin/models/resident.dart';
import 'package:ev_ui_admin/services/globals.dart';
import 'package:http/http.dart';

class ApiService {
  static Future<bool> verifyStatus(
      {required String userId, required bool verified}) async {
    try {
      String url = baseURL + 'verify/';
      Response response = await put(Uri.parse(url),
          body: jsonEncode({'user_id': userId, 'verified': verified}),
          headers: headersWithoutToken);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<List<Resident>> getResidents() async {
    try {
      String url = baseURL + 'residents/';
      Response response =
          await get(Uri.parse(url), headers: headersWithoutToken);
      log(response.body.toString());
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => Resident.fromMap(e)).toList();
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> deleteResidents({required String userId}) async {
    try {
      String url = baseURL + 'deleteuser/';
      Response response = await delete(Uri.parse(url),
          body: jsonEncode({
            'user_id': userId,
          }),
          headers: headersWithoutToken);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
