// ignore_for_file: file_names

class User{
  late String _name;
  late String _collegeId;
  late String _email;
  late String _mobNo;
  late String _password;
  String _role = "USER";
  late String _fcmToken;

  void setName(String name){
    _name = name;
  }
  void setCollegeId(String collegeId){
    _collegeId = collegeId;
  }
  void setEmail(String email){
    _email = email;
  }
  void setMobNo(String mobNo){
    _mobNo = mobNo;
  }
  void setPassword(String password){
    _password= password;
  }
  void setFcmToken(String fcmToken){
    _fcmToken= fcmToken;
  }

  String getFcmToken(){
    return _fcmToken;
  }

  String getName(){
    return _name;
  }
  String getCollegeId(){
    return _collegeId;
  }
  String getEmail(){
    return _email;
  }
  String getMobNo(){
    return _mobNo;
  }
  String getPassword(){
    return _password;
  }

   Map<String, dynamic> toJson() {
    return {
      'collegeId': _collegeId,
      'name': _name,
      'email': _email,
      'mobileNumber': _mobNo,
      'password': _password,
      'role' : _role,
      'userFcmToken' : _fcmToken
    };
   }

}