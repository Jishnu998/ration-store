import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rationshopproject/presentation/owner/payment.dart';
import '../../core/constants/color.dart';
import '../../global widget/confirm item widget.dart';

class Scan_qr extends StatelessWidget {
  final String data;

  Scan_qr({required this.data});

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    Map<String, dynamic> decodedData = json.decode(data);
    String category = decodedData['category'];
    int price = decodedData['price'];
    List<Map<String, dynamic>> listOfMaps =
        List<Map<String, dynamic>>.from(decodedData['mapList']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorTheme.maincolor,
        title: Text(
          category,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white)
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size * 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the cross axis count as needed
            childAspectRatio: 1 / 1.6, // Adjust the aspect ratio as needed
          ),
          itemCount: listOfMaps.length,
          itemBuilder: (BuildContext context, int index) {
            return Confirm_Item_Widget(
              item: listOfMaps[index],
            );
          },
        ),
      ),
      floatingActionButton: Container(
        color: ColorTheme.maincolor,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size * 20, right: size * 20),
              child: Container(
                  child: Text(
                "Total Amount: ₹$price",
                style: TextStyle(
                    fontSize: size * 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
            ),
            Container(
                width: size * 130,
                color: ColorTheme.maincolor,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                        Payment_page()));
                  },
                  child: Text("CONFIRM",
                      style: TextStyle(
                          fontSize: size * 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size * 5)),
                  backgroundColor: ColorTheme.maincolor,
                  elevation: 0,
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
