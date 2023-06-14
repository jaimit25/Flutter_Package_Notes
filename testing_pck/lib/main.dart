import 'package:flutter/material.dart';
import 'package:circle/circle.dart';
import 'package:dio/dio.dart';
import 'dart:math' as math;

import 'package:testapi/testapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainA(),
    );
  }
}

class MainA extends StatefulWidget {
  const MainA({super.key});

  @override
  State<MainA> createState() => _MainAState();
}

class _MainAState extends State<MainA> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: InkWell(
        child: Text('Click Me'),
        onTap: () async {
          testD obj = testD();
          var dt = await obj.getData();
          print("Data from Client app is : " + dt.toString());
        },
      ),
    )));
  }
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final dio = Dio();

  List users = [];

  void getHttp() async {
    final response =
        await dio.get('https://personal-api.up.railway.app/api/v1/users');
    // print(response);
    setState(() {
      users = response.data.toList();
    });
    print(users.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    /// [This is Element 1]

                    Circle(
                        radius: 50,
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0)),

                    /// [This is Element 2]
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(users[index]['email'] ?? 'email'),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    ));
  }
}
