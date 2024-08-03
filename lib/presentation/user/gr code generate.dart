import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/constants/color.dart';
import '../common/user or owner selection.dart';

class qr_generation extends StatelessWidget {
  Map<String, dynamic> datas;

  qr_generation({required this.datas});

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    String data = json.encode(datas);
    return Scaffold(
      backgroundColor: ColorTheme.maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              backgroundColor: Colors.white,
              data: data,
              version: QrVersions.auto,
              size: size * 200,
            ),
            SizedBox(height: size * 50),
            Container(
              width: size * 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => user_owner_selection()));
                  },
                  child: Text("Go to Home",
                      style: TextStyle(
                          fontSize: size * 20,
                          color: ColorTheme.maincolor,
                          fontWeight: FontWeight.bold))),
            )
          ],
        ),
      ),
    );
  }
}
