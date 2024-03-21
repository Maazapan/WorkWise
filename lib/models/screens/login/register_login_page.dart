import 'package:employments/home_page.dart';
import 'package:employments/models/screens/login/auth_service.dart';
import 'package:employments/models/screens/login/companie_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterLoginPage extends StatefulWidget {
  const RegisterLoginPage({Key? key}) : super(key: key);

  static String status = '';

  @override
  _RegisterLoginPageState createState() => _RegisterLoginPageState();
}

class _RegisterLoginPageState extends State<RegisterLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  bool _isObscure = true;
  bool _isChecked = false;

  String selectedImage = 'profile1.png';

  List<String> imageOptions = [
    'profile1.png',
    'profile2.png',
    'profile3.png',
    'profile4.png',
    'profile5.png',
    'profile6.png',
  ];

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
        backgroundColor: const Color(0xFFf8f8f8),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        "¡Registra una Cuenta!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 28,
                          fontFamily: 'ltsaeada-light',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, left: 30),
                      child: Text(
                        "Ingrese los datos para registrarla",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontFamily: 'ltsaeada-light',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black12,
                backgroundImage: AssetImage("assets/profile/$selectedImage"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  showAvatarMenu();
                },
                child: Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                  child: const Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.photo,
                            color: Colors.black54,
                            size: 18,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Cambiar Avatar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black45,
                              fontFamily: 'ltsaeada-light',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
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
                    controller: nameController,
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
                          Icons.person,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Nombre de Usuario",
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
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
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
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
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
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
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
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Container(
                height: 100,
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
                    maxLines: 3,
                    maxLength: 100,
                    controller: bioController,
                    cursorColor: Colors.black54,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontFamily: 'ltsaeada-light',
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Icon(
                          Icons.chat_bubble,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Biografia ...",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'ltsaeada-light',
                        fontSize: 17,
                      ),
                      counterStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'ltsaeada-light',
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 15),
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
                  padding: EdgeInsets.only(left: 5, top: 15),
                  child: Text(
                    "Cuenta tipo empresa",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontFamily: 'ltsaeada-light',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
              child: InkWell(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    registerUser();
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 112, 112, 112),
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
          ],
        ),
      ),
    );
  }

  void registerUser() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        bioController.text.isEmpty) {
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

    if (!_isChecked) {
      AuthService.register(context, nameController.text, emailController.text,
          passwordController.text, selectedImage, bioController.text);

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
      });
      return;
    }

    AuthService.register(context, nameController.text, emailController.text,
        passwordController.text, selectedImage, bioController.text);

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CompaniePage(),
        ),
      );
    });
  }

  void showAvatarMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Seleccione un avatar",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'ltsaeada-light',
              fontSize: 24,
            ),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: imageOptions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImage = imageOptions[index];
                    });
                    Navigator.of(context).pop(); // Cierra el diálogo
                  },
                  child: Image.asset(
                    "assets/profile/${imageOptions[index]}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
