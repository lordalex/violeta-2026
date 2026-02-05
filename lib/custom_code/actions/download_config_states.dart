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
import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<String>?> downloadConfigStates() async {
  final supabase = Supabase.instance.client;

  try {
    // Download the 'v.json' file from the 'config' bucket
    final Uint8List? fileData =
        await supabase.storage.from('config').download('v.json');

    if (fileData == null) {
      throw Exception('Failed to download file');
    }

    // Convert the file (Uint8List) to a string
    String fileContent = utf8.decode(fileData);

    // Parse the string content as JSON
    Map<String, dynamic> jsonData = jsonDecode(fileContent);

    // Retrieve the 'states' and 'cities' properties
    List<String> states = jsonData['states'] ?? [];
    List<String> cities = jsonData['cities'] ?? [];

    // Return the properties as a tuple of arrays
    return states;
  } catch (error) {
    print('Error downloading or parsing file: $error');
    return null;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
