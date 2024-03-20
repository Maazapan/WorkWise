import 'dart:convert';

import 'package:employments/home_page.dart';
import 'package:employments/models/screens/login/login_page.dart';
import 'package:employments/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static int userId = 0;
  static User? user;
  static String token = '';

  static Future<void> login(
      BuildContext context, String email, String password) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/auth/login');

    try {
      LoginPage.status = '';

      if (email.isEmpty || password.isEmpty) {
        LoginPage.status = 'Llena todos los campos';
        return;
      }

      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      final responseData = json.decode(response.body);

      if (response.statusCode != 200) {
        LoginPage.status = 'Contraseña Incorrecta';
        return;
      }

      final profile = responseData['profile'];
      userId = profile['id'];
      token = responseData['access_token'].toString();
      user = User.fromJson(profile);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } catch (error) {
      print(error);
      //LoginPage.status = error.toString();
    }
  }
}
