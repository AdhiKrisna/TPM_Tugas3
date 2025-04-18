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
      showSnackbar(context, 'Username dan Password tidak boleh kosong', Colors.red);
      return;
    }
    UserModel? user = await _dbHelper.loginUser(username, password);
    username = usernameController.text;
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);
      showSnackbar(context, "Login Berhasil! Selamat Datang $username", Colors.green);
      Get.offAllNamed(RouteName.mainScreen, arguments: username);
    } else {
      showSnackbar(context, "Login Gagal! Kredential tidak valid", Colors.red);
    }
  }

  Future<void> register(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    if(username.length < 6 || username == ""){
      showSnackbar(context, 'Username minimal 6 karakter', Colors.red);
      return;
    }
    else if(password.length < 8 ){
      showSnackbar(context, 'Password minimal 8 karakter', Colors.red);
      return;
    }
    UserModel? existingUser = await _dbHelper.getUserByUsername(username);
    if (existingUser != null) {
      showSnackbar(context, 'Username sudah terdaftar', Colors.red);
      return;
    }
    UserModel user = UserModel(username: username, password: password);
    await _dbHelper.registerUser(user);
    showSnackbar(context, "Register Berhasil!", Colors.green);
    usernameController.clear();
    passwordController.clear();
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(RouteName.login);
    showSnackbar(context, "Logout Berhasil!", Colors.green);
  }

  void showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
