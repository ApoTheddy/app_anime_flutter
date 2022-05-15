import 'package:app_anime_info/components/card_anime.dart';
import 'package:app_anime_info/screens/anime_info.dart';
import 'package:app_anime_info/util/consumer_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Anime {
  List getAnimes(Map<String, dynamic> json) {
    List animes = json["anime"];
    return animes;
  }

  List getAnimesTop(Map<String, dynamic> json) {
    List animes = json["top"];
    return animes;
  }

  FutureBuilder allAnimes(Size size) {
    return FutureBuilder(
        future: ConsumerApi().getAllDataAnimes(1),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index, pageViewIndex) {
                  Map<String, dynamic> animeRef = snapshot.data[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AnimeInfo(
                                    title: animeRef["title"],
                                    imageUrl: animeRef["image_url"],
                                    synopsis: animeRef["synopsis"],
                                    genres: animeRef["genres"],
                                    demographics: animeRef["demographics"],
                                    episodes: animeRef["episodes"] ?? 0,
                                  )));
                    },
                    child: AnimeCard(
                            name: animeRef["title"], url: animeRef["image_url"])
                        .generateNormalCard(size),
                  );
                },
                options: CarouselOptions(
                  height: 330,
                  viewportFraction: 0.5,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.bounceOut,
                  autoPlayInterval: const Duration(seconds: 2),
                ));
          }
          return Container();
        });
  }

  FutureBuilder topAnimes(Size size) {
    return FutureBuilder(
        future: ConsumerApi().getAllDataTopAnimes(1),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
                itemCount: snapshot.data.length,
                options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    height: size.height * 0.7,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true),
                itemBuilder: (context, index, viewPage) {
                  Map<String, dynamic> animeRef = snapshot.data[index];
                  return Builder(builder: (_) {
                    return AnimeCard(
                            name: animeRef["title"], url: animeRef["image_url"])
                        .generateLargeCard(size);
                  });
                });
          }
          return Container();
        });
  }

  FutureBuilder topManga(Size size) {
    return FutureBuilder(
        future: ConsumerApi().getAllDataTopMangas(1),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
                itemCount: snapshot.data.length,
                options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    height: size.height * 0.7,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true),
                itemBuilder: (context, index, viewPage) {
                  Map<String, dynamic> animeRef = snapshot.data[index];
                  return Builder(builder: (_) {
                    return AnimeCard(
                            name: animeRef["title"], url: animeRef["image_url"])
                        .generateLargeCard(size);
                  });
                });
          }
          return Container();
        });
  }
}
