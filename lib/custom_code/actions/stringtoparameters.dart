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

class JsonProcessingException implements Exception {
  final String message;
  final dynamic originalError;

  JsonProcessingException(this.message, [this.originalError]);

  @override
  String toString() =>
      'JsonProcessingException: $message${originalError != null ? '\nOriginal error: $originalError' : ''}';
}

/// Custom exception for path processing errors
class PathProcessingException implements Exception {
  final String message;
  final String? path;
  final dynamic originalError;

  PathProcessingException(this.message, {this.path, this.originalError});

  @override
  String toString() =>
      'PathProcessingException: $message${path != null ? ' (Path: $path)' : ''}${originalError != null ? '\nOriginal error: $originalError' : ''}';
}

/// Enhanced logger with structured logging and log levels
class Logger {
  static const int LEVEL_DEBUG = 0;
  static const int LEVEL_INFO = 1;
  static const int LEVEL_WARNING = 2;
  static const int LEVEL_ERROR = 3;

  static int _currentLevel = LEVEL_INFO;
  static bool _includeStackTrace = false;

  static void setLevel(int level) => _currentLevel = level;
  static void setIncludeStackTrace(bool include) =>
      _includeStackTrace = include;

  static void _log(String message,
      {required String type,
      required int level,
      dynamic error,
      StackTrace? stackTrace}) {
    if (level < _currentLevel) return;

    final timestamp = DateTime.now().toIso8601String();
    final buffer = StringBuffer();

    buffer.write('[$timestamp][$type] $message');

    if (error != null) {
      buffer.write('\nError: $error');
    }

    if (_includeStackTrace && stackTrace != null) {
      buffer.write('\nStack trace:\n$stackTrace');
    }

    print(buffer.toString());
  }

  static void debug(String message) =>
      _log(message, type: 'DEBUG', level: LEVEL_DEBUG);
  static void info(String message) =>
      _log(message, type: 'INFO', level: LEVEL_INFO);
  static void warning(String message) =>
      _log(message, type: 'WARNING', level: LEVEL_WARNING);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _log(message,
          type: 'ERROR',
          level: LEVEL_ERROR,
          error: error,
          stackTrace: stackTrace);
}

/// Enhanced JSON processor with caching and validation
class JsonProcessor {
  // Cache for parsed JSON objects
  static final Map<String, Map<String, dynamic>> _jsonCache = {};
  static const int _maxCacheSize = 100;

  /// Converts JSON string to Map with caching
  static Map<String, dynamic> jsonToMap(String jsonString) {
    Logger.info('Converting JSON string to Map');

    if (jsonString.isEmpty) {
      throw JsonProcessingException('Empty JSON string provided');
    }

    // Check cache first
    if (_jsonCache.containsKey(jsonString)) {
      Logger.debug('Cache hit for JSON string');
      return Map<String, dynamic>.from(_jsonCache[jsonString]!);
    }

    try {
      final result = json.decode(jsonString) as Map<String, dynamic>;

      // Cache management
      if (_jsonCache.length >= _maxCacheSize) {
        _jsonCache.remove(_jsonCache.keys.first);
      }
      _jsonCache[jsonString] = Map<String, dynamic>.from(result);

      Logger.info('Successfully converted JSON string to Map');
      return result;
    } catch (e, stackTrace) {
      Logger.error('Failed to parse JSON', e, stackTrace);
      throw JsonProcessingException('Invalid JSON string', e);
    }
  }

  /// Enhanced traverse method with type validation and cycle detection
  static List<String> traverse(Map<String, dynamic> json) {
    Logger.info('Starting JSON traversal');
    final List<String> result = [];
    final Set<String> visited = {};

    void _traverse(
        dynamic current, String path, Map<String, dynamic> accumulator) {
      if (current == null) return;
      if (current is! Map) {
        Logger.warning('Non-map value encountered at path: $path');
        return;
      }

      // Cycle detection
      final String currentHash = current.toString();
      if (visited.contains(currentHash)) {
        Logger.warning('Cycle detected in JSON at path: $path');
        return;
      }
      visited.add(currentHash);

      final Map<String, dynamic> newAccumulator =
          Map<String, dynamic>.from(accumulator);

      current.forEach((key, value) {
        if (key is! String) {
          Logger.warning('Non-string key encountered: $key');
          return;
        }

        final String newPath = path.isEmpty ? key : '$path.$key';

        if (value is Map) {
          _traverse(value, newPath, newAccumulator);
        } else {
          newAccumulator[key] = value;
        }
      });

      result.add(jsonEncode(newAccumulator));
      visited.remove(currentHash);
    }

    _traverse(json, '', {});
    Logger.info('Completed JSON traversal with ${result.length} paths found');
    return result;
  }

  /// Enhanced key-value pair extraction with type validation
  static Map<String, dynamic> getAllKeyValuePairs(Map<String, dynamic> map) {
    Logger.info('Extracting all key-value pairs');
    final Map<String, dynamic> result = {};
    final Set<String> visitedPaths = {};

    void _extract(Map<String, dynamic> current, String prefix) {
      current.forEach((key, value) {
        if (key is! String) {
          Logger.warning('Skipping non-string key: $key');
          return;
        }

        final String currentKey = prefix.isEmpty ? key : '$prefix.$key';

        // Prevent infinite recursion
        if (visitedPaths.contains(currentKey)) {
          Logger.warning('Circular reference detected at: $currentKey');
          return;
        }
        visitedPaths.add(currentKey);

        if (value is Map<String, dynamic>) {
          _extract(value, currentKey);
        } else {
          result[currentKey] = value;
        }

        visitedPaths.remove(currentKey);
      });
    }

    _extract(map, '');
    Logger.info('Extracted ${result.length} key-value pairs');
    return result;
  }

  /// Enhanced path application with better validation and error handling
  static dynamic applyPath(Map<String, dynamic> data, String pathString) {
    Logger.info('Applying path: $pathString');

    if (pathString.isEmpty || pathString == "null") {
      Logger.info('Empty or null path, returning original data');
      return data;
    }

    pathString = pathString.trim();
    if (!_isValidPathFormat(pathString)) {
      throw PathProcessingException('Invalid path format', path: pathString);
    }

    final List<String> segments = _parsePathSegments(pathString);
    Logger.debug('Processing ${segments.length} path segments');

    try {
      return _traversePath(data, segments);
    } catch (e, stackTrace) {
      Logger.error('Error while traversing path', e, stackTrace);
      throw PathProcessingException('Error traversing path',
          path: pathString, originalError: e);
    }
  }

  /// Helper method to validate path format
  static bool _isValidPathFormat(String path) {
    return path.startsWith("[") &&
        path.endsWith("]") &&
        path.split("[").length == path.split("]").length;
  }

  /// Helper method to parse path segments
  static List<String> _parsePathSegments(String pathString) {
    return pathString
        .split("][")
        .map((s) => s.replaceAll("[", "").replaceAll("]", ""))
        .where((s) => s.isNotEmpty)
        .toList();
  }

  /// Helper method to traverse path
  static dynamic _traversePath(dynamic current, List<String> segments) {
    for (final String segment in segments) {
      if (current == null) {
        Logger.info('Null value encountered while traversing path');
        return null;
      }

      if (int.tryParse(segment) != null) {
        current = _handleArrayAccess(current, segment);
      } else {
        current = _handleMapAccess(current, segment);
      }
    }
    return current;
  }

  /// Helper method for array access
  static dynamic _handleArrayAccess(dynamic current, String segment) {
    final int index = int.parse(segment);
    if (current is! List) {
      throw PathProcessingException(
          'Expected array but found ${current.runtimeType}',
          path: segment);
    }
    if (index >= current.length) {
      Logger.error('Array index out of bounds: $index');
      return null;
    }
    return current[index];
  }

  /// Helper method for map access
  static dynamic _handleMapAccess(dynamic current, String segment) {
    final String key = segment.replaceAll('"', '').replaceAll("'", "");
    if (current is! Map) {
      throw PathProcessingException(
          'Expected map but found ${current.runtimeType}',
          path: segment);
    }
    if (!current.containsKey(key)) {
      Logger.error('Key not found: $key');
      return null;
    }
    return current[key];
  }
}

/// Main function to process string parameters
Future<String> stringtoparameters(String jsonString, String path) async {
  Logger.info('Processing string parameters');
  Logger.info('Input - JSON: $jsonString, Path: $path');

  try {
    final Map<String, dynamic> json = JsonProcessor.jsonToMap(jsonString);
    if (json.isEmpty) {
      Logger.info('Empty JSON map, returning empty result');
      return '[]';
    }
    final Map<String, dynamic> keyValuePairs =
        JsonProcessor.getAllKeyValuePairs(json);
    Logger.info('Extracted key-value pairs: $keyValuePairs');
    Logger.info(path);

    final dynamic result = JsonProcessor.applyPath(keyValuePairs, path);
    final String jsonResult = jsonEncode(result);

    Logger.info('Successfully processed parameters');
    Logger.info('Result: $jsonResult');
    Logger.info(path);

    return jsonResult;
  } catch (e, stackTrace) {
    Logger.error('Error processing parameters', e, stackTrace);
    rethrow;
  }
}
