import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/color.dart';
import '../../core/controller/controller.dart';
import '../../global widget/confirm item widget.dart';
import 'gr code generate.dart';

class Confirm_selection extends StatelessWidget {
  String category;
  Confirm_selection({required this.category});

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    List<Map<String, dynamic>> datas =
        Provider.of<tile_controller>(context).collection;
    Map<String, dynamic> combinedData = {
      'category': category,
      'price': Provider.of<tile_controller>(context).total,
      'mapList': datas,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.maincolor,
        title: Text(category,style: TextStyle(color: Colors.white),),centerTitle: true,
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white)
        ),
      ),
        body: Padding(
          padding: EdgeInsets.all(size*10),
          child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the cross axis count as needed
                  childAspectRatio: 1 / 1.6, // Adjust the aspect ratio as needed
                ),
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Confirm_Item_Widget(
                    item: datas[index],
                  );
                },
              ),
        ),

      floatingActionButton: Container(color: ColorTheme.maincolor,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: size*20,right: size*20),
              child: Container(
                  child: Text("Total Amount: ₹${Provider.of<tile_controller>(context).total}",style:TextStyle(
                      fontSize: size*18,color: Colors.white,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,)),
            ),
            Container(width: size*130,
                child: FloatingActionButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  qr_generation(datas: combinedData,)));
                },
                    child: Text("CONFIRM",style:TextStyle(
                        fontSize: size*20,color: Colors.white,fontWeight: FontWeight.bold)),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(size*5)),
                    backgroundColor: ColorTheme.maincolor,focusElevation: 0,
                elevation: 0,)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
