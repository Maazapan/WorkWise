import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/offers/offer_page_item.dart';
import 'package:employments/models/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Offer>> futureOffer;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureOffer = searchOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.02),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    onChanged: (value) {
                      setState(() {
                        futureOffer = searchOffers();
                      });
                    },
                    cursorColor: const Color.fromARGB(134, 33, 191, 253),
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Trabajo Pesca, Diseño, etc',
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
                  Offer offer = snapshot.data![index];

                  return InkWell(
                    hoverColor: Colors.black.withOpacity(0.03),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfferPageItem(offer: offer),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(134, 33, 191, 253)
                                      .withOpacity(0.04),
                                ),
                                child: Image(
                                  image: AssetImage(offer.image),
                                  color:
                                      const Color.fromARGB(134, 33, 191, 253),
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 280,
                                      height: 50,
                                      child: Text(
                                        offer.title,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ltsaeada-light',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 270,
                                      height: 70,
                                      child: Text(
                                        offer.description,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.black45,
                                          fontSize: 15,
                                          fontFamily: 'ltsaeada-light',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230,
                                      height: 30,
                                      child: Row(
                                        children: <Widget>[
                                          const Text(
                                            "Publicado por",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 12,
                                              fontFamily: 'ltsaeada-light',
                                            ),
                                          ),
                                          Text(
                                            " ${offer.companie.name}",
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'ltsaeada-light',
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                print("Favorito");
                                              },
                                              icon: const Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 15),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  size: 20,
                                                  color: Colors.black45,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
        backgroundColor: Colors.black.withOpacity(0.01),
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
        onTap: (index) => onTabNavigation(index),
      ),
    );
  }

  void onTabNavigation(int index) {
    setState(() {
      if (index == 1) {
        /*
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      */
      } else if (index == 2) {
        /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilePage(userId: 1),
          ),
        );
        */
      }
    });
  }

  Future<List<Offer>> searchOffers() async {
    try {
      String url = searchController.text.isEmpty
          ? 'http://127.0.0.1:8000/api/offers'
          : "http://127.0.0.1:8000/api/offers/title/${searchController.text}";

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
