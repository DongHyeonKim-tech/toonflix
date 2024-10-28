import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

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
        title: const Text("Today's 툰s"),
      ),
      body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // 1 - 가장 간단한 ListView
              // return ListView(
              //   children: [
              //     for (var webtoon in snapshot.data!) Text(webtoon.title)
              //   ],
              // );
              // 2 - index를 활용해 사용자가 현재 보고 있는 화면만 build, 나머지는 memory에서 delete
              // return ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   itemCount: snapshot.data!.length,
              //   itemBuilder: (context, index) {
              //     print(index);
              //     var webtoon = snapshot.data![index];
              //     return Text(webtoon.title);
              //   },
              // );
              // 3 - List에 간격 설정
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print(index);
                  var webtoon = snapshot.data![index];
                  return Text(webtoon.title);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
