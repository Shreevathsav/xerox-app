// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:xerox_app/DTO/user.dart';
import 'package:xerox_app/components/orders_component.dart';
import 'package:xerox_app/components/upload_file_component.dart';
import 'package:xerox_app/screens/custom_drawer_screen.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.user}) : super(key: key);
  User user;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double height, width;

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    UploadFile(),
    OrdersComponent(),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomeDrawer(name: widget.user.getName(), email: widget.user.getEmail(),),
      appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Xerox App', style: TextStyle(color: Colors.white),),
            ],
          )),
      
      body: Center(
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey.shade900,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:height/48, horizontal: width/48) ,
          child: GNav(
            backgroundColor: Colors.blueGrey.shade900,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade700,
            gap: width/48,
            padding: EdgeInsets.all( width/72),
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                  _selectedIndex = index;
                });
            },
            tabs: [
              GButton(icon: Icons.upload_file, text: 'Upload',),
              GButton(icon: Icons.shopping_cart, text: 'Orders',),
            ],
          ),
        ),
      )
    );
  }
}