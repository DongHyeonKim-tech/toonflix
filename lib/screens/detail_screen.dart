import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Future<WebtoonDetailModel> webtoon = ApiService.getToonById(widget.id);
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: widget.id,
                      child: Container(
                        width: 200,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 7,
                                offset: Offset(10, 10),
                                color: Colors.black54)
                          ],
                        ),
                        child: Image.network(
                          widget.thumb,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                    future: webtoon,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.about,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${snapshot.data!.genre} / ${snapshot.data!.age}',
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        );
                      }
                      return const Text('...');
                    }),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                    future: episodes,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            // for (var episode in snapshot.data!.length > 10
                            //     ? snapshot.data!.sublist(0, 10)
                            //     : snapshot.data!)
                            for (var episode in snapshot.data!)
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 159, 233, 161),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        episode.title,
                                        style: const TextStyle(
                                            fontSize: 8, color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.chevron_right_rounded,
                                        size: 10,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )
                          ],
                        );
                      }
                      return Container();
                    }),
              ],
            ),
          ),
        ));
  }
}
