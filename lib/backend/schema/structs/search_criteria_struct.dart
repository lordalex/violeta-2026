// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchCriteriaStruct extends BaseStruct {
  SearchCriteriaStruct({
    String? nombreOrganizacion,
    String? servicioOffrecido,
    String? direccion,
    String? municipioCobertura,
    String? nombrePuntoFocal,
    String? telefono,
    String? correoElectronico,
  })  : _nombreOrganizacion = nombreOrganizacion,
        _servicioOffrecido = servicioOffrecido,
        _direccion = direccion,
        _municipioCobertura = municipioCobertura,
        _nombrePuntoFocal = nombrePuntoFocal,
        _telefono = telefono,
        _correoElectronico = correoElectronico;

  // "nombre_organizacion" field.
  String? _nombreOrganizacion;
  String get nombreOrganizacion => _nombreOrganizacion ?? '';
  set nombreOrganizacion(String? val) => _nombreOrganizacion = val;

  bool hasNombreOrganizacion() => _nombreOrganizacion != null;

  // "servicio_offrecido" field.
  String? _servicioOffrecido;
  String get servicioOffrecido => _servicioOffrecido ?? '';
  set servicioOffrecido(String? val) => _servicioOffrecido = val;

  bool hasServicioOffrecido() => _servicioOffrecido != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  set direccion(String? val) => _direccion = val;

  bool hasDireccion() => _direccion != null;

  // "municipio_cobertura" field.
  String? _municipioCobertura;
  String get municipioCobertura => _municipioCobertura ?? '';
  set municipioCobertura(String? val) => _municipioCobertura = val;

  bool hasMunicipioCobertura() => _municipioCobertura != null;

  // "nombre_punto_focal" field.
  String? _nombrePuntoFocal;
  String get nombrePuntoFocal => _nombrePuntoFocal ?? '';
  set nombrePuntoFocal(String? val) => _nombrePuntoFocal = val;

  bool hasNombrePuntoFocal() => _nombrePuntoFocal != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  set telefono(String? val) => _telefono = val;

  bool hasTelefono() => _telefono != null;

  // "correo_electronico" field.
  String? _correoElectronico;
  String get correoElectronico => _correoElectronico ?? '';
  set correoElectronico(String? val) => _correoElectronico = val;

  bool hasCorreoElectronico() => _correoElectronico != null;

  static SearchCriteriaStruct fromMap(Map<String, dynamic> data) =>
      SearchCriteriaStruct(
        nombreOrganizacion: data['nombre_organizacion'] as String?,
        servicioOffrecido: data['servicio_offrecido'] as String?,
        direccion: data['direccion'] as String?,
        municipioCobertura: data['municipio_cobertura'] as String?,
        nombrePuntoFocal: data['nombre_punto_focal'] as String?,
        telefono: data['telefono'] as String?,
        correoElectronico: data['correo_electronico'] as String?,
      );

  static SearchCriteriaStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchCriteriaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre_organizacion': _nombreOrganizacion,
        'servicio_offrecido': _servicioOffrecido,
        'direccion': _direccion,
        'municipio_cobertura': _municipioCobertura,
        'nombre_punto_focal': _nombrePuntoFocal,
        'telefono': _telefono,
        'correo_electronico': _correoElectronico,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre_organizacion': serializeParam(
          _nombreOrganizacion,
          ParamType.String,
        ),
        'servicio_offrecido': serializeParam(
          _servicioOffrecido,
          ParamType.String,
        ),
        'direccion': serializeParam(
          _direccion,
          ParamType.String,
        ),
        'municipio_cobertura': serializeParam(
          _municipioCobertura,
          ParamType.String,
        ),
        'nombre_punto_focal': serializeParam(
          _nombrePuntoFocal,
          ParamType.String,
        ),
        'telefono': serializeParam(
          _telefono,
          ParamType.String,
        ),
        'correo_electronico': serializeParam(
          _correoElectronico,
          ParamType.String,
        ),
      }.withoutNulls;

  static SearchCriteriaStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchCriteriaStruct(
        nombreOrganizacion: deserializeParam(
          data['nombre_organizacion'],
          ParamType.String,
          false,
        ),
        servicioOffrecido: deserializeParam(
          data['servicio_offrecido'],
          ParamType.String,
          false,
        ),
        direccion: deserializeParam(
          data['direccion'],
          ParamType.String,
          false,
        ),
        municipioCobertura: deserializeParam(
          data['municipio_cobertura'],
          ParamType.String,
          false,
        ),
        nombrePuntoFocal: deserializeParam(
          data['nombre_punto_focal'],
          ParamType.String,
          false,
        ),
        telefono: deserializeParam(
          data['telefono'],
          ParamType.String,
          false,
        ),
        correoElectronico: deserializeParam(
          data['correo_electronico'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SearchCriteriaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchCriteriaStruct &&
        nombreOrganizacion == other.nombreOrganizacion &&
        servicioOffrecido == other.servicioOffrecido &&
        direccion == other.direccion &&
        municipioCobertura == other.municipioCobertura &&
        nombrePuntoFocal == other.nombrePuntoFocal &&
        telefono == other.telefono &&
        correoElectronico == other.correoElectronico;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nombreOrganizacion,
        servicioOffrecido,
        direccion,
        municipioCobertura,
        nombrePuntoFocal,
        telefono,
        correoElectronico
      ]);
}

SearchCriteriaStruct createSearchCriteriaStruct({
  String? nombreOrganizacion,
  String? servicioOffrecido,
  String? direccion,
  String? municipioCobertura,
  String? nombrePuntoFocal,
  String? telefono,
  String? correoElectronico,
}) =>
    SearchCriteriaStruct(
      nombreOrganizacion: nombreOrganizacion,
      servicioOffrecido: servicioOffrecido,
      direccion: direccion,
      municipioCobertura: municipioCobertura,
      nombrePuntoFocal: nombrePuntoFocal,
      telefono: telefono,
      correoElectronico: correoElectronico,
    );
