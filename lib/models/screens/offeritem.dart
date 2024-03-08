import 'package:employments/models/offer.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class OfferItem extends StatefulWidget {
  const OfferItem({super.key, required this.id});

  final int id;

  @override
  State<OfferItem> createState() => _JobPageState();
}

class _JobPageState extends State<OfferItem> {
  late Future<Offer> futureJob;

  @override
  void initState() {
    super.initState();
    futureJob = fetchJob();
  }

  Future<Offer> fetchJob() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/offers/${widget.id}'),
    );

    if (response.statusCode == 200) {
      return Offer.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load job');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Obtener datos'),
      ),
      body: Center(
        child: FutureBuilder<Offer>(
            future: futureJob,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.id.toString()),
                    Text(snapshot.data!.companie.name),
                    Text(snapshot.data!.categorie.name),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
