import 'package:app_anime_info/util/card_genres.dart';
import 'package:flutter/material.dart';

class AnimeInfo extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String synopsis;
  final List<dynamic> genres;
  final int episodes;
  final List demographics;

  const AnimeInfo(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.synopsis,
      required this.genres,
      required this.episodes,
      required this.demographics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.black,
                        height: 300,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: const Text(
                                    "Genres",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 50,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: genres.length,
                                        itemBuilder: (context, index) {
                                          Map<String, dynamic> genresRef =
                                              genres[index];

                                          return CardGenres(
                                                  name: genresRef["name"])
                                              .card();
                                        })),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: const Text(
                                    "Episodes",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 50,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      episodes.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: const Text(
                                    "Type - Anime",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                demographics.isNotEmpty
                                    ? Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Text(demographics[0]["name"],
                                            style: const TextStyle(
                                                color: Colors.white)))
                                    : Container(
                                        margin: const EdgeInsets.all(10),
                                        child: const Text("none",
                                            style: TextStyle(
                                                color: Colors.white))),
                              ]),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 300,
                        color: Colors.blue,
                        child: Hero(
                          tag: title,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Synopsis",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  )),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    synopsis,
                    style: const TextStyle(fontSize: 19),
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          mini: true,
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
