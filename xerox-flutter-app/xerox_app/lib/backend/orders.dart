import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xerox_app/backend/app_constants.dart';
import 'dart:convert';

class OrdersBackend {
  getToken() async {
    String? token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstants.jwt_key)) {
      token = prefs.get(AppConstants.jwt_key) as String?;
    }
    return token;
  }

  Future<dynamic> getOrders() async {
    String token = await getToken();
    var response = await http.get(
        Uri.parse(
            'http://' + AppConstants.host + '/' + AppConstants.getOrdersByUser),
            headers: {'Authorization': 'Bearer $token'},
      );
      return json.decode(response.body);
  }
}
