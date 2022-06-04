import 'package:equatable/equatable.dart';

class GhibliFilm extends Equatable {
  final String fId;
  final String title;
  final String director;
  final String image;
  final String description;
  final int releaseDate;
  final int runningTime;

  const GhibliFilm({
    required this.fId,
    required this.title,
    required this.director,
    required this.image,
    required this.description,
    required this.releaseDate,
    required this.runningTime
    
  });

  @override
  List<Object> get props => [fId, title, director, image, description, releaseDate, runningTime];

  
}
