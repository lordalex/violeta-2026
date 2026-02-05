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
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> getjsonfrombucket(String url, String? filter) async {
  if (url.isEmpty) {
    debugPrint('URL cannot be empty');
    return [];
  }
  try {
    final Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Cache-Control': 'no-cache',
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        debugPrint('Request timed out');
        return http.Response('[]', 408);
      },
    );
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body.substring(0, 20)}');
    if (response.statusCode == 200) {
      try {
        final List<dynamic> jsonArray = jsonDecode(response.body);

        String decodeAndEncode(dynamic element) {
          if (element == null) return '';

          // Convert element to string first
          String elementStr = jsonEncode(element);
          String decodedElement = elementStr
              .replaceAll('Ã³', 'ó')
              .replaceAll('Ã±', 'ñ')
              .replaceAll('A©', 'é')
              .replaceAll('A¡', 'á')
              .replaceAll('A­', 'í')
              .replaceAll('Aº', 'ú');

          try {
            // First try UTF-8
            String jsonString = jsonEncode(decodedElement);
            List<int> bytes = utf8.encode(jsonString);
            String decoded = utf8.decode(bytes, allowMalformed: true);
            return jsonEncode(decoded);
          } catch (e) {
            try {
              // If UTF-8 fails, try Latin1
              String jsonString = jsonEncode(decodedElement);
              List<int> bytes = latin1.encode(jsonString);
              String decoded = latin1.decode(bytes);
              print(decoded);
              return jsonEncode(decoded);
            } catch (e) {
              // If all else fails, return the original string encoded
              return jsonEncode(element.toString());
            }
          }
        }

        // Create a function to handle encoding
        String encodeElement(dynamic element) {
          try {
            return jsonEncode(element);
          } catch (e) {
            return jsonEncode(element.toString());
          }
        }

        if (filter != null && filter.isNotEmpty) {
          List<String> jsa = jsonArray
              .where((element) =>
                  element != null &&
                  element
                      .toString()
                      .toLowerCase()
                      .contains(filter.toLowerCase()))
              .map((elementX) {
            print(decodeAndEncode(elementX));
            return decodeAndEncode(elementX);
          }).toList();
          return jsa;
        }

        List<String> jsa =
            jsonArray.where((element) => element != null).map((elementX) {
          print(decodeAndEncode(elementX));
          return decodeAndEncode(elementX);
        }).toList();
        return jsa;
      } on FormatException catch (e) {
        debugPrint('Invalid JSON format: $e');
        return [];
      } catch (e) {
        debugPrint('JSON parsing error: $e');
        return [];
      }
    } else if (response.statusCode == 404) {
      debugPrint('Resource not found: $url');
      return [];
    } else {
      debugPrint('HTTP request failed with status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      return [];
    }
  } on FormatException catch (e) {
    debugPrint('Invalid URL format: $e');
    return [];
  } catch (e) {
    debugPrint('Network or other error: $e');
    return [];
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
