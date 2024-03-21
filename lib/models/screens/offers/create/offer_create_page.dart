import 'package:employments/models/screens/login/auth_service.dart';
import 'package:employments/models/screens/login/register_login_page.dart';
import 'package:employments/models/screens/profile/my_profile_page.dart';
import 'package:employments/widgets/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class OfferCreatePage extends StatefulWidget {
  const OfferCreatePage({Key? key}) : super(key: key);

  @override
  _OfferCreatePageState createState() => _OfferCreatePageState();
}

class _OfferCreatePageState extends State<OfferCreatePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  String selectedImage = 'redes2.png';
  int jobId = 0;

  List<String> imageOptions = [
    'redes2.png',
    'analista.png',
    'back.png',
    'base-datos.png',
    'datos.png',
    'desarrollador.png',
    'financiero.png',
    'frond.png',
    'fullstack.png',
    'grafico.png',
    'movil.png',
    'negocio.png',
    'redes.png',
    'seguridad.png',
    'sistema2.png',
    'sistemas.png',
    'software.png',
    'soporte.png',
    'ui.png',
    'web.png',
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
                        "¡Creando una oferta!",
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
                        "Ingresa todos lo datos",
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
                backgroundImage: AssetImage("assets/$selectedImage"),
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
                            "Cambiar Icono",
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
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
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
                    controller: titleController,
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
                          Icons.edit,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Titulo de la oferta",
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
                    controller: requirementsController,
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
                          Icons.view_list_rounded,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Requisitos",
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
                    controller: salaryController,
                    cursorColor: Colors.black54,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
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
                          Icons.attach_money_outlined,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Salario",
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
                    controller: descriptionController,
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
                      hintText: "Descripcion del trabajo ...",
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
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
              child: InkWell(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  create();
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
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  void showAvatarMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Seleccione un icono",
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
                    "assets/${imageOptions[index]}",
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

  void create() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        requirementsController.text.isEmpty ||
        salaryController.text.isEmpty) {
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
    Future.delayed(const Duration(seconds: 1), createJob);
    Future.delayed(const Duration(seconds: 2), createOffer);

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
              "Empresa y usuario registrados correctamente",
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyProfilePage(user: AuthService.user!),
      ),
    );
  }

  void createJob() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/jobs/create');
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd').format(now);

    final response = await http.post(
      url,
      body: {
        'salary': salaryController.text,
        'description': descriptionController.text,
        "address": "asdasdasdasds",
        'requirements': requirementsController.text,
        'date': date,
      },
    );

    final responseData = json.decode(response.body);
    print(responseData);

    final data = responseData['data'];

    jobId = data['id'];
  }

  void createOffer() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/offers/create');

    final response = await http.post(
      url,
      body: {
        'title': titleController.text,
        'description': descriptionController.text,
        'image': selectedImage,
        'user_id': "${AuthService.userId}",
        'job_id': jobId.toString(),
        'companie_id': "${AuthService.companie!.id}",
        'categorie_id': 1,
      },
    );
    final responseData = json.decode(response.body);
  }
}
