import 'package:flutter/material.dart';
import 'package:sale_tracker/main_page.dart';

String? assetPath = "assets/";
  
Widget item(Map<String, dynamic>? itm, Function? onDoubleTap, int? index){
  return Container(
    color: Colors.white,
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
    height: 120,
    child: GestureDetector(
      onDoubleTap: (){
        onDoubleTap!(index, ++itm['amt'], Status.ADD);
      },
      child: Row(
        children: [
          Image.asset("$assetPath${itm!['item']}"),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Sold: ${itm['amt'].toString()}", 
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            )
          ),

          SizedBox(
            height: 120,
            width: 80,
            child: IconButton(
              onPressed: (){
                onDoubleTap!(index, itm['amt'] >= 1 ? --itm['amt'] : 0, Status.MINUS);
              }, 
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tap one to minus", textAlign: TextAlign.center,),
                  Icon(Icons.exposure_minus_1),
                ],
              )
            ),
          )

        ],
      )
    ),
  );
}