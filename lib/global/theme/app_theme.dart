import 'package:flutter/material.dart';

final ThemeData appTheme = _theme();

ThemeData _theme() {
  final ThemeData base = ThemeData.light();

  const titleColor = Color(0xFF000AFF);
  const backgroundColor = Color(0xFFFFFFFF);
  const onBackgroundColor = Color(0xFF000000);
  const primaryColor = Color(0xFF002093);
  const onPrimaryColor = Color(0xFFFFFFFF);
  const secondaryColor = Color(0xFFFDD140);
  const onSecondaryColor = Color(0xFF000000);
  const surfaceColor = Color(0xFFF0F0F0);
  const onSurfaceColor = Color(0xFFA4A4A4);
  const errorColor = Color(0xFFB00020);
  const onErrorColor = Color(0xFFFFFFFF);
  const tertiaryColor = Color(0xFFD9D9D9);
  const onTertiaryColor = Color(0xFF000000);
  const outlineColor = Color(0xFF000000);

  return base.copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light, // modo claro
      background: backgroundColor, // color de fondo
      onBackground: onBackgroundColor, // color de texto en el fondo
      primary: primaryColor, // color de navbar
      onPrimary: onPrimaryColor, // color de texto en navbar
      secondary: secondaryColor, // color de botones
      onSecondary: onSecondaryColor, // color de texto en botones
      surface: surfaceColor, // color de fondo de los inputs
      onSurface: onSurfaceColor, // color de texto en los inputs 
      error: errorColor, // color de error
      onError: onErrorColor, // color de texto en error
      tertiary: tertiaryColor, // color de fondo de los productos y notificaciones
      onTertiary: onTertiaryColor, // color de texto en los productos y notificaciones
      outline: outlineColor, // color de bordes
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle( // titulo de la app
        color: titleColor,
        fontSize: 64,
        fontWeight: FontWeight.w900,
        fontFamily: 'Lato',
      ),
      displayMedium: TextStyle( // Agrega un emprendimiento
        color: onBackgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle( // Campos requeridos para llenar
        color: onBackgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Lato',
      ),
      bodyLarge: TextStyle( // costo en las notificaciones
        color: onBackgroundColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lato', 
      ),
      bodyMedium: TextStyle( // titulo de las notificaciones
        color: onBackgroundColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lato',
      ),
      bodySmall: TextStyle( // texto de las notificaciones
        color: onBackgroundColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lato',
      ),
      labelLarge: TextStyle(// Botones
        color: onSecondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      labelMedium: TextStyle( // Botones de filtros
        color: onSecondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      labelSmall: TextStyle( // Texto dentro de inputs
        color: onSurfaceColor,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lato',
      )
    ),
  );
}