import 'package:flutter/material.dart';

void main() {
  runApp(HealthRiderApp());
}

class HealthRiderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthRider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HealthRiderHomePage(),
    );
  }
}

class HealthRiderHomePage extends StatefulWidget {
  @override
  _HealthRiderHomePageState createState() => _HealthRiderHomePageState();
}

class _HealthRiderHomePageState extends State<HealthRiderHomePage> {
  String modeOfTransportation = 'biking';
  double weight = 0.0;
  double distanceTraveled = 0.0;
  double caloriesBurned = 0.0;

  void calculateCaloriesBurned() {
    setState(() {
      if (modeOfTransportation == 'biking' || modeOfTransportation == 'walking') {
        caloriesBurned = weight * distanceTraveled * 0.5;
      } else {
        caloriesBurned = weight * distanceTraveled * 0.2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthRider'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mode of Transportation:'),
            DropdownButton<String>(
              value: modeOfTransportation,
              onChanged: (String? newValue) {
                setState(() {
                  modeOfTransportation = newValue!;
                });
              },
              items: <String>['biking', 'walking', 'driving', 'running']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text('Weight (in kg):'),
            TextField(
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Text('Distance Traveled (in km):'),
            TextField(
              onChanged: (value) {
                setState(() {
                  distanceTraveled = double.parse(value);
                });
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateCaloriesBurned,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text('Calories Burned: $caloriesBurned cal'),
          ],
        ),
      ),
    );
  }
}
