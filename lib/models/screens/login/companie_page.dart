import 'package:employments/home_page.dart';
import 'package:employments/models/screens/login/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class CompaniePage extends StatefulWidget {
  const CompaniePage({Key? key}) : super(key: key);

  static String status = '';

  @override
  _CompaniePageState createState() => _CompaniePageState();
}

class _CompaniePageState extends State<CompaniePage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  int jobId = 0;
  int companyId = 0;

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
              padding: const EdgeInsets.only(top: 150),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        "¡Registre su empresa!",
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
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
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
                          Icons.house,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Nombre empresa",
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
                    controller: addressController,
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
                          Icons.location_on,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Direccion",
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
                    controller: phoneController,
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
                          Icons.phone,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      hintText: "Telefono",
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
              padding: const EdgeInsets.only(top: 60, left: 60, right: 60),
              child: InkWell(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    registerCompanie();
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

  void registerCompanie() async {
    if (nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        phoneController.text.isEmpty) {
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

    Future.delayed(const Duration(seconds: 1), createCompanie);
    Future.delayed(const Duration(seconds: 2), createJob);
    Future.delayed(const Duration(seconds: 3), createOffer);

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
        builder: (context) => const MyHomePage(),
      ),
    );
  }

  void createCompanie() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/companies/create');

    final response = await http.post(
      url,
      body: {
        'name': nameController.text,
        'direction': addressController.text,
        'phone': phoneController.text,
      },
    );

    final responseData = json.decode(response.body);
    final data = responseData['data'];

    companyId = data['id'];
  }

  void createJob() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/jobs/create');
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd').format(now);

    final response = await http.post(
      url,
      body: {
        'salary': "1000",
        'description':
            "Ejemplo de descripcion para la oferta de trabajo, ejemplo etc.",
        'address': "Avenida 123, ejemplo",
        'requirements': "Este es un ejemplo de requerimientos para el trabajo",
        'date': date,
      },
    );

    final responseData = json.decode(response.body);
    final data = responseData['data'];

    jobId = data['id'];
  }

  void createOffer() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/offers/create');

    final response = await http.post(
      url,
      body: {
        'title': "Oferta de trabajo ejemplo",
        'description':
            "Ejemplo de descripcion para la oferta de trabajo, ejemplo de como se veria etc.",
        'image': "datos.png",
        'user_id': "${AuthService.userId}",
        'job_id': jobId.toString(),
        'companie_id': companyId.toString(),
        'categorie_id': "21",
      },
    );

    final responseData = json.decode(response.body);
  }
}
