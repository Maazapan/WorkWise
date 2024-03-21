import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/offers/offer_page_item.dart';
import 'package:employments/widgets/favorite_button.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class OfferFavoriteList extends StatefulWidget {
  const OfferFavoriteList({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  State<OfferFavoriteList> createState() => _OfferFavoriteState();
}

class _OfferFavoriteState extends State<OfferFavoriteList> {
  late Future<List<Offer>> futureOffers;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
    futureOffers = fetchOffersFavorite();
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

              DateTime dateTime = DateTime.parse(offer.createdAt);
              DateFormat dateFormat = DateFormat('dd MMMM yyyy', 'es');

              String date = dateFormat.format(dateTime);

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
                          builder: (context) =>
                              OfferPageItem(offer: offer, saved: true),
                        ),
                      );
                    },
                    child: Padding(
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
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: SizedBox(
                                      width: 220,
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(bottom: 3),
                                            child: Icon(
                                              Icons.date_range_rounded,
                                              color: Colors.black38,
                                              size: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Guardado el $date",
                                              style: const TextStyle(
                                                color: Colors.black38,
                                                fontSize: 12,
                                                fontFamily: "ltsaeada-light",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20, top: 90),
                                  //     child: FavoriteButton(offerId: offer.id),
                                )
                              ],
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
                    "No se han encontrado \n ofertas guardadas",
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

  Future<List<Offer>> fetchOffersFavorite() async {
    final response = await http.get(Uri.parse(
        'http://127.0.0.1:8000/api/offers_save/user/${widget.userId}'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((offer) => Offer.fromJson(offer)).toList();
    } else {
      throw Exception('Failed to load offers saved from API');
    }
  }
}
