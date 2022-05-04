import 'package:flutter/material.dart';
import 'package:routes/cityWeather.dart';
import 'weather.dart';
import 'capital.dart';

CityWeather cityWeather = CityWeather();

class WeatherScreen extends StatelessWidget{
  final Capital args;

  const WeatherScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text(args.cityName),
        backgroundColor: Colors.purple[800],
      ),
      body: WeatherPage(args: args),
    );
  }
}

class WeatherPage extends StatefulWidget{
  final Capital args;
  
  WeatherPage({Key? key, required this.args}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> weather;
  final bool init = true;

  @override
  void initState() {
    super.initState();
    weather = cityWeather.fetchWeather(widget.args.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Weather>(
        future: weather,
        builder: (context, json){
          if (json.hasData){
            return Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.white38,
                      child: Center(
                        child: Image.network('http://openweathermap.org/img/wn/${json.data!.icon}@4x.png'),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Card(
                        child: ListTile(
                          title: Text('Main: ${json.data!.main}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                          subtitle: Text('Description: ${json.data!.description}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                    ),
                  ), 
              ],
            );
          }else if(json.hasError){
            return Text("${json.error}");
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}