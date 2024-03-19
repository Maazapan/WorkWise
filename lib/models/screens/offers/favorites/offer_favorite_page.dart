import 'package:employments/models/screens/offers/favorites/offer_favorite_list.dart';
import 'package:employments/widgets/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OfferFavoritePage extends StatefulWidget {
  const OfferFavoritePage({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  State<OfferFavoritePage> createState() => _OfferFavoriteState();
}

class _OfferFavoriteState extends State<OfferFavoritePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f8f8),
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        flexibleSpace: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 10),
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
                const Padding(
                  padding: EdgeInsets.only(top: 90, left: 1),
                  child: Text(
                    "Mis Favoritos",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "ltsaeada-light",
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: OfferFavoriteList(userId: widget.userId),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
