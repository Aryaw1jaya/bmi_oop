import 'bmi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Body Mass Index - OOP',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  BodyMassIndex bmi = BodyMassIndex();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              "Jenis Kelamin Anda ?",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 30),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                      value: "Laki-laki",
                      groupValue: bmi.gender,
                      onChanged: (value) {
                        setState(() {
                          bmi.gender = value.toString();
                        });
                      }),
                  Text("Laki-laki"),
                  Radio(
                      value: "Perempuan",
                      groupValue: bmi.gender,
                      onChanged: (value) {
                        setState(() {
                          bmi.gender = value.toString();
                        });
                      }),
                  Text("Perempuan"),
                ]),
            SizedBox(height: 30),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Tinggi Badan  ${bmi.height}  Cm'),
                ]),
            SizedBox(height: 30),
            Slider(
              value: bmi.height,
              min: 80,
              max: 280,
              divisions: 300,
              activeColor: Colors.lightGreen,
              inactiveColor: Colors.white54,
              label: "Tinggi Badan",
              onChanged: (value) {
                setState(() {
                  bmi.height = value.roundToDouble();
                });
              },
            ),
            SizedBox(height: 30),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Berat'),
                      Text('${bmi.weight}'),
                      Row(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                bmi.weight--;
                              });
                            },
                            child: Text('-'),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                bmi.weight++;
                              });
                            },
                            child: Text('+'),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Usia'),
                      Text('${bmi.age}'),
                      Row(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                bmi.age--;
                              });
                            },
                            child: Text('-'),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                bmi.age++;
                              });
                            },
                            child: Text('+'),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ]),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Foreground color
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                // Background color
                primary: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: bmi.calculateBMI(),
                      resultText: bmi.getResult(),
                      interpretation: bmi.getInterpretation(),
                    ),
                  ),
                );
              },
              child: const Text('Hitung BMI'),
            ),
          ],
        )));
  }
}

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Text('Hasil Anda Adalah...',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 19, 186, 0))),
            SizedBox(height: 30),
            Text(resultText.toUpperCase(),
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 19, 186, 0))),
            SizedBox(height: 30),
            Text(bmiResult,
                style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 30),
            Text(interpretation,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Foreground color
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                // Background color
                primary: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hitung Ulang'),
            ),
          ],
        ),
      ),
    );
  }
}
