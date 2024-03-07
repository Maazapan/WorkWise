import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: const Color.fromARGB(134, 33, 191, 253),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding:
                  EdgeInsets.only(left: 90, right: 90, top: 50, bottom: 30),
              child: Text(
                'W o r k W i s e',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'adelia',
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 60, right: 60, bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 33, bottom: 5),
                  child: TextField(
                    cursorColor: const Color.fromARGB(134, 33, 191, 253),
                    decoration: InputDecoration(
                      hintText: 'Trabajo Pesca, Diseño, Software, etc',
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.1), fontSize: 17),
                      border: InputBorder.none,
                      prefixIcon: const Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.search,
                            size: 25,
                            color: Color.fromARGB(134, 33, 191, 253),
                          )),
                    ),
                    style: const TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.01),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "Principal",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
              size: 30,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            label: "Trabajos Guardados",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            label: "Cuenta",
          ),
        ],
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          color: Colors.blue,
        ),
        selectedItemColor: const Color.fromARGB(134, 33, 191, 253),
        selectedFontSize: 15,
        unselectedFontSize: 15,
        elevation: 0.0,
      ),
    );
  }
}
