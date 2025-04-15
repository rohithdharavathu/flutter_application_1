import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'role_controller.dart';
import 'employee_registration_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  final RoleController controller = Get.put(RoleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A3C34), // Dark teal background
      body: Column(
        children: [
          // Top half of the screen with dark teal background
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF1A3C34),
            ),
          ),
          // Bottom half with white container
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    // Title
                    Text(
                      "Choose Your Role",
                      style: TextStyle(
                        color: Color(0xFF1A3C34),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Subtitle
                    Text(
                      "How do you want to get started?",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Radio buttons
                    Expanded(
                      child: Obx(() => Column(
                            children: [
                              _buildRoleOption(
                                title: "I'm an Owner",
                                description:
                                    "Manage employees, orders, and operation",
                                value: 'Owner',
                                groupValue: controller.selectedRole.value,
                                onChanged: controller.selectRole,
                              ),
                              SizedBox(height: 16),
                              _buildRoleOption(
                                title: "I'm an Employee",
                                description:
                                    "Access your assigned tasks and responsibilities",
                                value: 'Employee',
                                groupValue: controller.selectedRole.value,
                                onChanged: (value) {
                                  controller.selectRole(value);
                                  if (value == 'Employee') {
                                    Get.to(() => EmployeeRegistrationScreen());
                                  }
                                },
                                isSelected: true,
                              ),
                            ],
                          )),
                    ),
                    // Terms and Privacy Policy
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                                text: "By continuing, you agree to our "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: " and "),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleOption({
    required String title,
    required String description,
    required String value,
    required String groupValue,
    required Function(String) onChanged,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE6F5F2) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xFF1A3C34) : Colors.grey[300]!,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Radio button
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Color(0xFF1A3C34) : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: groupValue == value
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1A3C34),
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 16),
            // Title and description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}