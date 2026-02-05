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

import 'package:http/http.dart' as http;
import 'dart:convert';

// Logging levels
enum LogLevel { INFO, WARNING, ERROR }

void logMessage(LogLevel level, String message) {
  final timestamp = DateTime.now().toIso8601String();
  final prefix = level.toString().split('.').last;
  print('[$timestamp][$prefix] $message');
}

Future<String> getProfile(
    String supabaseKey, String supabaseUrl, String token) async {
  logMessage(LogLevel.INFO, 'Starting sendprofile operation');
  String responseMessage = '';

  try {
    // Input validation
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

    // URL validation
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

    // Prepare request
    logMessage(LogLevel.INFO, 'Preparing HTTP request');
    try {
      final headers = {
        'Content-Type': 'application/json',
        'apikey': supabaseKey,
      };
      logMessage(LogLevel.INFO, 'Headers prepared successfully');

      final body = jsonEncode({
        'token': token,
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
          responseMessage = jsonEncode({
            'success': true,
            'message': 'Profile updated successfully',
            'data': jsonDecode(res),
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
