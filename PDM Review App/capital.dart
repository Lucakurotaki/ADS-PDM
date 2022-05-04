import 'package:flutter/material.dart';

class Capital{
  final String cityName;
  bool favorite;

  Capital({
    required this.cityName,
    required this.favorite
  });

  static Icon favoriteState(bool favorite){
    if (favorite == true){
      return const Icon(Icons.favorite, color: Colors.pink);
    }
    return const Icon(Icons.favorite_border, color: Colors.pink);
  }

  factory Capital.fromJson(Map<String, dynamic> json){
    return Capital(
      cityName: json['name'],
      favorite: json['favorite']
    );
  }

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'name' : cityName,
      'favorite' : favorite
    };
  }
}