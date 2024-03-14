import 'package:employments/models/offer.dart';
import 'package:employments/widgets/bezier_widget.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late Future<List<Offer>> futureOffer = searchOffers();

  late Future<List<Offer>> futureRecentOffers = searchRecentOffers();
  late Future<List<Offer>> futureOffers = searchOffers();

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f8f8),
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 30),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(-5, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.black54,
                    size: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 30),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(-5, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.black54,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 17),
            child: SizedBox(
              height: 30,
              child: Text(
                "¡Hola Roberto!",
                style: TextStyle(
                  fontFamily: 'ltsaeada-light',
                  fontSize: 28,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SizedBox(
              height: 60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
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
                        padding: const EdgeInsets.only(bottom: 5),
                        child: TextField(
                          controller: searchController,
                          cursorColor: Colors.black54,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontFamily: 'ltsaeada-light',
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 14, top: 6),
                              child: Icon(
                                Icons.segment_sharp,
                                color: Colors.black54,
                                size: 25,
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 6, left: 10),
                              child: Icon(
                                Icons.search,
                                color: Colors.black54,
                                size: 25,
                              ),
                            ),
                            hintText: "Trabajos, empresas, categorías",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontFamily: 'ltsaeada-light',
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 350,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Mis Favoritos ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'ltsaeada-light',
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20, top: 10),
                        child: Text(
                          "Ver todos",
                          style: TextStyle(
                            fontFamily: 'ltsaeada-light',
                            fontSize: 17,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trabajos Recientes",
                  style: TextStyle(
                    fontFamily: 'ltsaeada-light',
                    fontSize: 20,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              height: 190,
              child: FutureBuilder<List<Offer>>(
                future: futureRecentOffers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Offer offer = snapshot.data![index];

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 150,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.01),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: const Offset(-5, 10),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 20),
                                            child: SizedBox(
                                              width: 200,
                                              child: Text(
                                                offer.title,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      "ltsaeada-regular",
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, left: 20),
                                            child: SizedBox(
                                              height: 60,
                                              width: 200,
                                              child: Text(
                                                offer.description,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black38,
                                                  fontFamily:
                                                      "ltsaeada-regular",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, top: 40),
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: const Offset(-5, 10),
                                            ),
                                          ],
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'profile/${offer.user.profilePhoto}',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
          ),
        ],
      ),
    );
  }

  Future<List<Offer>> searchOffers() async {
    try {
      String url = 'http://127.0.0.1:8000/api/offers';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);

        return jsonResponse.map((job) => Offer.fromJson(job)).toList();
      } else {
        throw Exception('Failed to load offer models');
      }
    } catch (e) {
      return <Offer>[];
    }
  }

  Future<List<Offer>> searchRecentOffers() async {
    try {
      String url = 'http://127.0.0.1:8000/api/offer/recents';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);

        return jsonResponse.map((job) => Offer.fromJson(job)).toList();
      } else {
        throw Exception('Failed to load offer models');
      }
    } catch (e) {
      return <Offer>[];
    }
  }
}
