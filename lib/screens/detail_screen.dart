import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

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
            title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
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
                    thumb,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
