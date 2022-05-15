import 'package:app_anime_info/util/anime.dart';
import 'package:app_anime_info/components/card_anime.dart';
import 'package:app_anime_info/util/consumer_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ConsumerApi().getAllDataFromApi(1);
    Size size = MediaQuery.of(context).size;
    Anime anime = Anime();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                                "https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Hello",
                                  style: TextStyle(color: Colors.white54),
                                ),
                                Text("Timur K",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Text(
                "Animes",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              anime.allAnimes(size),
              const SizedBox(
                height: 30,
              ),
              sizedBoxWithTitle("Top Animes", 40),
              anime.topAnimes(size),
              const SizedBox(
                height: 30,
              ),
              sizedBoxWithTitle("Top Manga", 40),
              anime.topManga(size)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sizedBoxWithTitle(String title, double height) {
    return SizedBox(
      height: height,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
