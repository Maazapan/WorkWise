import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/login/auth_service.dart';
import 'package:employments/models/screens/offers/create/offer_create_page.dart';
import 'package:employments/models/screens/offers/user/offer_user.dart';
import 'package:employments/models/user.dart';
import 'package:employments/widgets/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key, required this.user});
  final User? user;

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
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
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 25),
                  child: SizedBox(
                    width: 330,
                    child: Text(
                      "Mi Perfil",
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
              child: Container(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Image(
                        image: AssetImage(
                            "assets/profile/${widget.user!.profilePhoto}"),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 400,
                child: Text(
                  widget.user!.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'ltsaeada-light',
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 25, right: 25, bottom: 15),
                      child: SizedBox(
                        child: Text(
                          widget.user!.bio,
                          textAlign: TextAlign.center,
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
              ),
            ),
            const SizedBox(
              height: 500,
              child: OfferUserList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OfferCreatePage(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 112, 112, 112),
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
