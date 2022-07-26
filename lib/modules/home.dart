import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final int? index;
  const MyHomePage({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$index',
        ),
      ),
    );
  }
}
