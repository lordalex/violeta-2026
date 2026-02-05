// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> makeprofile(
  String? cedula,
  String? nombre,
  String? telefono,
  String? date,
  String? stado,
  String? municpio,
  String? parroquia,
  String? genero,
  String? discapacidad,
) async {
  Map<String, String> profile = {};

  if (cedula != null) profile['cedula'] = cedula;
  if (nombre != null) profile['nombre'] = nombre;
  if (telefono != null) profile['telefono'] = telefono;
  if (date != null) profile['date'] = date;
  if (stado != null) profile['stado'] = stado;
  if (municpio != null) profile['municipio'] = municpio;
  if (parroquia != null) profile['parroquia'] = parroquia;
  if (genero != null) profile['genero'] = genero;
  if (discapacidad != null) profile['discapacidad'] = discapacidad;

  return jsonEncode(profile);
}
