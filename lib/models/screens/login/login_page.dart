import 'package:employments/models/screens/login/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String status = '';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 270, left: 30, right: 30),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(-5, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 7, left: 10),
                child: TextField(
                  controller: emailController,
                  cursorColor: Colors.black54,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontFamily: 'ltsaeada-light',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.email,
                        color: Colors.black54,
                        size: 18,
                      ),
                    ),
                    hintText: "Correo electronico",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontFamily: 'ltsaeada-light',
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(-5, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 7, left: 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  cursorColor: Colors.black54,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontFamily: 'ltsaeada-light',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 6, right: 5),
                      child: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black54,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.password,
                        color: Colors.black54,
                        size: 18,
                      ),
                    ),
                    hintText: "Contraseña",
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                      fontFamily: 'ltsaeada-light',
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Checkbox(
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Text(
                  "Guardar sesion",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontFamily: 'ltsaeada-light',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  "${LoginPage.status}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontFamily: 'ltsaeada-light',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
            child: InkWell(
              onTap: () {
                setState(() {
                  AuthService.login(
                    context,
                    emailController.text,
                    passwordController.text,
                  );
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.01),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(-5, 10),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continuar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'ltsaeada-regular',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Nuevo usuario? Registrate",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 17,
                fontFamily: 'ltsaeada-light',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
