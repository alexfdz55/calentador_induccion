import 'package:calentador_induccion/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:calentador_induccion/app/shared/theme/theme_dark.dart';
import 'package:calentador_induccion/app/shared/theme/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeService {
  final prefs = PreferenciasUsuario();
  static final ThemeService _instance = new ThemeService._internal();
  // ThemeService._();

  ThemeService._internal();

  //static SharedPreferences prefs;
  //static ThemeService _instance;
  static Future<ThemeService> get instance async {
    // if (_instance == null) {
    //   prefs. = await SharedPreferences.getInstance();
    //   _instance = ThemeService._();
    // }
    return _instance;
  }

  final allThemes = <String, ThemeData>{
    'dark': darkThemeData(),
    'light': lightTheme(),
  };

  get initial {
    String? themeName = prefs.theme;
    if (themeName == '') {
      //Pone el tema segun la configuracion global del telefono
      final isPlatformDark =
          WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
      return allThemes[themeName];
    } else {
      return allThemes[themeName];
    }
  }

  save(String newThemeName) {
    var currentThemeName = prefs.theme;
    // prefs.previousThemeName = currentThemeName;
    prefs.theme = newThemeName;
  }

  ThemeData? getByName(String name) {
    return allThemes[name];
  }
}
