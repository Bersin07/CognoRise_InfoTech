import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF12a644)),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = 'Select Data';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.40,
              width: double.infinity,
              decoration: new BoxDecoration(color: Color(0xFF12a644)),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$_bmi",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Condition : ",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_condition",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Choose Data",
                    style: TextStyle(
                        color: Color(0xFF12a644),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height cm",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight kg",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 300,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              backgroundColor: Color(0xFF12a644),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: const Text(
            'Calculate',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            setState(() {
              _bmi = (_weight/((_height/100)*(_height/100))).round().toInt();
              if(_bmi>=18.5 && _bmi<=25){_condition= "Normal";}
              else if(_bmi>=25 && _bmi<=30){_condition= "Overweight";}
              else if(_bmi>30){_condition= "Obesity";}
              else {_condition="UnderWeight";}
            });
          },
        ),
),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
