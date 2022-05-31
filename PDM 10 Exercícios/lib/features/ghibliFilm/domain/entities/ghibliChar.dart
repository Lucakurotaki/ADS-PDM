import 'package:equatable/equatable.dart';

class GhibliChar extends Equatable {
  final String id;
  final String gender;
  final int age;
  final String eyeColor;
  final String hairColor;
  final List<String> films;
  final String species;

  const GhibliChar({
    required this.id,
    required this.gender,
    required this.age,
    required this.eyeColor,
    required this.hairColor,
    required this.films,
    required this.species
    
  });

  @override
  List<Object> get props => [[{id, gender, age, eyeColor, hairColor, films, species}]];

  factory GhibliChar.fromJson(Map<String, dynamic> json){
    return GhibliChar(
      id: json['id'],
      gender: json['gender'],
      age: json['age'],
      eyeColor: json['eye_color'],
      hairColor: json['hair_color'],
      films: json['films'],
      species: json['species']
    );
  }
}
