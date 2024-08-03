import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rationshopproject/presentation/common/user%20or%20owner%20selection.dart';
import '../../core/constants/color.dart';

class ration_splash extends StatefulWidget {
  const ration_splash({Key? key}):super(key:key);
  @override
  State<ration_splash> createState()=> _ration_splashState();
}
class _ration_splashState extends State<ration_splash>{
  @override
  void initState(){
    Timer(Duration(seconds:7), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=> user_owner_selection()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    double size = constantsize(context);
    return Scaffold(
      backgroundColor: ColorTheme.maincolor,
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("R",style: TextStyle(fontSize: size*200,color: Colors.white,
        fontWeight: FontWeight.w900),)
      ],),)
    );
  }
}