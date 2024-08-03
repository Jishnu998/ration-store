import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/color.dart';
import '../../common/user or owner selection.dart';
import '../confirm selection.dart';
import 'widget/item widget.dart';

class item_selction extends StatelessWidget {
  String category;

  item_selction({required this.category});

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.maincolor,
        title: Text(
          category,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => user_owner_selection()));
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('category').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final docs = snapshot.data!.docs;
            final categoryDocument =
                docs.firstWhere((doc) => doc.id == category);
            final contentsCollection =
                categoryDocument.reference.collection('contents');
            return StreamBuilder(
              stream: contentsCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> subSnapshot) {
                if (subSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (subSnapshot.hasError) {
                  return Center(child: Text('Error: ${subSnapshot.error}'));
                } else {
                  return Padding(
                    padding: EdgeInsets.all(size * 10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1/ 1.6 ),
                      itemCount: subSnapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = subSnapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        return Item_Widget(
                          item: data,
                        );
                      },
                    ),
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: Container(
          width: size * 200,
          child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Confirm_selection(category: category)));
              },
              child: Text("OK",
                  style: TextStyle(
                      fontSize: size * 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size * 5)),
              backgroundColor: ColorTheme.maincolor)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
