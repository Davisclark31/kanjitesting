import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to training'),
          onPressed: () {
            Navigator.pushNamed(context, '/training');
          },
        ),
      ),
    );
  }
}
