import 'package:flutter/material.dart';
import 'package:teste_imobi_brasil/src/core/ui/themes/colors_constants.dart';

sealed class ImobiTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(color: Colors.grey),
  );

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsConstants.fundo
      ),
      backgroundColor: ColorsConstants.primaria,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      border: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: ColorsConstants.amarelo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      )
    ),
  );
}
