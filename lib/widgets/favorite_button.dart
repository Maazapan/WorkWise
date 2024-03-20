import 'package:employments/models/screens/login/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton(
      {super.key, required this.offerId, required this.favorite});
  final int offerId;
  final bool favorite;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isFavorite = widget.favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          _isFavorite ? _removeFavorite() : _addFavorite();
        }),
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.02),
        ),
        child: _isFavorite
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20,
              )
            : const Icon(
                Icons.favorite_border,
                color: Colors.black54,
                size: 20,
              ),
      ),
    );
  }

  void _addFavorite() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/offers_save/create');

    final response = await http.post(
      url,
      body: {
        'offer_id': widget.offerId.toString(),
        'user_id': AuthService.userId.toString(),
      },
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _isFavorite = true;
      });
    }
  }

  void _removeFavorite() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/offers_save/delete');

    final response = await http.post(
      url,
      body: {
        'offer_id': widget.offerId.toString(),
        'user_id': AuthService.userId.toString(),
      },
    );

    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _isFavorite = false;
      });
    }
  }
}
