import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xerox_app/DTO/loginDTO.dart';
import 'package:xerox_app/backend/app_constants.dart';

class Login {
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(AppConstants.jwt_key)){
      prefs.remove(AppConstants.jwt_key);
    }
    prefs.setString(AppConstants.jwt_key, token);
  }
  Future<Map<String, dynamic>?> login(LoginDTO loginDTO) async{
    var jsonData = jsonEncode(loginDTO.toJson());
    var url = Uri.http(AppConstants.host, AppConstants.loginEndpoint);
    var response = await http.post(url, body: jsonData, headers: <String, String>{'Content-Type':'application/json'});
    if(response.statusCode == 200){
      Map<String, dynamic> responseData = jsonDecode(response.body);
      saveToken(responseData["access_token"]);
      return responseData;
    }   
    return null;
  }
}
