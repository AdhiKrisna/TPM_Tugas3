import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas3_tpm/helpers/database_helpers.dart';
import 'package:tugas3_tpm/models/user_model.dart';
import 'package:tugas3_tpm/routes/route_name.dart';

class AuthController {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userList = <UserModel>[];
  String username = '';
  
  Future<void> login(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    if(username == "" || password == ""){
      Get.snackbar("Login Failed", "Username and Password cannot be empty", snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    UserModel? user = await _dbHelper.loginUser(username, password);
    username = usernameController.text;
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);
      Get.snackbar("Login Success", "Welcome $username", snackPosition: SnackPosition.BOTTOM, 
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed(RouteName.mainScreen, arguments: username);
    } else {
      Get.snackbar("Login Failed", "Invalid Username or Password", snackPosition: SnackPosition.BOTTOM, 
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> register(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    if(username.length < 6 || username == ""){
      Get.snackbar("Register Failed", "Username should be at least 6 characters", snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    else if(password.length < 8 ){
      Get.snackbar("Register Failed", "Password should be at least 8 characters", snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    UserModel? existingUser = await _dbHelper.getUserByUsername(username);
    if (existingUser != null) {
      Get.snackbar("Register Failed", "Username sudah terdaftar", snackPosition: SnackPosition.BOTTOM, 
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    UserModel user = UserModel(username: username, password: password);
    await _dbHelper.registerUser(user);
    Get.snackbar("Register Success", "Account Created Successfully", snackPosition: SnackPosition.BOTTOM, 
        backgroundColor: Colors.green, colorText: Colors.white);
    usernameController.clear();
    passwordController.clear();
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(RouteName.login);
    Get.snackbar("Logout Success", "Logout Successfully", snackPosition: SnackPosition.BOTTOM, 
        backgroundColor: Colors.green, colorText: Colors.white);  
  }


}
