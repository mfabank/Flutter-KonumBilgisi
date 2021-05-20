import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double enlem = 0.0;
  double boylam = 0.0;

  Future<void> konumGetir() async {
    var konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      enlem = konum.latitude;
      boylam = konum.longitude;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konum Bilgileri"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enlem : $enlem",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Boylam : $boylam",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: Text("Konum Bilgisi AL!"),
              onPressed: () {
                konumGetir();
              },
            ),
          ],
        ),
      ),
    );
  }
}
