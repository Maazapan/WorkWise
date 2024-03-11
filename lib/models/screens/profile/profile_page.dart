import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/offers/offer_page_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.offer});

  final Offer offer;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<Offer>> futureOffers =
      searchOffersUser(widget.offer.user.id);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(134, 33, 191, 253),
        toolbarHeight: 370,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 250),
          child: IconButton(
            iconSize: 20,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 130,
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "profile/${widget.offer.user.profilePhoto}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                widget.offer.user.name,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: "ltsaeada-light",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: SizedBox(
                height: 70,
                width: 400,
                child: Text(
                  widget.offer.user.bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: "ltsaeada-light",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: SizedBox(
                height: 30,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.work_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                    const Text(
                      " Dueño de  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "ltsaeada-light",
                      ),
                    ),
                    Text(
                      widget.offer.companie.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "ltsaeada-light",
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SizedBox(
                height: 20,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    const Text(
                      " Direccion  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "ltsaeada-light",
                      ),
                    ),
                    Text(
                      widget.offer.companie.direction,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "ltsaeada-light",
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<Offer>>(
                future: futureOffers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Offer offer = snapshot.data![index];

                        return InkWell(
                          hoverColor: Colors.black.withOpacity(0.03),
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OfferPageItem(offer: offer),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromARGB(
                                                134, 33, 191, 253)
                                            .withOpacity(0.04),
                                      ),
                                      child: Image(
                                        image: AssetImage(offer.image),
                                        color: const Color.fromARGB(
                                            134, 33, 191, 253),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 280,
                                            height: 50,
                                            child: Text(
                                              offer.title,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'ltsaeada-light',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 270,
                                            height: 70,
                                            child: Text(
                                              offer.description,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontFamily: 'ltsaeada-light',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 230,
                                            height: 30,
                                            child: Row(
                                              children: <Widget>[
                                                const Text(
                                                  "Publicado por",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'ltsaeada-light',
                                                  ),
                                                ),
                                                Text(
                                                  " ${offer.companie.name}",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'ltsaeada-light',
                                                  ),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                    onPressed: () {
                                                      print("Favorito");
                                                    },
                                                    icon: const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        size: 20,
                                                        color: Colors.black45,
                                                      ),
                                                    )),
                                              ],
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
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Offer>> searchOffersUser(int userId) async {
    try {
      String url = "http://127.0.0.1:8000/api/offers/user/$userId";

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
