import 'dart:async';

import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/login/auth_service.dart';

import 'package:employments/models/screens/offers/offer_page_item.dart';
import 'package:employments/widgets/bottom_navigation.dart';
import 'package:employments/widgets/favorite_button.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class OfferUserList extends StatefulWidget {
  const OfferUserList({Key? key}) : super(key: key);

  @override
  State<OfferUserList> createState() => _OfferUserListState();
}

class _OfferUserListState extends State<OfferUserList> {
  final searchController = TextEditingController();
  late Future<List<Offer>> futureOffers;

  @override
  void initState() {
    super.initState();
    futureOffers = fetchOffers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
      future: futureOffers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Offer offer = snapshot.data![index];
              String description = offer.description.length > 50
                  ? offer.job.description.substring(0, 50) + "... "
                  : offer.job.description;

              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Container(
                      height: 140,
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 25),
                            child: SizedBox(
                              height: 90,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Image(
                                      image:
                                          AssetImage("assets/${offer.image}"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 20),
                                      child: Text(
                                        offer.title,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontFamily: "ltsaeada-regular",
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: PopupMenuButton<int>(
                                        elevation: 0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        onSelected: (value) {
                                          if (value == 1) {
                                          } else if (value == 2) {
                                            setState(() {
                                              delete(offer.id);
                                            });
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.black54,
                                          size: 25,
                                        ),
                                        itemBuilder: (context) => [
                                          const PopupMenuItem(
                                            value: 1,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.edit,
                                                  color: Colors.black54,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    'Editar Oferta',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "lgtsaeada-regular",
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            value: 2,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.black54,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    'Eliminar',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "lgtsaeada-regular",
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    width: 220,
                                    child: Text(
                                      description,
                                      style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontFamily: "ltsaeada-light",
                                      ),
                                    ),
                                  ),
                                ),
                                //      const Spacer(),
                              ],
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
          return const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 140),
                  child: Icon(
                    Icons.error_outline,
                    size: 40,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "No se han encontrado \n ofertas disponibles",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontFamily: "ltsaeada-light",
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        ));
      },
    );
  }

  Future<List<Offer>> fetchOffers() async {
    String search = searchController.text;

    String url = 'http://127.0.0.1:8000/api/offers/user/${AuthService.userId}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((offer) => Offer.fromJson(offer)).toList();
    } else {
      throw Exception('Failed to load offers saved from API');
    }
  }

  void delete(int offerId) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/offer/delete');

    final response = await http.post(
      url,
      body: {'id': offerId.toString()},
    );

    if (response.statusCode == 200) {
      setState(() {
        futureOffers = fetchOffers();
      });
    } else {
      throw Exception('Failed to delete offer');
    }

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
              "Eliminado correctamente",
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
