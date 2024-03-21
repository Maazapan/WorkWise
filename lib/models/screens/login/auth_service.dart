import 'dart:convert';

import 'package:employments/home_page.dart';
import 'package:employments/models/screens/login/login_page.dart';
import 'package:employments/models/user.dart';
import 'package:employments/models/companie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static int userId = 0;
  static User? user;
  static Companie? companie;

  static String token = '';
  static bool companieAccount = false;

  static Future<void> login(
      BuildContext context, String email, String password) async {
    final url = Uri.parse('https://barrios.terrabyteco.com/api/auth/login');

    try {
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.black54,
            duration: Duration(seconds: 1),
            content: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Llena todos los campos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'ltsaeada-light',
                  ),
                ),
              ],
            ),
          ),
        );
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.black54,
            duration: Duration(seconds: 1),
            content: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Constraseña o correo incorrecto",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'ltsaeada-light',
                  ),
                ),
              ],
            ),
          ),
        );
        return;
      }

      final profile = responseData['profile'];
      userId = profile['id'];
      token = responseData['access_token'].toString();
      user = User.fromJson(profile);
      haveCompanieAccount();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black54,
          duration: Duration(seconds: 1),
          content: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                "Error: ${error.toString()}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'ltsaeada-light',
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  static Future<void> register(BuildContext context, String name, String email,
      String password, String profilePhoto, String bio) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/auth/register');
    try {
      final response = await http.post(
        url,
        body: {
          'name': name,
          'bio': bio,
          'profile_photo': profilePhoto,
          'email': email,
          'password': password,
        },
      );

      final responseData = json.decode(response.body);

      if (response.statusCode != 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.black54,
            duration: Duration(seconds: 1),
            content: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Algo salió mal, intenta de nuevo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'ltsaeada-light',
                  ),
                ),
              ],
            ),
          ),
        );
        return;
      }
      final profile = responseData['profile'];
      userId = profile['id'];
      token = responseData['access_token'].toString();
      user = User.fromJson(profile);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black54,
          duration: Duration(seconds: 1),
          content: Row(
            children: [
              Icon(
                Icons.check_sharp,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                "Usuario registrado correctamente",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'ltsaeada-light',
                ),
              ),
            ],
          ),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black54,
          duration: Duration(seconds: 1),
          content: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                "Error: ${error.toString()}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'ltsaeada-light',
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  static void haveCompanieAccount() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/companie/user/');

    final response = await http.post(
      url,
      body: {
        'user_id': userId.toString(),
      },
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      companieAccount = true;
      companie = Companie.fromJson(responseData['companie']);
    }
  }
}
