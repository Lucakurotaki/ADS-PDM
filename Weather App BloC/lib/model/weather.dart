import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable{
  final String cityName;
  final double temperature;

  @override
  List<Object> get props => [];

  const Weather({
    required this.cityName,
    required this.temperature
  });
}