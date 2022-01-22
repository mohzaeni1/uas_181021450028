import 'package:flutter/material.dart';
import 'package:uasmobile/data_service.dart';
import 'package:uasmobile/weather_model.dart';

//Moh Zaeni
//181021450028

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Weather weather = Weather();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 248,
                        height: 50,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hoverColor: Colors.teal[100],
                            hintText: "Masukkan Nama Kota",
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.teal[100]),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          onPressed: () async {
                            isFetch = true;
                            weather =
                                await dataService.fetchData(controller.text);
                            setState(() {});
                          },
                          child: Text("Cari"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal[800],
                            minimumSize: Size(150, 50),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: isFetch
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                                'http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                            Text(
                              '${weather.temp}°C',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              weather.name + " is " + weather.description,
                              // style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //   ),
                            )
                          ],
                        )
                      : SizedBox(
                          child: Text(
                            "Data belum dapat ditampilkan",
                            style: TextStyle(color: Colors.teal[200]),
                          ),
                        ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Suhu',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Kecepatan Angin',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Longtitude',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Latitude',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${weather.temp}°C'),
                                Text('${weather.wind} KM/h'),
                                Text('${weather.lon}'),
                                Text('${weather.lat}'),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
