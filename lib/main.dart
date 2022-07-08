
import 'package:flutter/material.dart';
import 'package:weatherflutter/weather_model.dart';
import 'data_service.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  // WeatherResponse _response;
  WeatherModel _response;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Container(
                    padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: Column(
                      children: [


                        Image.network('https://openweathermap.org/img/wn/${_response.weatherIcon}@2x.png'),
                        Text(
                            '${_response.temp}°',
                            style: TextStyle(fontSize: 40, color: Colors.white)
                        ),
                        Text(
                            '${_response.weatherDescription}',
                            style: TextStyle(fontSize: 20, color: Colors.white)
                        ),
                        Text(
                            'Давление: ${_response.pressure}',
                            style: TextStyle(fontSize: 20, color: Colors.white)
                        ),
                        Text(
                            'Влажность: ${_response.humidity}',
                            style: TextStyle(fontSize: 20, color: Colors.white)
                        ),







                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: Text('Search'))
              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}