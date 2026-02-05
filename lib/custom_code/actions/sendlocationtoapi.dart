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

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

Future<List<String>> sendlocationtoapi(String supabaseUrl, String supabaseKey,
    String loggedIn, String latitude, String longitude, String token) async {
  List<String> responses = [];

  // Initialize logging
  print('[LocationService] Starting location service operation...');
  print(
      '[LocationService] Parameters received - URL: ${supabaseUrl.substring(0, min(20, supabaseUrl.length))}..., User: $loggedIn');

  try {
    var url = Uri.parse(supabaseUrl);
    var headers = {
      'Content-Type': 'application/json',
      'apikey': supabaseKey,
    };

    // Create the request body
    var body = jsonEncode({
      'email': loggedIn,
      'token': token,
      "document": {
        'latitude': latitude,
        'longitude': longitude,
        'date': DateTime.now().toIso8601String(),
      },
      "spacing": "true"
    });

    print('[LocationService] Request body created successfully');
    print(body);

    // Send the POST request
    try {
      print('[LocationService] Sending POST request to API...');
      var response = await http.post(url, headers: headers, body: body);
      print(
          '[LocationService] API response received - Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('[LocationService] Request successful');
        responses.add('Response: ${response.body}');
      } else {
        print(
            '[LocationService] ERROR: API request failed with status ${response.statusCode}');
        print('[LocationService] Error response: ${response.reasonPhrase}');
        responses
            .add('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('[LocationService] ERROR during API request: $e');
      responses.add('Error sending request: $e');
    }
  } catch (e) {
    print('[LocationService] CRITICAL ERROR: $e');
    responses.add('Unexpected error: $e');
  }

  print(
      '[LocationService] Operation completed. Total responses: ${responses.length}');
  return responses;
}
