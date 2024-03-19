import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/offers/offer_page_item.dart';
import 'package:employments/models/screens/profile/profile_page.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OfferRecentsList extends StatefulWidget {
  const OfferRecentsList({Key? key}) : super(key: key);

  @override
  State<OfferRecentsList> createState() => _OfferSavedState();
}

class _OfferSavedState extends State<OfferRecentsList> {
  late Future<List<Offer>> futureRecents;

  @override
  void initState() {
    super.initState();
    futureRecents = searchRecentOffers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
      future: futureRecents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Offer offer = snapshot.data![index];
              String description =
                  offer.job.description.substring(0, 60) + "... ";

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OfferPageItem(offer: offer)),
                        );
                      },
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontFamily: "ltsaeada-regular",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 20),
                                    child: SizedBox(
                                      height: 60,
                                      width: 200,
                                      child: Text(
                                        description,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black38,
                                          fontFamily: "ltsaeada-light",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, top: 40),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.02),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage(offer: offer)),
                                        );
                                      },
                                      child: Image(
                                        image: AssetImage(
                                            "profile/${offer.user.profilePhoto}"),
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
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
                  ),
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
          ),
        );
      },
    );
  }

  Future<List<Offer>> searchRecentOffers() async {
    try {
      String url = 'http://127.0.0.1:8000/api/offer/recents/';

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
