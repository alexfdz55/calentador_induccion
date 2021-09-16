import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:calentador_induccion/app/modules/config_room/components/potencia_widget.dart';
import 'package:calentador_induccion/app/modules/web_socket/views/web_socket_view.dart';
import 'package:calentador_induccion/app/shared/theme/theme_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/data/colors_text.dart';
import 'app/routes/app_pages.dart';
import 'app/shared/share_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  final themeServise = await ThemeService.instance;
  var initTheme = themeServise.initial;

  runApp(MyApp(theme: initTheme));
  //MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  MyApp({required this.theme});

  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        initTheme: theme,
        builder: (_, theme) {
          textColor = theme!.textTheme.bodyText1!.color!;
          isDark = theme.brightness == Brightness.dark;
          isLight = theme.brightness == Brightness.light;

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Aquecedor por Indução",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: theme,
            // home: WebSocketView()
            // darkTheme: darkThemeData(),
          );
        });
  }
}
