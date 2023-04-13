import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_tracker/component/component.dart';
import 'package:sale_tracker/notification_sc.dart';
import 'package:sale_tracker/provider/notification.dart';
import 'package:sale_tracker/provider/provider.dart';
import 'package:sale_tracker/service/service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

enum Status {
  ADD,
  MINUS
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  double? width;
  double height = 60;

  ItemProvider? itemPro;
  NotificationPro? noticationPro;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void onDoubleTap(int index, int value, Status st) async {
    if (st == Status.ADD){
      
      Vibration.vibrate(
        duration: 100
      );
      await Future.delayed(Duration(milliseconds: 300));
      
      Vibration.vibrate(
        duration: 100
      );
      noticationPro!.notication.insert(0, 
        Message(
          itemPro!.itemList[index]['item'],
          DateTime.now(),
          itemPro!.itemList[index]['name'], 
          "Add 1",
          Colors.green
        )
      );
    } else {
      Vibration.vibrate(
        duration: 100
      );
      noticationPro!.notication.insert(
        0, Message(
          itemPro!.itemList[index]['item'],
          DateTime.now(),
          itemPro!.itemList[index]['name'], 
          "Minus 1",
          Colors.red
        )
      );
    }
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    itemPro!.notifyListeners();
  }

  @override
  void initState() {

    itemPro = Provider.of<ItemProvider>(context, listen: false);
    noticationPro = Provider.of<NotificationPro>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [

          Consumer<ItemProvider>(
            builder: (context, pro, wg) {
              return IconButton(
                onPressed: () async {
                  await StorageService.storeData(json.encode(pro.itemList), "items");
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Save", style: TextStyle(color: Colors.white),))
                  );
                }, 
                icon: Icon(Icons.save)
              );
            }
          ),

          Consumer<ItemProvider>(
            builder: (context, pro, wg) {
              return IconButton(
                onPressed: () async {
                  await Share.share(pro.toShare());
                }, 
                icon: Icon(Icons.share)
              );
            }
          ),

          IconButton(
            onPressed: () async {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => NoticationScreen())
              );
            }, 
            icon: Icon(Icons.notifications)
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Consumer<ItemProvider>(
            builder: (context, pro, wg) {
              return ListView.builder(
                itemCount: pro.itemList.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return item(pro.itemList[index], onDoubleTap, index);
                }
              );
            }
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
