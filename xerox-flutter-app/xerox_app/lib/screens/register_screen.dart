// ignore_for_file: prefer_const_constructors, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:xerox_app/DTO/user.dart';
import 'package:xerox_app/backend/firebase_token.dart';
import 'package:xerox_app/backend/register.dart';
import 'package:xerox_app/components/form_component.dart';
import 'package:xerox_app/components/long_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late double height, width;
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userIDController = TextEditingController();
  final userMobileController = TextEditingController();
  final passwordController = TextEditingController();
  final conFirmPasswordController = TextEditingController();
  bool _isRegisteringIn = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: _isRegisteringIn?CircularProgressIndicator(): Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomForm(
                              controller: userNameController,
                              hintText: 'Name',
                              obscureText: false,
                            ),
                            SizedBox(
                        height: height / 150,
                      ),
                        CustomForm(
                              controller:userEmailController,
                              hintText: 'Email',
                              obscureText: false,
                            ),
                            SizedBox(
                        height: height / 150,
                      ),
                          CustomForm(
                              controller: userIDController,
                              hintText: 'College Id',
                              obscureText: false,
                            ),
                            SizedBox(
                        height: height / 150,
                      ),
                            CustomForm(
                              controller: userMobileController,
                              hintText: 'Mobile No.',
                              obscureText: false,
                            ),
                            SizedBox(
                        height: height / 150,
                      ),
                            CustomForm(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            SizedBox(
                        height: height / 150,
                      ),
                            CustomForm(
                              controller: conFirmPasswordController,
                              hintText: 'Confirm Password',
                              obscureText: true,
                            ),
                            SizedBox(
                        height: height / 150,
                      ),
                    ],
                  ),
                )),
                      SizedBox(
                        height: height / 72,
                      ),
                      GestureDetector(
                        child: LongButton(
                          buttonText: "Register",
                        ),
                        onTap: () async {
                          setState(() {
                                 _isRegisteringIn = true;
                                  });
                          if (passwordController.text ==
                              conFirmPasswordController.text) {
                                String? fcmToken = await FirebaseService.getFCMToken();
                                print(fcmToken);
                            int statusCode = await registerHelper(
                                userEmailController,
                                userIDController,
                                userNameController,
                                userMobileController,
                                passwordController,
                                conFirmPasswordController,
                                fcmToken!);
                                print(statusCode);
                            setState(() {
                                 _isRegisteringIn = false;
                                  });
                            if (statusCode == 200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Registred Sucessfully'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.pushNamed(context, "/login");
                            }
                          } else {}
                        },
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already registred ?"),
                          GestureDetector(
                            child: Text(
                              ' Login now',
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                            onTap: () => {Navigator.pop(context)},
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
        ));
  }

  Future<int> registerHelper(
      TextEditingController userEmailController,
      TextEditingController userIDController,
      TextEditingController userNameController,
      TextEditingController userMobileController,
      TextEditingController passwordController,
      TextEditingController conFirmPasswordController,
      String fcmToken) async {
    User user = User();
    Register register = Register();
    user.setName(userNameController.text);
    user.setEmail(userEmailController.text);
    user.setCollegeId(userIDController.text);
    user.setMobNo(userMobileController.text);
    user.setPassword(passwordController.text);
    user.setFcmToken(fcmToken);
    int statusCode = await register.register_user(user);
    return statusCode;
  }
}
