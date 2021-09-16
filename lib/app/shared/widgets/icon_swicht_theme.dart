import 'package:animate_icons/animate_icons.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:calentador_induccion/app/data/colors_text.dart';
import 'package:calentador_induccion/app/shared/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconSwitchTheme extends StatelessWidget {
  AnimateIconController c1 = AnimateIconController();
  late IconData icon;
  late IconData icon2;

  IconData iconDark = FontAwesomeIcons.solidMoon;
  IconData iconLight = FontAwesomeIcons.solidSun;

  @override
  Widget build(BuildContext context) {
    icon = isLight ? iconDark : iconLight;
    icon2 = isLight ? iconLight : iconDark;
    return ThemeSwitcher(
      builder: (context) {
        return AnimateIcons(
          duration: Duration(milliseconds: 500),
          startIconColor: textColor,
          endIconColor: textColor,
          startIcon: icon,
          endIcon: icon2,
          controller: c1,
          size: 25.0,
          onEndIconPress: () {
            print('object');
            changeTheme(context);
            return true;
          },
          onStartIconPress: () {
            changeTheme(context);
            return true;
          },
        );
      },
    );
  }

  changeTheme(BuildContext context) async {
    var themeName = ThemeProvider.of(context)!.brightness == Brightness.light
        ? 'dark'
        : 'light';
    var service = await ThemeService.instance
      ..save(themeName);
    var theme = service.getByName(themeName);
    // ThemeSwitcher.of(context)!
    //     .changeTheme(theme: theme);

    var brightness = ThemeProvider.of(context)!.brightness;
    ThemeSwitcher.of(context)!.changeTheme(
      theme: theme,
      reverseAnimation: brightness == Brightness.dark ? true : false,
    );
  }
}
