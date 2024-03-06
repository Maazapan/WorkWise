import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        toolbarHeight: 190,
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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
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
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 60, right: 60, bottom: 45),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: const Padding(
                  // 10
                  padding: EdgeInsets.only(left: 33, right: 33, bottom: 5),
                  child: TextField(
                    cursorColor: Color.fromARGB(134, 33, 191, 253),
                    decoration: InputDecoration(
                      hintText: 'Buscador...',
                      border: InputBorder.none,
                      prefix: Padding(padding: EdgeInsets.only(top: 10)),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Color.fromARGB(134, 33, 191, 253),
                      ),
                    ),
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
    );
  }
}
