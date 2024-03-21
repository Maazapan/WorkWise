import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/login/auth_service.dart';
import 'package:employments/widgets/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.offer});
  final Offer offer;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Column(
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
              const Padding(
                padding: EdgeInsets.only(top: 80, left: 1),
                child: SizedBox(
                  width: 330,
                  child: Text(
                    "Perfiles",
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
                          "assets/profile/${widget.offer.user.profilePhoto}"),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              width: 400,
              //     color: Colors.yellow,
              child: Text(
                widget.offer.user.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontFamily: 'ltsaeada-light',
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.work,
                  color: Colors.black45,
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 5),
                child: Text(
                  "Dueño de ${widget.offer.companie.name}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'ltsaeada-light',
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(
                  Icons.location_on,
                  color: Colors.black45,
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  "Direccion ${widget.offer.companie.direction}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'ltsaeada-light',
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
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
                        widget.offer.user.bio,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'ltsaeada-light',
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  //   Text(AuthService.token),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
