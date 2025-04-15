import 'package:get/get.dart';

class RoleController extends GetxController {
  var selectedRole = 'Employee'.obs; // Default selection

  void selectRole(String role) {
    selectedRole.value = role;
  }
}