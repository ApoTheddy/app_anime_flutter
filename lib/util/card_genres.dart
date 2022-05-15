import 'package:flutter/material.dart';

class CardGenres {
  final String name;

  CardGenres({required this.name});

  Container card() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: Center(child: Text(name)),
    );
  }
}
