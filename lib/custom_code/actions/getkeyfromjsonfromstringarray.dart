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

import 'dart:convert';

Future<String> getkeyfromjsonfromstringarray(
  List<String> stringList,
  String key,
) async {
  if (stringList.length > 0) {
    if (stringList == null) return " ";
    if (stringList == "null") return " ";
    print(stringList);
    print("*************");
    for (String string in stringList) {
      print(string);
      print("*************");
      if (string.length < 2) return "   ";
      final json = jsonDecode(string);
      if (json.containsKey(key)) {
        return json[key];
      }
    }
  }
  return "  ";
}
