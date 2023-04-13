import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {

  List<Map<String, dynamic>> itemList = [
    {"name": "Big", "item": "big.jpeg", "amt": 0},
    {"name": "Medium", "item": "medium.jpeg", "amt": 0},
    {"name": "Spider man", "item": "spider_man.jpeg", "amt": 0},
    {"name": "Unicorn", "item": "unicorn.jpeg", "amt": 0},
    {"name": "Dinosour", "item": "dino.jpeg", "amt": 0}
  ];

  String toShare(){
    return """
ថ្ងៃ: ${DateTime.now()}\n
- កាំភ្លើង ធំ, Sold: ${itemList[0]['amt']}
- កាំភ្លើង សុីជម្ពូ, Sold:  ${itemList[1]['amt']}
- កាំភ្លើង spider man, Sold: ${itemList[2]['amt']}
- កាំភ្លើង Unicorn, Sold: ${itemList[3]['amt']}
- កាំភ្លើង Dinoser, Sold:  ${itemList[4]['amt']}
    """;
  }
}