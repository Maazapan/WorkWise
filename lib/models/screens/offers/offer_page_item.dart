import 'package:employments/models/offer.dart';
import 'package:employments/models/screens/profile/profile_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' show DateFormat;

class OfferPageItem extends StatefulWidget {
  const OfferPageItem({super.key, required this.offer});
  final Offer offer;

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
    DateTime date = DateTime.parse(widget.offer.job.date);
    DateFormat format = DateFormat("EEEE, MMM d, yyyy", 'es');

    String dateFormatted = format.format(date);
    List<String> requirements = widget.offer.job.requirements.split(",");

    return Scaffold(
      //  backgroundColor: Colors.black.withOpacity(0.02),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 400,
                height: 80,
                child: Text(
                  widget.offer.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "ltsaeada-light",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 140,
                    width: 400,
                    child: Text(
                      widget.offer.job.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: "ltsaeada-light",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: SizedBox(
                width: 400,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.home_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              Text(
                                "Publicado por ${widget.offer.companie.name}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "ltsaeada-light",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              Text(
                                "Direccion ${widget.offer.job.address}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "ltsaeada-light",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.phone_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              Text(
                                "Telefono ${widget.offer.companie.phone}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "ltsaeada-light",
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              " Trabajo publicado el $dateFormatted",
                              style: const TextStyle(
                                color: Colors.black26,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ltsaeada-light",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      hoverColor: Colors.black,
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              offer: widget.offer,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "profile/${widget.offer.user.profilePhoto}",
                            fit: BoxFit.cover,
                            scale: 70,
                          ),
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
      body: Center(
        child: Container(
          width: 450,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.02),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Requisitos',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontFamily: "ltsaeada-light",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: requirements.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          requirements[index],
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontFamily: "ltsaeada-light",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(134, 33, 191, 253),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    print("Aplicar al trabajo");
                  },
                  child: const Text(
                    "Aplicar al Trabajo",
                    style: TextStyle(
                      fontFamily: "ltsaeada-light",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
