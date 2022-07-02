import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';
import '../model/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if(event is GetWeather){
        emit(WeatherLoading());
        final weather = await _fetchWeatherFromFakeApi(event.cityName);
        emit(WeatherLoaded(weather));
      }
    }); 
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName){
    return Future.delayed(
      const Duration(seconds: 1),
      (){
        return Weather(
          cityName: cityName,
          temperature: 20 + Random().nextInt(15) + Random().nextDouble(),
        );
      }
    );
  }
}
