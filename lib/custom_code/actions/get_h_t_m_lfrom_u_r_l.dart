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

import 'package:storage_client/src/types.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getHTMLfromURL(String url) async {
  print(url);
  if (url.isEmpty) {
    debugPrint('URL cannot be empty');
    return '';
  }

  try {
    final Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        'Cache-Control': 'no-cache',
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        debugPrint('Request timed out');
        return http.Response('', 408);
      },
    );

    debugPrint('Response status: ${response.statusCode}');
    if (response.body.isNotEmpty) {
      debugPrint(
          'Response body preview: ${response.body.substring(0, min(20, response.body.length))}');
    }

    if (response.statusCode == 200) {
      try {
        return utf8.decode(response.bodyBytes);
      } catch (e) {
        return latin1.decode(response.bodyBytes);
      }
    } else if (response.statusCode == 404) {
      debugPrint('Resource not found: $url');
      return '';
    } else {
      debugPrint('HTTP request failed with status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      return '';
    }
  } on FormatException catch (e) {
    debugPrint('Invalid URL format: $e');
    return '';
  } catch (e) {
    debugPrint('Network or other error: $e');
    return '';
  }
}
