import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'role_controller.dart';
import 'role_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Role Selection',
      debugShowCheckedModeBanner: false,
      home: RoleSelectionScreen(),
    );
  }
}


//added some thing