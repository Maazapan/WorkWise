import 'package:employments/models/screens/login/auth_service.dart';
import 'package:employments/models/screens/login/login_page.dart';
import 'package:employments/models/screens/offers/favorites/offer_favorite_page.dart';
import 'package:employments/models/screens/offers/offer_page.dart';
import 'package:employments/models/screens/offers/offer_recents_list.dart';
import 'package:employments/models/screens/offers/favorites/offer_favorite_recent_list.dart';
import 'package:employments/models/screens/profile/my_profile_page.dart';
import 'package:employments/models/user.dart';
import 'package:employments/widgets/bottom_navigation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = AuthService.user!;

    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f8f8),
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
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
                  padding: const EdgeInsets.only(right: 30, top: 23),
                  child: PopupMenuButton<String>(
                    onSelected: (String choice) {
                      if (choice == "1") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyProfilePage(user: user),
                          ),
                        );
                      } else if (choice == "2") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      }
                    },
                    elevation: 0,
                    color: Colors.white,
                    icon: Container(
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: '1',
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.black54,
                                size: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Mi Perfil',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "lgtsaeada-regular",
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: "2",
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.black54,
                                size: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Cerrar Sesion',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "lgtsaeada-regular",
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 17),
              child: SizedBox(
                height: 35,
                child: Text(
                  "¡Hola ${user.name}!",
                  style: const TextStyle(
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
                            onSubmitted: (value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OfferPage(homeSearch: value)),
                              );
                            },
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
                              hintText: "Sistemas, redes, diseño grafico",
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
            Center(
              child: SizedBox(
                height: 615,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
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
                            const Spacer(),
                            InkWell(
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OfferFavoritePage(
                                        userId: AuthService.userId),
                                  ),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 10, top: 10),
                                    child: Text(
                                      "Ver todos",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'ltsaeada-light',
                                        fontSize: 17,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 10, top: 12),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black45,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 270,
                          child: OfferFavoriteRecentList(
                              userId: AuthService.userId),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 40),
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
                        const SizedBox(
                          height: 180,
                          child: OfferRecentsList(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
