import 'package:flutter/material.dart';
import 'package:routes/weatherScreen.dart';
import 'capital.dart';

class CapitalsListItem extends StatelessWidget{
  const CapitalsListItem({
    required this.cityName,
    required this.favorite,
    Key? key,
  }) : super(key: key);

  final String cityName;
  final bool favorite;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: const Icon(Icons.location_on_sharp),
      title: Text(cityName),
      subtitle: const Icon(Icons.blur_on_sharp),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherScreen(
              args: Capital(cityName: cityName, favorite: favorite),
            )
          )
        );
      },
    ),
  );

}