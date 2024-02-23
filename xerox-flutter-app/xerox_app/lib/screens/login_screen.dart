// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:xerox_app/DTO/loginDTO.dart';
import 'package:xerox_app/DTO/user.dart';
import 'package:xerox_app/backend/login.dart';
import 'package:xerox_app/components/form_component.dart';
import 'package:xerox_app/components/long_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double height, width;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoogingIn = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body:Center(
          child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: _isLoogingIn? CircularProgressIndicator(): Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              color: Colors.blueGrey[900],
                            ),
                            SizedBox(
                              height: height / 24,
                            ),
                            CustomForm(
                              controller: userNameController,
                              hintText: 'Email',
                              obscureText: false,
                            ),
                            SizedBox(
                              height: height / 24,
                            ),
                            CustomForm(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            SizedBox(
                              height: height / 72,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Text('Forget Password ?'),
                                    onTap: () => {},
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 40,
                            ),
                            GestureDetector(
                              child: LongButton(
                                buttonText: "Log in",
                              ),
                              onTap: () async{
                                setState(() {
                                 _isLoogingIn = true;
                                  });
                                Map<String, dynamic>? userData = await loginHelper(userNameController, passwordController);
                                
                                if(userData != null){
                                  User user = User();
                                  user.setEmail(userData["email"]);
                                  user.setCollegeId(userData["collegeId"]);
                                  user.setMobNo(userData["mobileNumber"]);
                                  user.setName(userData["name"]);
                                  setState(() {
                                 _isLoogingIn = false;
                                  });
                                  Navigator.pushNamed(context, "/main_screen", arguments: user);
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Login Failed'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                            ),
                             SizedBox(
                              height: height / 72,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("New here ?"),
                                GestureDetector(
                                  child: Text(
                                    ' Register now',
                                    style: TextStyle(
                                      color: Colors.blue[900]
                                    ),
                                  ),
                                  onTap: ()=>{
                                    Navigator.pushNamed(context, "/register")
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ))
          
        )),
        ) 
        );
  }
  Future<Map<String, dynamic>?> loginHelper(TextEditingController userNameController, TextEditingController passwordController) async{
    LoginDTO loginDTO = LoginDTO();
    Login login = Login();
    loginDTO.setEmail(userNameController.text);
    loginDTO.setPassword(passwordController.text);
    Map<String, dynamic>? userData = await login.login(loginDTO);
    return userData;
  }
}
