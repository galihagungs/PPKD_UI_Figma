import 'package:flutter/material.dart';
import 'package:ui_ppkd/widget/Button.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final TextEditingController _namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/bg_login.png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 120),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your name",
                  style: TextStyle(
                    fontFamily: "Ballo_2",
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                controller: _namaController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  hintText: "John Deh...",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 17,
                  ),
                ),
              ),
              SizedBox(height: 227),
              Button(
                Color(0xFFF8C660),
                "Start",
                navigator: true,
                route: '/kuis',
                namaController: _namaController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
