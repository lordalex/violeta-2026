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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// Logging levels
enum LogLevel { INFO, WARNING, ERROR }

void logMessage(LogLevel level, String message) {
  final timestamp = DateTime.now().toIso8601String();
  final prefix = level.toString().split('.').last;
  print('[$timestamp][$prefix] $message');
}

// Helper function to reduce JSON map and convert values to List<String>
Map<String, List<String>> reduceJsonMap(Map<String, dynamic> input) {
  // Step 1: Create a map to store key-value frequencies
  final Map<String, Map<String, int>> keyValueFreq = {};

  // Step 2: Count frequencies of values for each key
  input.forEach((key, value) {
    keyValueFreq.putIfAbsent(key, () => <String, int>{});
    String valueStr = jsonEncode(value);
    keyValueFreq[key]!.update(
      valueStr,
      (count) => count + 1,
      ifAbsent: () => 1,
    );
  });

  // Step 3: Create the reduced map with List<String> values
  final Map<String, List<String>> result = {};

  keyValueFreq.forEach((key, valueFreq) {
    if (valueFreq.length == 1) {
      // Single value - convert to List<String>
      dynamic decodedValue = jsonDecode(valueFreq.keys.first);
      if (decodedValue is List) {
        // If it's already a list, convert all elements to strings
        result[key] = decodedValue.map((e) => e.toString()).toList();
      } else {
        // If it's a single value, wrap in a list
        result[key] = [decodedValue.toString()];
      }
    } else {
      // Multiple values - combine into List<String>
      result[key] = valueFreq.keys
          .map((valueStr) => jsonDecode(valueStr))
          .map((value) => value.toString())
          .toList();
    }
  });

  return result;
}

Future<String> getTest(String supabaseKey, String supabaseUrl, String token,
    String tableName, String parameter, String value) async {
  logMessage(LogLevel.INFO, 'Starting sendprofile operation');
  String responseMessage = '';

  try {
    logMessage(LogLevel.INFO, 'Validating input parameters');
    try {
      if (token.isEmpty) {
        logMessage(LogLevel.ERROR, 'Token validation failed: Empty token');
        throw ArgumentError('Token cannot be empty');
      }
      logMessage(LogLevel.INFO, 'Input validation successful');
    } catch (e) {
      logMessage(LogLevel.ERROR, 'Input validation error: $e');
      rethrow;
    }

    logMessage(LogLevel.INFO, 'Validating Supabase URL');
    final Uri uri;
    try {
      uri = Uri.parse(supabaseUrl);
      if (!uri.isAbsolute) {
        logMessage(LogLevel.ERROR, 'URL validation failed: Not absolute URL');
        throw FormatException('Invalid URL format');
      }
      logMessage(LogLevel.INFO, 'URL validation successful: ${uri.toString()}');
    } catch (e) {
      logMessage(LogLevel.ERROR, 'URL parsing failed: $e');
      return 'Error: Invalid Supabase URL format';
    }

    logMessage(LogLevel.INFO, 'Preparing HTTP request');
    try {
      final headers = {
        'Content-Type': 'application/json',
        'apikey': supabaseKey,
      };
      logMessage(LogLevel.INFO, 'Headers prepared successfully');

      final body = jsonEncode({
        'token': token,
        'document': {
          "tableName": tableName,
          "parameter": parameter,
          "value": value
        }
      });
      logMessage(LogLevel.INFO, 'Request body encoded successfully');

      // Send request
      logMessage(LogLevel.INFO, 'Sending HTTP request to ${uri.toString()}');
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      logMessage(LogLevel.INFO,
          'Received response with status: ${response.statusCode}');

      // Process response
      try {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          logMessage(LogLevel.INFO,
              'Request successful with status ${response.statusCode}');
          String res = '{}';
          if (response.body.length > 2) res = response.body;

          // Parse and reduce the response data
          Map<String, dynamic> responseData = jsonDecode(res);
          Map<String, List<String>> reducedData = reduceJsonMap(responseData);

          responseMessage = jsonEncode({
            'success': true,
            'message': 'Profile updated successfully',
            'data': reducedData,
          });
        } else {
          logMessage(LogLevel.WARNING,
              'Request failed with status ${response.statusCode}: ${response.reasonPhrase}');
          responseMessage = jsonEncode({
            'success': false,
            'message': 'Failed to get profile: ${response.reasonPhrase}',
            'statusCode': response.statusCode,
          });
        }
      } catch (e) {
        logMessage(LogLevel.ERROR, 'Error processing response: $e');
        rethrow;
      }
    } catch (e) {
      logMessage(LogLevel.ERROR, 'Error preparing or sending request: $e');
      rethrow;
    }

    logMessage(LogLevel.INFO, 'Operation completed successfully');
    return responseMessage;
  } on http.ClientException catch (e) {
    logMessage(LogLevel.ERROR, 'Network error occurred: $e');
    return jsonEncode({
      'success': false,
      'message': 'Network connection failed',
      'error': e.toString(),
    });
  } on FormatException catch (e) {
    logMessage(LogLevel.ERROR, 'Data format error occurred: $e');
    return jsonEncode({
      'success': false,
      'message': 'Invalid data format',
      'error': e.toString(),
    });
  } catch (e) {
    logMessage(LogLevel.ERROR, 'Unexpected error occurred: $e');
    return jsonEncode({
      'success': false,
      'message': 'Unexpected error occurred',
      'error': e.toString(),
    });
  }
}
