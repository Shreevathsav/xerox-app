
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xerox_app/backend/app_constants.dart';

class Logout{
   Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(AppConstants.jwt_key)){
      prefs.remove(AppConstants.jwt_key);
    }
  }
   getToken() async {
    String? token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(AppConstants.jwt_key)){
      token = prefs.get(AppConstants.jwt_key) as String?;
    }
    return token;
  }
  Future<bool> logout() async{
    String token = await getToken();
    bool isLogoutSuccessfull = false;
    var url = Uri.http(AppConstants.host, AppConstants.logoutEndpoint);
    // ignore: unnecessary_null_comparison
    if(token != null){
       var response = await http.post(url, headers: <String, String>{'Authorization': 'Bearer ' + token});
      if(response.statusCode == 200){
        removeToken();
        isLogoutSuccessfull = true;
      }   
    }  
    return isLogoutSuccessfull;
  }
}