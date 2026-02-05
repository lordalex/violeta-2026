import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _firstTime = await secureStorage.getBool('ff_firstTime') ?? _firstTime;
    });
    await _safeInitAsync(() async {
      _PerfilCreado =
          await secureStorage.getBool('ff_PerfilCreado') ?? _PerfilCreado;
    });
    await _safeInitAsync(() async {
      _LocalizacionActiva =
          await secureStorage.getBool('ff_LocalizacionActiva') ??
              _LocalizacionActiva;
    });
    await _safeInitAsync(() async {
      _ContactosDeEmergencia =
          await secureStorage.getStringList('ff_ContactosDeEmergencia') ??
              _ContactosDeEmergencia;
    });
    await _safeInitAsync(() async {
      _listaadeestados =
          await secureStorage.getStringList('ff_listaadeestados') ??
              _listaadeestados;
    });
    await _safeInitAsync(() async {
      _walktroughCompleted =
          await secureStorage.getBool('ff_walktroughCompleted') ??
              _walktroughCompleted;
    });
    await _safeInitAsync(() async {
      _listadodestaticos =
          await secureStorage.getStringList('ff_listadodestaticos') ??
              _listadodestaticos;
    });
    await _safeInitAsync(() async {
      _rutasvisitadas =
          await secureStorage.getString('ff_rutasvisitadas') ?? _rutasvisitadas;
    });
    await _safeInitAsync(() async {
      _profile = await secureStorage.getString('ff_profile') ?? _profile;
    });
    await _safeInitAsync(() async {
      _message = await secureStorage.getString('ff_message') ?? _message;
    });
    await _safeInitAsync(() async {
      _listadodestacados =
          await secureStorage.getStringList('ff_listadodestacados') ??
              _listadodestacados;
    });
    await _safeInitAsync(() async {
      _listadodeinteractivos =
          await secureStorage.getStringList('ff_listadodeinteractivos') ??
              _listadodeinteractivos;
    });
    await _safeInitAsync(() async {
      _interactivoData =
          await secureStorage.getStringList('ff_interactivoData') ??
              _interactivoData;
    });
    await _safeInitAsync(() async {
      _startedDateTimeAcompaname =
          await secureStorage.read(key: 'ff_startedDateTimeAcompaname') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_startedDateTimeAcompaname'))!)
              : _startedDateTimeAcompaname;
    });
    await _safeInitAsync(() async {
      _timeRangeSelectedInMsAcompaname =
          await secureStorage.getInt('ff_timeRangeSelectedInMsAcompaname') ??
              _timeRangeSelectedInMsAcompaname;
    });
    await _safeInitAsync(() async {
      _integerTimerSelectorAcompaname =
          await secureStorage.getInt('ff_integerTimerSelectorAcompaname') ??
              _integerTimerSelectorAcompaname;
    });
    await _safeInitAsync(() async {
      _counterAcompaname = await secureStorage.getInt('ff_counterAcompaname') ??
          _counterAcompaname;
    });
    await _safeInitAsync(() async {
      _periodic30secondsTimerSelector =
          await secureStorage.getInt('ff_periodic30secondsTimerSelector') ??
              _periodic30secondsTimerSelector;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _firstTime = false;
  bool get firstTime => _firstTime;
  set firstTime(bool value) {
    _firstTime = value;
    secureStorage.setBool('ff_firstTime', value);
  }

  void deleteFirstTime() {
    secureStorage.delete(key: 'ff_firstTime');
  }

  bool _PerfilCreado = false;
  bool get PerfilCreado => _PerfilCreado;
  set PerfilCreado(bool value) {
    _PerfilCreado = value;
    secureStorage.setBool('ff_PerfilCreado', value);
  }

  void deletePerfilCreado() {
    secureStorage.delete(key: 'ff_PerfilCreado');
  }

  bool _LocalizacionActiva = false;
  bool get LocalizacionActiva => _LocalizacionActiva;
  set LocalizacionActiva(bool value) {
    _LocalizacionActiva = value;
    secureStorage.setBool('ff_LocalizacionActiva', value);
  }

  void deleteLocalizacionActiva() {
    secureStorage.delete(key: 'ff_LocalizacionActiva');
  }

  List<String> _ContactosDeEmergencia = [' '];
  List<String> get ContactosDeEmergencia => _ContactosDeEmergencia;
  set ContactosDeEmergencia(List<String> value) {
    _ContactosDeEmergencia = value;
    secureStorage.setStringList('ff_ContactosDeEmergencia', value);
  }

  void deleteContactosDeEmergencia() {
    secureStorage.delete(key: 'ff_ContactosDeEmergencia');
  }

  void addToContactosDeEmergencia(String value) {
    ContactosDeEmergencia.add(value);
    secureStorage.setStringList(
        'ff_ContactosDeEmergencia', _ContactosDeEmergencia);
  }

  void removeFromContactosDeEmergencia(String value) {
    ContactosDeEmergencia.remove(value);
    secureStorage.setStringList(
        'ff_ContactosDeEmergencia', _ContactosDeEmergencia);
  }

  void removeAtIndexFromContactosDeEmergencia(int index) {
    ContactosDeEmergencia.removeAt(index);
    secureStorage.setStringList(
        'ff_ContactosDeEmergencia', _ContactosDeEmergencia);
  }

  void updateContactosDeEmergenciaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ContactosDeEmergencia[index] = updateFn(_ContactosDeEmergencia[index]);
    secureStorage.setStringList(
        'ff_ContactosDeEmergencia', _ContactosDeEmergencia);
  }

  void insertAtIndexInContactosDeEmergencia(int index, String value) {
    ContactosDeEmergencia.insert(index, value);
    secureStorage.setStringList(
        'ff_ContactosDeEmergencia', _ContactosDeEmergencia);
  }

  List<String> _listaadeestados = ['  '];
  List<String> get listaadeestados => _listaadeestados;
  set listaadeestados(List<String> value) {
    _listaadeestados = value;
    secureStorage.setStringList('ff_listaadeestados', value);
  }

  void deleteListaadeestados() {
    secureStorage.delete(key: 'ff_listaadeestados');
  }

  void addToListaadeestados(String value) {
    listaadeestados.add(value);
    secureStorage.setStringList('ff_listaadeestados', _listaadeestados);
  }

  void removeFromListaadeestados(String value) {
    listaadeestados.remove(value);
    secureStorage.setStringList('ff_listaadeestados', _listaadeestados);
  }

  void removeAtIndexFromListaadeestados(int index) {
    listaadeestados.removeAt(index);
    secureStorage.setStringList('ff_listaadeestados', _listaadeestados);
  }

  void updateListaadeestadosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaadeestados[index] = updateFn(_listaadeestados[index]);
    secureStorage.setStringList('ff_listaadeestados', _listaadeestados);
  }

  void insertAtIndexInListaadeestados(int index, String value) {
    listaadeestados.insert(index, value);
    secureStorage.setStringList('ff_listaadeestados', _listaadeestados);
  }

  List<String> _errores = [];
  List<String> get errores => _errores;
  set errores(List<String> value) {
    _errores = value;
  }

  void addToErrores(String value) {
    errores.add(value);
  }

  void removeFromErrores(String value) {
    errores.remove(value);
  }

  void removeAtIndexFromErrores(int index) {
    errores.removeAt(index);
  }

  void updateErroresAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    errores[index] = updateFn(_errores[index]);
  }

  void insertAtIndexInErrores(int index, String value) {
    errores.insert(index, value);
  }

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? value) {
    _date = value;
  }

  bool _walktroughCompleted = false;
  bool get walktroughCompleted => _walktroughCompleted;
  set walktroughCompleted(bool value) {
    _walktroughCompleted = value;
    secureStorage.setBool('ff_walktroughCompleted', value);
  }

  void deleteWalktroughCompleted() {
    secureStorage.delete(key: 'ff_walktroughCompleted');
  }

  List<String> _listadodestaticos = [' '];
  List<String> get listadodestaticos => _listadodestaticos;
  set listadodestaticos(List<String> value) {
    _listadodestaticos = value;
    secureStorage.setStringList('ff_listadodestaticos', value);
  }

  void deleteListadodestaticos() {
    secureStorage.delete(key: 'ff_listadodestaticos');
  }

  void addToListadodestaticos(String value) {
    listadodestaticos.add(value);
    secureStorage.setStringList('ff_listadodestaticos', _listadodestaticos);
  }

  void removeFromListadodestaticos(String value) {
    listadodestaticos.remove(value);
    secureStorage.setStringList('ff_listadodestaticos', _listadodestaticos);
  }

  void removeAtIndexFromListadodestaticos(int index) {
    listadodestaticos.removeAt(index);
    secureStorage.setStringList('ff_listadodestaticos', _listadodestaticos);
  }

  void updateListadodestaticosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listadodestaticos[index] = updateFn(_listadodestaticos[index]);
    secureStorage.setStringList('ff_listadodestaticos', _listadodestaticos);
  }

  void insertAtIndexInListadodestaticos(int index, String value) {
    listadodestaticos.insert(index, value);
    secureStorage.setStringList('ff_listadodestaticos', _listadodestaticos);
  }

  List<String> _listadoimagenesstaticos = [];
  List<String> get listadoimagenesstaticos => _listadoimagenesstaticos;
  set listadoimagenesstaticos(List<String> value) {
    _listadoimagenesstaticos = value;
  }

  void addToListadoimagenesstaticos(String value) {
    listadoimagenesstaticos.add(value);
  }

  void removeFromListadoimagenesstaticos(String value) {
    listadoimagenesstaticos.remove(value);
  }

  void removeAtIndexFromListadoimagenesstaticos(int index) {
    listadoimagenesstaticos.removeAt(index);
  }

  void updateListadoimagenesstaticosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listadoimagenesstaticos[index] = updateFn(_listadoimagenesstaticos[index]);
  }

  void insertAtIndexInListadoimagenesstaticos(int index, String value) {
    listadoimagenesstaticos.insert(index, value);
  }

  String _avatarname = 'Vx';
  String get avatarname => _avatarname;
  set avatarname(String value) {
    _avatarname = value;
  }

  String _ruta = 'Home';
  String get ruta => _ruta;
  set ruta(String value) {
    _ruta = value;
  }

  String _estadosurl =
      'https://bripwlbmdjnkvlbsunvq.supabase.co/storage/v1/object/public/files/estados.json?t=2024-11-24T15%3A33%3A51.974Z';
  String get estadosurl => _estadosurl;
  set estadosurl(String value) {
    _estadosurl = value;
  }

  String _rutasvisitadas = '';
  String get rutasvisitadas => _rutasvisitadas;
  set rutasvisitadas(String value) {
    _rutasvisitadas = value;
    secureStorage.setString('ff_rutasvisitadas', value);
  }

  void deleteRutasvisitadas() {
    secureStorage.delete(key: 'ff_rutasvisitadas');
  }

  String _profile = '';
  String get profile => _profile;
  set profile(String value) {
    _profile = value;
    secureStorage.setString('ff_profile', value);
  }

  void deleteProfile() {
    secureStorage.delete(key: 'ff_profile');
  }

  String _estadosjsondownloaded = '';
  String get estadosjsondownloaded => _estadosjsondownloaded;
  set estadosjsondownloaded(String value) {
    _estadosjsondownloaded = value;
  }

  String _message = 'MENSAJE NO CARGADO';
  String get message => _message;
  set message(String value) {
    _message = value;
    secureStorage.setString('ff_message', value);
  }

  void deleteMessage() {
    secureStorage.delete(key: 'ff_message');
  }

  String _interactivoIndex = '';
  String get interactivoIndex => _interactivoIndex;
  set interactivoIndex(String value) {
    _interactivoIndex = value;
  }

  List<String> _listadodestacados = [];
  List<String> get listadodestacados => _listadodestacados;
  set listadodestacados(List<String> value) {
    _listadodestacados = value;
    secureStorage.setStringList('ff_listadodestacados', value);
  }

  void deleteListadodestacados() {
    secureStorage.delete(key: 'ff_listadodestacados');
  }

  void addToListadodestacados(String value) {
    listadodestacados.add(value);
    secureStorage.setStringList('ff_listadodestacados', _listadodestacados);
  }

  void removeFromListadodestacados(String value) {
    listadodestacados.remove(value);
    secureStorage.setStringList('ff_listadodestacados', _listadodestacados);
  }

  void removeAtIndexFromListadodestacados(int index) {
    listadodestacados.removeAt(index);
    secureStorage.setStringList('ff_listadodestacados', _listadodestacados);
  }

  void updateListadodestacadosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listadodestacados[index] = updateFn(_listadodestacados[index]);
    secureStorage.setStringList('ff_listadodestacados', _listadodestacados);
  }

  void insertAtIndexInListadodestacados(int index, String value) {
    listadodestacados.insert(index, value);
    secureStorage.setStringList('ff_listadodestacados', _listadodestacados);
  }

  List<String> _listadodeinteractivos = [];
  List<String> get listadodeinteractivos => _listadodeinteractivos;
  set listadodeinteractivos(List<String> value) {
    _listadodeinteractivos = value;
    secureStorage.setStringList('ff_listadodeinteractivos', value);
  }

  void deleteListadodeinteractivos() {
    secureStorage.delete(key: 'ff_listadodeinteractivos');
  }

  void addToListadodeinteractivos(String value) {
    listadodeinteractivos.add(value);
    secureStorage.setStringList(
        'ff_listadodeinteractivos', _listadodeinteractivos);
  }

  void removeFromListadodeinteractivos(String value) {
    listadodeinteractivos.remove(value);
    secureStorage.setStringList(
        'ff_listadodeinteractivos', _listadodeinteractivos);
  }

  void removeAtIndexFromListadodeinteractivos(int index) {
    listadodeinteractivos.removeAt(index);
    secureStorage.setStringList(
        'ff_listadodeinteractivos', _listadodeinteractivos);
  }

  void updateListadodeinteractivosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listadodeinteractivos[index] = updateFn(_listadodeinteractivos[index]);
    secureStorage.setStringList(
        'ff_listadodeinteractivos', _listadodeinteractivos);
  }

  void insertAtIndexInListadodeinteractivos(int index, String value) {
    listadodeinteractivos.insert(index, value);
    secureStorage.setStringList(
        'ff_listadodeinteractivos', _listadodeinteractivos);
  }

  List<String> _interactivoData = [];
  List<String> get interactivoData => _interactivoData;
  set interactivoData(List<String> value) {
    _interactivoData = value;
    secureStorage.setStringList('ff_interactivoData', value);
  }

  void deleteInteractivoData() {
    secureStorage.delete(key: 'ff_interactivoData');
  }

  void addToInteractivoData(String value) {
    interactivoData.add(value);
    secureStorage.setStringList('ff_interactivoData', _interactivoData);
  }

  void removeFromInteractivoData(String value) {
    interactivoData.remove(value);
    secureStorage.setStringList('ff_interactivoData', _interactivoData);
  }

  void removeAtIndexFromInteractivoData(int index) {
    interactivoData.removeAt(index);
    secureStorage.setStringList('ff_interactivoData', _interactivoData);
  }

  void updateInteractivoDataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    interactivoData[index] = updateFn(_interactivoData[index]);
    secureStorage.setStringList('ff_interactivoData', _interactivoData);
  }

  void insertAtIndexInInteractivoData(int index, String value) {
    interactivoData.insert(index, value);
    secureStorage.setStringList('ff_interactivoData', _interactivoData);
  }

  bool _sendinglocation = false;
  bool get sendinglocation => _sendinglocation;
  set sendinglocation(bool value) {
    _sendinglocation = value;
  }

  String _locationdata = '';
  String get locationdata => _locationdata;
  set locationdata(String value) {
    _locationdata = value;
  }

  DateTime? _startedDateTimeAcompaname;
  DateTime? get startedDateTimeAcompaname => _startedDateTimeAcompaname;
  set startedDateTimeAcompaname(DateTime? value) {
    _startedDateTimeAcompaname = value;
    value != null
        ? secureStorage.setInt(
            'ff_startedDateTimeAcompaname', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_startedDateTimeAcompaname');
  }

  void deleteStartedDateTimeAcompaname() {
    secureStorage.delete(key: 'ff_startedDateTimeAcompaname');
  }

  int _timeRangeSelectedInMsAcompaname = 0;
  int get timeRangeSelectedInMsAcompaname => _timeRangeSelectedInMsAcompaname;
  set timeRangeSelectedInMsAcompaname(int value) {
    _timeRangeSelectedInMsAcompaname = value;
    secureStorage.setInt('ff_timeRangeSelectedInMsAcompaname', value);
  }

  void deleteTimeRangeSelectedInMsAcompaname() {
    secureStorage.delete(key: 'ff_timeRangeSelectedInMsAcompaname');
  }

  int _integerTimerSelectorAcompaname = 0;
  int get integerTimerSelectorAcompaname => _integerTimerSelectorAcompaname;
  set integerTimerSelectorAcompaname(int value) {
    _integerTimerSelectorAcompaname = value;
    secureStorage.setInt('ff_integerTimerSelectorAcompaname', value);
  }

  void deleteIntegerTimerSelectorAcompaname() {
    secureStorage.delete(key: 'ff_integerTimerSelectorAcompaname');
  }

  int _counterAcompaname = 0;
  int get counterAcompaname => _counterAcompaname;
  set counterAcompaname(int value) {
    _counterAcompaname = value;
    secureStorage.setInt('ff_counterAcompaname', value);
  }

  void deleteCounterAcompaname() {
    secureStorage.delete(key: 'ff_counterAcompaname');
  }

  int _periodic30secondsTimerSelector = 0;
  int get periodic30secondsTimerSelector => _periodic30secondsTimerSelector;
  set periodic30secondsTimerSelector(int value) {
    _periodic30secondsTimerSelector = value;
    secureStorage.setInt('ff_periodic30secondsTimerSelector', value);
  }

  void deletePeriodic30secondsTimerSelector() {
    secureStorage.delete(key: 'ff_periodic30secondsTimerSelector');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
