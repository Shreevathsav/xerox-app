// ignore_for_file: file_names

class LoginDTO{
  late String _email;
  late String _password;


  String getEmail(){
    return _email;
  }
  String getPassword(){
    return _password;
  }
  void setEmail(String email){
    _email =email;
  }
  void setPassword(String password){
    _password = password;
  }
  Map<String, dynamic> toJson() {
    return {
      'email': _email,
      'password': _password
    };
   }

}