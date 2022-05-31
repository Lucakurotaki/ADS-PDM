import 'package:equatable/equatable.dart';

class GhibliFilm extends Equatable {
  final String id;
  final String title;
  final String director;
  final String image;
  final String description;
  final int releaseDate;
  final int runningTime;

  const GhibliFilm({
    required this.id,
    required this.title,
    required this.director,
    required this.image,
    required this.description,
    required this.releaseDate,
    required this.runningTime
    
  });

  @override
  List<Object> get props => [id, title, director, image, description, releaseDate, runningTime];

  factory GhibliFilm.fromJson(Map<String, dynamic> json){
    return GhibliFilm(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      image: json['image'],
      description: json['description'],
      releaseDate: json['release_date'],
      runningTime: json['running_time']
    );
  }
}
