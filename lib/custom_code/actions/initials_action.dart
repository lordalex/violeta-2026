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

Future<String> initialsAction(String string1) async {
  List<String> words = string1.split(' ');
  String output;
  print(words);
  if (words.length == 1) {
    if (string1.length > 2) {
      output = string1.substring(0, 2).toUpperCase();
    } else
      output = string1;
  } else if (words.length >= 2) {
    if (words[0].length > 1 && words[1].length > 1)
      output = '${words[0][0].toUpperCase()}${words[1][0].toUpperCase()}';
    else {
      if (words[0].length > 1) {
        output = words[0][0] + words[0][1];
      } else {
        output = words[0];
      }
    }
  } else {
    output = 'Vx';
  }
  print(output);
  return output;
}
