import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/color.dart';
import '../common/user or owner selection.dart';

class Payment_page extends StatefulWidget {
  @override
  State<Payment_page> createState() => _Payment_pageState();
}

class _Payment_pageState extends State<Payment_page> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => user_owner_selection()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      backgroundColor: ColorTheme.maincolor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: size * 250),
          child: Column(
            children: [
              Container(
                height: size * 200,
                width: size * 200,
                child: Lottie.asset(
                    "assets/animation/Animation - 1711328118289 (3).json"),
              ),
              Text(
                "CONFORM ",
                style: TextStyle(color: ColorTheme.primarycolor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
