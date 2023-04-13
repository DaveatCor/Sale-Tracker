import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {

  List<Map<String, dynamic>> itemList = [
    {"name": "Big", "item": "big.jpeg", "amt": 0, "price": "៧មុឺន"},
    {"name": "Medium", "item": "medium.jpeg", "amt": 0, "price": "៥មុឺន"},
    {"name": "Spider man", "item": "spider_man.jpeg", "amt": 0, "price": "៥មុឺន"},
    {"name": "Unicorn", "item": "unicorn.jpeg", "amt": 0, "price": "៤មុឺន"},
    {"name": "Dinosour", "item": "dino.jpeg", "amt": 0, "price": "៤មុឺន"}
  ];

  String toShare(){
    return """
ថ្ងៃ: ${DateTime.now()}\n
- កាំភ្លើង ធំ, Sold: ${itemList[0]['amt']}, "price": "៧មុឺន"
- កាំភ្លើង សុីជម្ពូ, Sold:  ${itemList[1]['amt']}, "price": "៥មុឺន"
- កាំភ្លើង spider man, Sold: ${itemList[2]['amt']}, "price": "៥មុឺន"
- កាំភ្លើង Unicorn, Sold: ${itemList[3]['amt']}, "price": "៤មុឺន"
- កាំភ្លើង Dinoser, Sold:  ${itemList[4]['amt']}: 0, "price": "៤មុឺន
    """;
  }
}