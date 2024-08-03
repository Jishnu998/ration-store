import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/constants/color.dart';
import 'item selection/item selection.dart';

class id_verification extends StatelessWidget {
  final ration_num =TextEditingController();
  final pass =TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: size*200,
            padding: EdgeInsets.symmetric(horizontal: size*10),
            decoration: BoxDecoration(
              color:ColorTheme.secondaryycolor,
              borderRadius: BorderRadius.circular(size*10),
            ),
            child: TextField(
              controller: ration_num,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorTheme.maincolor),
              decoration: InputDecoration(
                hintText: 'Ration Card Number',
                hintStyle: TextStyle(color:ColorTheme.maincolor ,fontSize: size*14),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height:size*20 ,),
          Container(
            width:size* 200,
            padding: EdgeInsets.symmetric(horizontal: size*10),
            decoration: BoxDecoration(
              color:ColorTheme.secondaryycolor,
              borderRadius: BorderRadius.circular(size*10),
            ),
            child: TextField(
              controller: pass,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorTheme.maincolor),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: ColorTheme.maincolor,fontSize: size*14),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height:size*30 ,),
          ElevatedButton(onPressed: ()=> _signIn(context),
            style: ElevatedButton.styleFrom(backgroundColor: ColorTheme.maincolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
          child: Text("         OK         ",style: TextStyle(color: ColorTheme.primarycolor),),)

        ]),
      ),
    );

  }
  Future<void> _signIn(BuildContext context) async {
    final String rationCardNumber = ration_num.text;
    final String password = pass.text;

    // Query Firestore to check if there's a user with the provided credentials
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('ration card owners')
        .where('number', isEqualTo: rationCardNumber)
        .where('password', isEqualTo: password)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      String category = documentSnapshot['category'];
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          item_selction(category: category)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid ration card number or password.'),
            backgroundColor: Colors.red));
    }
  }
}