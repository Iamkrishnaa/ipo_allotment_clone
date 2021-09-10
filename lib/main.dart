import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iporesult/const.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CenterContent(),
          ),
          Container(
            padding: EdgeInsets.only(top: 48.0),
            child: Text(
              "© 2021 CDS and Clearing Limited. All Rights",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CenterContent extends StatefulWidget {
  @override
  _CenterContentState createState() => _CenterContentState();
}

class _CenterContentState extends State<CenterContent> {
  TextEditingController boidController = TextEditingController();
  static const companies = [
    "MAHILA LAGHUBITTA BITTIYA SANSTHA LTD.",
    "Sunrise Bluechip Fund",
    "Jyoti Life Insurance Ltd",
    "NIBL Samriddhi Fund -2",
    "CEDB Hydropower Development Company Ltd",
    "Prabhu Select Fund",
    "4% NMB Energy Bond 2092/93",
    "8.5 % PRVU Debenture 2087",
    "Mailung Khola Jal Vidhyut Company Ltd.",
    "Sanima Life Insurance Limited",
    "8% Nabil Debenture 2085",
    "Manushi Laghubitta Bittiya Sanstha Limited",
    "Terhathum Power Company Ltd"
  ];

  final List<DropdownMenuItem<String>> _companiesList = companies
      .map(
        (String company) => DropdownMenuItem<String>(
          value: company,
          child: Text(company),
        ),
      )
      .toList();

  bool isBoidValid = false;

  String? _choosenCompany;

  String decisionText = "";
  bool alloted = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kBox,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200.0,
            child: kLogo,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Check Share Result",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: _choosenCompany,
                    items: _companiesList,
                    hint: Text("Select Company"),
                    underline: SizedBox(),
                    icon: Visibility(
                      visible: false,
                      child: Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _choosenCompany = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: boidController,
                    onChanged: (value) {
                      if (value.length == 13) {
                        setState(() {
                          isBoidValid = true;
                        });
                      } else {
                        setState(() {
                          isBoidValid = false;
                        });
                      }
                    },
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: "16-digit BOID",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    int ran = Random().nextInt(2);
                    setState(() {
                      if (isBoidValid) {
                        if (ran == 1) {
                          alloted = false;
                          decisionText =
                              "Sorry, not allotted for the entered BOID.";
                        } else {
                          alloted = true;
                          decisionText = "Congratulation! Alloted 10 quantity";
                        }
                      } else {
                        alloted = false;
                        decisionText = "Invalid BOID";
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: kButtonColor,
                    ),
                    child: Text(
                      "View Result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: Text(
                    decisionText,
                    style: TextStyle(
                      color:
                          alloted ? Colors.greenAccent[700] : Colors.red[600],
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
