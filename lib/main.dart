import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player {
  // step 1
  // String name = 'kim';

  // step 2
  // String name;
  // Player(this.name);

  // step 3
  String? name;
  Player({required this.name});
}

void main() {
  // step 1
  // var kim = Player();

  // step 2
  // var kim = Player('kim');

  // step 3
  var kim = Player(name: 'kim');

  runApp(App());
}

// App은 material(google), cupertino(apple) 디자인 시스템 중 하나 return
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Hello flutter!')),
          // centerTitle: false,
          // 그림자
          // elevation: 1,
          // title: Text('Hello flutter'),
          backgroundColor: Color.fromARGB(75, 4, 203, 173),
        ),
        // new를 쓰던 말던 상관없음
        body: new Center(child: Text('Hello world!')),
      ),
    );
  }
}
