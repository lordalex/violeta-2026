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

class ProfileResponse {
  final bool success;
  final String message;
  final dynamic data;
  final String? error;
  final int? statusCode;

  ProfileResponse({
    required this.success,
    required this.message,
    this.data,
    this.error,
    this.statusCode,
  });

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        if (data != null) 'data': data,
        if (error != null) 'error': error,
        if (statusCode != null) 'statusCode': statusCode,
      };
}

// Logging levels with color coding
enum LogLevel {
  INFO,
  WARNING,
  ERROR;

  String get ansiColor {
    switch (this) {
      case LogLevel.INFO:
        return '\x1B[32m'; // Green
      case LogLevel.WARNING:
        return '\x1B[33m'; // Yellow
      case LogLevel.ERROR:
        return '\x1B[31m'; // Red
    }
  }
}

// Enhanced logging function
void logMessage(LogLevel level, String message) {
  final timestamp = DateTime.now().toIso8601String();
  final prefix = level.toString().split('.').last;
  final resetColor = '\x1B[0m';
  print('${level.ansiColor}[$timestamp][$prefix] $message$resetColor');
}

// Input validation class
class InputValidator {
  static void validateInputs({
    required String token,
    required String profile,
    required String supabaseUrl,
    required String supabaseKey,
  }) {
    if (token.isEmpty) {
      throw ArgumentError('Token cannot be empty');
    }
    if (profile.isEmpty) {
      throw ArgumentError('Profile cannot be empty');
    }
    if (supabaseUrl.isEmpty) {
      throw ArgumentError('Supabase URL cannot be empty');
    }
    if (supabaseKey.isEmpty) {
      throw ArgumentError('Supabase key cannot be empty');
    }

    // Validate URL format
    try {
      final uri = Uri.parse(supabaseUrl);
      if (!uri.isAbsolute) {
        throw FormatException('Invalid Supabase URL format');
      }
    } catch (e) {
      throw FormatException('Invalid URL format: $e');
    }
  }
}

Future<String> sendprofile(
  String supabaseKey,
  String supabaseUrl,
  String token,
  String profile,
) async {
  logMessage(LogLevel.INFO, 'Starting sendprofile operation');

  try {
    // Validate inputs
    logMessage(LogLevel.INFO, 'Validating input parameters');
    InputValidator.validateInputs(
      token: token,
      profile: profile,
      supabaseUrl: supabaseUrl,
      supabaseKey: supabaseKey,
    );

    final uri = Uri.parse(supabaseUrl);

    // Prepare request with retry mechanism
    final response = await _sendRequestWithRetry(
      uri: uri,
      headers: {
        'Content-Type': 'application/json',
        'apikey': supabaseKey,
      },
      body: {
        'token': token,
        'document': profile,
      },
    );

    // Process response
    final profileResponse = _processResponse(response);
    logMessage(LogLevel.INFO, 'Operation completed successfully');
    return jsonEncode(profileResponse.toJson());
  } catch (e) {
    logMessage(LogLevel.ERROR, 'Error in sendprofile: $e');
    return jsonEncode(ProfileResponse(
      success: false,
      message: 'Operation failed',
      error: e.toString(),
    ).toJson());
  }
}

// Helper function to send request with retry mechanism
Future<http.Response> _sendRequestWithRetry({
  required Uri uri,
  required Map<String, String> headers,
  required Map<String, dynamic> body,
  int maxRetries = 3,
  Duration retryDelay = const Duration(seconds: 1),
}) async {
  int attempts = 0;
  while (attempts < maxRetries) {
    try {
      logMessage(LogLevel.INFO,
          'Sending HTTP request (attempt ${attempts + 1}/$maxRetries)');

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      // Only retry on 5xx server errors
      if (response.statusCode < 500) {
        return response;
      }

      attempts++;
      if (attempts < maxRetries) {
        logMessage(LogLevel.WARNING,
            'Request failed with ${response.statusCode}, retrying...');
        await Future.delayed(retryDelay * attempts);
      }
    } on http.ClientException catch (e) {
      logMessage(LogLevel.ERROR, 'Network error: $e');
      attempts++;
      if (attempts >= maxRetries) rethrow;
      await Future.delayed(retryDelay * attempts);
    }
  }
  throw Exception('Max retry attempts reached');
}

// Helper function to process HTTP response
ProfileResponse _processResponse(http.Response response) {
  logMessage(LogLevel.INFO, 'Processing response: ${response.statusCode}');

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return ProfileResponse(
      success: true,
      message: 'Profile updated successfully',
      data: jsonDecode(response.body),
      statusCode: response.statusCode,
    );
  }

  return ProfileResponse(
    success: false,
    message: 'Failed to update profile: ${response.reasonPhrase}',
    error: response.body,
    statusCode: response.statusCode,
  );
}
