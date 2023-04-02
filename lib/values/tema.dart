import 'package:flutter/material.dart';

const Color primary = Color(0xff272838);

const Color secundary = Color(0xff7E7F9A);

const Color blanco = Color(0xddF9F8F8);

const Color amarillo = Color(0xffF3DE8A);

const Color rojo = Color(0xffEB9486);

miTema(BuildContext con) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.yellow,
    ).copyWith(
      secondary: secundary 
    )
  );
}
