import 'dart:async';

import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/login/auth_service.dart';

import 'package:employments/models/screens/offers/offer_page_item.dart';
import 'package:employments/widgets/bottom_navigation.dart';
import 'package:employments/widgets/favorite_button.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key, required this.homeSearch}) : super(key: key);
  final String homeSearch;

  @override
  State<OfferPage> createState() => _OfferState();
}

class _OfferState extends State<OfferPage> {
  final searchController = TextEditingController();
  late Future<List<Offer>> futureOffers = fetchOffers();
  late List<int> favorites = [];

  @override
  void initState() {
    super.initState();
    if (widget.homeSearch.isNotEmpty) {
      searchController.text = widget.homeSearch;
    }

    fetchOffersFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 240,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        flexibleSpace: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Text(
                    "Ofertas Disponibles",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "ltsaeada-light",
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
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
                            onChanged: (value) {
                              setState(() {
                                futureOffers = fetchOffers();
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: PopupMenuButton<int>(
                                  elevation: 0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  onSelected: (value) {
                                    print('Selected value: $value');
                                  },
                                  icon: const Icon(
                                    Icons.segment_sharp,
                                    color: Colors.black54,
                                    size: 25,
                                  ),
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 1,
                                      child: Text(
                                        'Diseño grafico',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontFamily: "lgtsaeada-light",
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 2,
                                      child: Text(
                                        'Redes',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontFamily: "lgtsaeada-light",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(top: 6, left: 10),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black54,
                                  size: 25,
                                ),
                              ),
                              hintText: "Sistemas, redes, diseño grafico",
                              hintStyle: const TextStyle(
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
          ],
        ),
      ),
      body: FutureBuilder<List<Offer>>(
        future: futureOffers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Offer offer = snapshot.data![index];
                String description =
                    offer.job.description.substring(0, 50) + "... ";

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
                            builder: (context) => OfferPageItem(
                              offer: offer,
                              saved: favorites.contains(offer.id),
                            ),
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
                                padding:
                                    const EdgeInsets.only(left: 20, top: 25),
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: SizedBox(
                                        width: 220,
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Icon(
                                                Icons.work,
                                                color: Colors.black38,
                                                size: 16,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "Publicado por",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 12,
                                                  fontFamily: "ltsaeada-light",
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Text(
                                                offer.companie.name,
                                                style: const TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
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
                                    padding: const EdgeInsets.only(
                                        right: 20, top: 90),
                                    child: FavoriteButton(
                                        offerId: offer.id,
                                        favorite: favorites.contains(offer.id)),
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
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Future<List<Offer>> fetchOffers() async {
    String search = searchController.text;

    String url = search.isEmpty
        ? 'http://127.0.0.1:8000/api/offers'
        : 'http://127.0.0.1:8000/api/offer/title/$search';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      List<Offer> offerList =
          jsonResponse.map((offer) => Offer.fromJson(offer)).toList();

      return offerList;
    } else {
      throw Exception('Failed to load offers saved from API');
    }
  }

  void fetchOffersFavorite() async {
    try {
      final response = await http.get(Uri.parse(
          'http://127.0.0.1:8000/api/offers_save/user/${AuthService.userId}'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);

        setState(() {
          favorites =
              jsonResponse.map((offer) => Offer.fromJson(offer).id).toList();
        });
      } else {
        throw Exception('Failed to load offers saved from API');
      }
    } catch (e) {}
  }
}
