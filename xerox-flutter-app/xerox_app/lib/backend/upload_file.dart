import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xerox_app/backend/app_constants.dart';

class UploadFileBackend {
  getToken() async {
    String? token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstants.jwt_key)) {
      token = prefs.get(AppConstants.jwt_key) as String?;
    }
    return token;
  }

  Future<bool?> uploadPDF(File? selectedPdf) async {
    String token = await getToken();
    if (selectedPdf != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://' + AppConstants.host + '/' + AppConstants.printEndpoint),
      );
      request.files.add(
        http.MultipartFile(
          'document',
          selectedPdf.readAsBytes().asStream(),
          selectedPdf.lengthSync(),
          filename: selectedPdf.path.split('/').last,
        ),
      );
      request.fields['fileName'] = selectedPdf.path.split('/').last;
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['isPaid'] = 'true';

      var response = await request.send();
      if (response.statusCode == 200) {
        print('PDF uploaded successfully');
        return true;
      } else {
        print('Failed to upload PDF');
        return false;
      }
    } else {
      print('No PDF file selected');
      return null;
    }
  }
}
