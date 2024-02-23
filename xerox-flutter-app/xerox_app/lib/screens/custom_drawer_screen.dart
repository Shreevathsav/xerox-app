// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:xerox_app/backend/logout.dart';

class CustomeDrawer extends StatelessWidget {
  CustomeDrawer({Key? key, required this.email, required this.name})
      : super(key: key);
  late double height, width;
  String name;
  String email;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Drawer(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Column(children: [
              UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.logout_sharp),
                title: Text('Logout'),
                onTap: () async {
                  bool isLogoutSuccessfull = await logoutHelper();
                  if (isLogoutSuccessfull) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Logout Failed'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              )
            ])
          ],
        ),
      ),
    );
  }

  static Future<bool> logoutHelper() async {
    Logout logout = Logout();
    bool isLogoutSuccessfull = await logout.logout();
    return isLogoutSuccessfull;
  }
}
