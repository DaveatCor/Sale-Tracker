import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_tracker/provider/notification.dart';
import 'package:sale_tracker/provider/provider.dart';

class NoticationScreen extends StatelessWidget {
  const NoticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Notification"),
      ),
      body: Consumer<NotificationPro>(
        builder: (context, pro, wg) {
          return ListView.builder(
            itemCount: pro.notication.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.asset("assets/${pro.notication[index].img}"),
                  title: Text("${pro.notication[index].item}"),
                  subtitle: Text(pro.notication[index].dateTime!.toLocal().toString()),
                  trailing: Text(pro.notication[index].status!, style: TextStyle(color: pro.notication[index].color)),
                ),
              );
            },
          );
        }
      ),
    );
  }
}