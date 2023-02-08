import 'package:flutter/material.dart';

class ForgoPasswordScreen extends StatefulWidget {
  const ForgoPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgoPasswordScreen> createState() => _ForgoPasswordScreenState();
}

class _ForgoPasswordScreenState extends State<ForgoPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quên mật khẩu"),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
