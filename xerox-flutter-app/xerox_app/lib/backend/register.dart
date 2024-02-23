
// ignore_for_file: non_constant_identifier_names

import 'package:xerox_app/DTO/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'app_constants.dart';

class Register{
  Future<int> register_user(User user) async{
    var jsonData = jsonEncode(user.toJson());
    print(jsonData);
    var url = Uri.http(AppConstants.host, AppConstants.registerEndpoint);
    var response = await http.post(url, body: jsonData, headers: <String, String>{'Content-Type':'application/json'});
    return response.statusCode;
  }
}