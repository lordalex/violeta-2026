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

Future<bool> checkIfElementIsInArray(
  List<String> array,
  List<String> searchStrings,
  int index,
) async {
  if (array.isEmpty ||
      searchStrings.isEmpty ||
      index < 0 ||
      index >= searchStrings.length) {
    return false;
  }
  String search = array[index];
  return searchStrings.contains(search);
}
