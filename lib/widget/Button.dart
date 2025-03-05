import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
    this.warnaButton,
    this.titleButton, {
    super.key,
    this.navigator,
    this.route,
    this.namaController,
  });

  final String titleButton;
  final Color warnaButton;

  final bool? navigator;
  final String? route;
  final TextEditingController? namaController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          Size(MediaQuery.of(context).size.width, 59),
        ),
        backgroundColor: WidgetStateProperty.all(warnaButton),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      onPressed: () {
        if (navigator != null) {
          Navigator.pushNamed(
            context,
            '/kuis',
            arguments: {'nama': namaController},
          );
        }
      },
      child: Text(
        titleButton,
        style: TextStyle(
          fontFamily: "Ballo_2",
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
