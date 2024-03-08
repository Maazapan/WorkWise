import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/offeritem.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Offer>> fetchOffer() async {
  final response = await http.get(
    Uri.parse('http://127.0.0.1:8000/api/offers'),
  );

  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((job) => Offer.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load offer models');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Offer>> futureOffer;

  @override
  void initState() {
    super.initState();
    futureOffer = fetchOffer();
  }

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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                // EdgeInsets.only(left: 90, right: 90, top: 50, bottom: 30),
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
                          color: Colors.black.withOpacity(0.2),
                          fontSize: 17,
                          fontFamily: "ltsaeada-light"),
                      border: InputBorder.none,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Color.fromARGB(134, 33, 191, 253),
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        color: Colors.black45,
                        fontFamily: "ltsaeada-light",
                        fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Offer>>(
          future: futureOffer,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Offer job = snapshot.data![index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfferItem(id: job.id),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.06),
                        ),
                        child: Center(child: Text(job.id.toString())),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.03),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_outline,
              size: 30,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            label: " ",
          ),
        ],
        selectedItemColor: const Color.fromARGB(134, 33, 191, 253),
        elevation: 0.0,
      ),
    );
  }
}
