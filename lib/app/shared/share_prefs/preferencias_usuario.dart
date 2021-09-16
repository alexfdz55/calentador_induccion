import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  String get theme {
    return _prefs.getString('theme') ?? '';
  }

  set theme(String value) {
    _prefs.setString('theme', value);
  }

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  bool get isFirstInitApp {
    return _prefs.getBool('isFirstInitApp') ?? true;
  }

  set isFirstInitApp(bool value) {
    _prefs.setBool('isFirstInitApp', value);
  }

  double get pesoComida {
    return _prefs.getDouble('pesoComida') ?? 0.0;
  }

  set pesoComida(double value) {
    _prefs.setDouble('pesoComida', value);
  }

  int get cantidadComidas {
    return _prefs.getInt('cantidadComidas') ?? 0;
  }

  set cantidadComidas(int value) {
    _prefs.setInt('cantidadComidas', value);
  }

  double get pesoComidaDiario {
    return _prefs.getDouble('pesoComidaDiario') ?? 0.0;
  }

  set pesoComidaDiario(double value) {
    _prefs.setDouble('pesoComidaDiario', value);
  }

  List<String> get potencias {
    return _prefs.getStringList('potencias') ?? [];
  }

  set potencias(List<String> value) {
    _prefs.setStringList('potencias', value);
  }

  List<String> get temperaturas {
    return _prefs.getStringList('temperaturas') ?? [];
  }

  set temperaturas(List<String> value) {
    _prefs.setStringList('temperaturas', value);
  }

  List<String> get tiempos {
    return _prefs.getStringList('tiempos') ?? [];
  }

  set tiempos(List<String> value) {
    _prefs.setStringList('tiempos', value);
  }

  // setListData(String key, List<String> value) async {
  //   _prefs.setStringList(key, value);
  // }

  // Future<List<String>> getListData(String key) async {
  //   return _prefs.getStringList(key)!;
  // }
}
