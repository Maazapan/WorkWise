import 'package:employments/home_page.dart';
import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/login/auth_service.dart';
import 'package:employments/models/screens/profile/profile_page.dart';
import 'package:employments/widgets/bottom_navigation.dart';
import 'package:employments/widgets/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OfferPageItem extends StatefulWidget {
  const OfferPageItem({super.key, required this.offer, required this.saved});
  final Offer offer;
  final bool saved;

  @override
  State<OfferPageItem> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPageItem> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.offer.createdAt);
    DateFormat dateFormat = DateFormat('dd MMMM yyyy', 'es');

    String date = dateFormat.format(dateTime);

    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 10),
                  child: SizedBox(
                    height: 50,
                    width: 40,
                    child: InkWell(
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 1),
                  child: SizedBox(
                    width: 330,
                    child: Text(
                      widget.offer.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 28,
                        fontFamily: 'ltsaeada-light',
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: 130,
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
                    child: Image(
                      image: AssetImage("assets/${widget.offer.image}"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
              child: SizedBox(
                width: 400,
                child: Container(
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                          child: Text(
                            widget.offer.job.description,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontFamily: "ltsaeada-light",
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: SizedBox(
                            child: Row(
                          children: [
                            Icon(
                              Icons.push_pin,
                              color: Colors.black54,
                              size: 17,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Requisitos Necesarios",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontFamily: "ltsaeada-regular",
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: SizedBox(
                          child: Text(
                            widget.offer.job.requirements,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontFamily: "ltsaeada-light",
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: SizedBox(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 15,
                                color: Colors.black38,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Publicado el $date",
                                  style: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 13,
                                    fontFamily: "ltsaeada-light",
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: FavoriteButton(
                                  offerId: widget.offer.id,
                                  favorite: widget.saved,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Informacion",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "ltsaeada-light",
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 130,
                    width: 290,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.location_on,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: 230,
                                child: Text(
                                  widget.offer.job.address,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'ltsaeada-light',
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30, top: 10),
                              child: Icon(
                                Icons.attach_money_rounded,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: SizedBox(
                                width: 150,
                                child: Text(
                                  "${widget.offer.job.salary} USD",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'ltsaeada-light',
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30, top: 10),
                              child: Icon(
                                Icons.phone,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: SizedBox(
                                width: 120,
                                child: Text(
                                  widget.offer.companie.phone,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'ltsaeada-light',
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(-5, 10),
                          ),
                        ],
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
                                        ProfilePage(offer: widget.offer)),
                              );
                            },
                            child: Image(
                              image: AssetImage(
                                  "assets/profile/${widget.offer.user.profilePhoto}"),
                              height: 80,
                              width: 80,
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
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
