import 'package:flutter/material.dart';
import 'package:mashwerni/core/function/checkinternet.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // ignore: prefer_typing_uninitialized_variables
  var res;
  initialdata() async {
    res = await checkInternet();
  }

  @override
  void initState() {
    initialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
