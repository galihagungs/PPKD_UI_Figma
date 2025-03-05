import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_ppkd/widget/Button.dart';

class KuisPage extends StatefulWidget {
  const KuisPage({super.key});

  @override
  State<KuisPage> createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  late Map data;
  String dataValue = "";
  Timer? timer;
  static const maxSecond = 30;
  int second = maxSecond;
  bool isRed = false;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (second != 0) {
          second--;
          if (second < 10) {
            isRed = !isRed;
          } else if (second == 0) {
            isRed = false;
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      timer?.cancel();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          size: 24,
                          color: Color(0xFF004643),
                        ),
                        Text(
                          " Previous",
                          style: TextStyle(
                            fontFamily: "Ballo_2",
                            fontSize: 12,
                            color: Color(0xFF004643),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "7/10",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Ballo_2",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(child: SizedBox(width: 5)),
              ],
            ),
            SizedBox(height: 31),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    SizedBox(height: 55),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 229,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: -10,
                            blurRadius: 50,
                            offset: Offset(0, 20), // Shadow position
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Tahun berapa saat ini?",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Ballo_2",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: isRed == true ? Colors.redAccent : Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color:
                                isRed == true
                                    ? Colors.redAccent
                                    : Colors.blueGrey,
                            blurRadius: 10,
                            offset: Offset(0, 2), // Shadow position
                          ),
                        ],
                      ),
                    ),
                    Text(
                      second.toString(),
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Ballo_2",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 86,
                      height: 86,
                      child: CircularProgressIndicator(
                        color: Color(0xFF004643),
                        backgroundColor: Color(0xFFABD1C6),
                        // value: 0.2,
                        value: second / maxSecond,
                        strokeWidth: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 50),
            optionJawaban(context, '2000'),
            SizedBox(height: 15),
            optionJawaban(context, '2025'),
            SizedBox(height: 15),
            optionJawaban(context, '2023'),
            SizedBox(height: 15),
            optionJawaban(context, '2024'),
            SizedBox(height: 50),
            Button(Color(0xFF004643), "Next"),
          ],
        ),
      ),
    );
  }

  InkWell optionJawaban(BuildContext context, String title) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        setState(() {
          dataValue = title;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 53,
        decoration: BoxDecoration(
          color: dataValue == title ? Color(0xFFABD1C6) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // BoxShadow(
            //   color: dataValue == title ? Color(0xFF002E2C) : Colors.blueGrey,
            //   blurRadius: 10,
            //   offset: Offset(-1, 10), // Shadow position
            // ),
            BoxShadow(
              color:
                  dataValue == title
                      ? Color(0xFFABD1C6).withOpacity(0.15)
                      : Colors.white,
              spreadRadius: -10,
              blurRadius: 20,
              offset: Offset(0, 20), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Ballo_2",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF004643),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  title == dataValue
                      ? SizedBox(
                        height: 24,
                        width: 24,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(backgroundColor: Color(0xFF004643)),
                            Icon(Icons.check, color: Colors.white, size: 20),
                          ],
                        ),
                      )
                      : SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          value: 1.0,
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
