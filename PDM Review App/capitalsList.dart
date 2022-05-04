import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:routes/capital.dart';

class CapitalsList{
  static Future<List<Capital>> readJson(int index, int limit) async {
    final List<Capital> capitalBank = [];

    final String response = await rootBundle.loadString('json/brazilCapitals.json');
    final Map<String, dynamic> data = await jsonDecode(response);

    await Future.delayed(const Duration(milliseconds: 5000));

    for(int i = index; i < index+limit; i++){
      if(i == data['capitals'].length){
        break;
      }
      capitalBank.add(Capital.fromJson(data['capitals'][i]));
    }

    return capitalBank;
  }
}