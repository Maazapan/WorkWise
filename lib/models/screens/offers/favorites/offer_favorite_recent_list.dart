import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/offers/offer_page_item.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class OfferFavoriteRecentList extends StatefulWidget {
  const OfferFavoriteRecentList({Key? key, required this.userId})
      : super(key: key);
  final int userId;

  @override
  State<OfferFavoriteRecentList> createState() => _OfferFavoriteRecentState();
}

class _OfferFavoriteRecentState extends State<OfferFavoriteRecentList> {
  late Future<List<Offer>> futureOffers;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
    futureOffers = fetchOffersSaved();
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

              DateTime dateTime = DateTime.parse(offer.createdAt);
              DateFormat dateFormat = DateFormat('dd MMMM yyyy', 'es');

              String formattedDate = dateFormat.format(dateTime);
              return Column(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfferPageItem(offer: offer)),
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Container(
                        height: 80,
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
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image(
                                        image: AssetImage(offer.image),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: Text(
                                      offer.title,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontFamily: "ltsaeada-regular",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Categoria ${offer.categorie.name}",
                                      style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontFamily: "ltsaeada-light",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 35),
                              child: InkWell(
                                onTap: () => {
                                  print(
                                      "agregar o eliminar oferta de favoritos"),
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(0.02),
                                  ),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        ));
      },
    );
  }

  Future<List<Offer>> fetchOffersSaved() async {
    final response = await http.get(Uri.parse(
        'http://127.0.0.1:8000/api/offer/saves/user/recent/${widget.userId}'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((offer) => Offer.fromJson(offer)).toList();
    } else {
      throw Exception('Failed to load offers saved from API');
    }
  }
}
