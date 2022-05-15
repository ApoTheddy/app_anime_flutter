import 'package:flutter/material.dart';

class AnimeCard {
  final String name;
  final String url;

  AnimeCard({required this.name, required this.url});

  Widget generateNormalCard(Size size) {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:
                  Hero(tag: name, child: Image.network(url, fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget generateLargeCard(Size size) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(20)),
      width: 300,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 300,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
