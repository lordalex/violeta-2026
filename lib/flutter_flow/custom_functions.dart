import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? initials(String string1) {
  List<String> words = string1.split(' ');
  if (words.length == 1) {
    return string1.substring(0, 2).toUpperCase();
  } else if (words.length >= 2) {
    return '${words[0][0].toUpperCase()}${words[1][0].toUpperCase()}';
  }
  return 'Vx';
}

bool comparadosstrings(
  List<String> array1,
  List<String> array2,
  int index,
) {
  if (index >= 0 && index < array1.length) {
    String stringAtIndex = array1[index];
    return array2.contains(stringAtIndex);
  }
  return false;
}

List<String> makearrayfromstr(String args) {
  return [args];
}

List<String> addstringtorray(
  List<String> array,
  String str,
) {
  // ake an array and a string as argument , append the string to the array and return the resulting array
  array.add(str);
  return array;
}

List<String> arraytoarray(
  List<String> array1,
  List<String> array2,
) {
  // concatenate two arrays and retur the resulting array
  List<String> resultArray = [...array1, ...array2];

  return resultArray;
}

String getkeyvalueinstringlist(
  List<String> stringList,
  String key,
) {
  if (stringList == null || stringList == "null" || stringList.length < 2) {
    return "";
  }

  for (String string in stringList) {
    final json = jsonDecode(string);
    if (json.containsKey(key)) {
      return json[key];
    }
  }
  return "";
}

String arrayindex(
  List<String> array,
  int index,
) {
  return array[index];
}

List<String> getkeyvaluestringarray(
  String string,
  String key,
) {
  if (string == null || string.isEmpty || key == null || key.isEmpty) {
    return [""];
  }

  try {
    dynamic jsonData = jsonDecode(string);
    if (key.contains('.')) {
      List<String> keys = key.split('.');
      dynamic currentValue = jsonData;
      for (String k in keys) {
        if (currentValue is Map && currentValue.containsKey(k)) {
          currentValue = currentValue[k];
        } else {
          return [""]; // Key not found at this level
        }
      }
      if (currentValue is List) {
        return currentValue.map((e) => jsonEncode(e)).toList();
      } else if (currentValue != null) {
        return [jsonEncode(currentValue)];
      } else {
        return [""];
      }
    } else {
      if (jsonData is Map && jsonData.containsKey(key)) {
        final value = jsonData[key];
        if (value is List) {
          return value.map((e) => jsonEncode(e)).toList();
        } else if (value != null) {
          return [jsonEncode(value)];
        } else {
          return [""];
        }
      } else {
        return [""]; // Key not found
      }
    }
  } catch (e) {
    print("JSON parse error: $e");
    return [""];
  }
}

String? getkfromjsonstring(
  String string,
  String key,
) {
  if (string == null || string == "null" || string.length < 2) {
    return " ";
  }

  try {
    final json = jsonDecode(string);
    if (json is! Map) {
      return " ";
    }
    if (json.containsKey(key)) {
      final value = json[key];
      if (value == null) {
        return " ";
      }
      return value.toString();
    }
    return "  ";
  } catch (e) {
    print("JSON parse error: $e");
    return " ";
  }
}

String strtoimagepath(String path) {
  return path;
}

String getcsvcolumnvalue(
  String csv,
  int column,
) {
  List<String> fields = csv.split(",");
  if (column > fields.length) return "";
  return csv[column];
}

String getkeyvaluestring(
  String string,
  String key,
) {
  try {
    if (string == null || key == null) {
      print(
          "getkeyvaluestring: Input string or key is null. Returning empty string.");
      return "";
    }

    if (key.isEmpty || string.isEmpty) {
      print(
          "getkeyvaluestring: Input key or string is empty. Returning empty string.");
      return "";
    }

    dynamic jsonData;
    try {
      try {
        jsonData = jsonDecode(string.toString());
      } catch (e) {
        try {
          jsonData = jsonDecode('{"' + key + '": "' + string.toString() + '"}');
        } catch (e) {
          print(
              "getkeyvaluestring: At Initial JSON decoding error: $e. Returning empty string.");
          return ""; // Return empty string if initial decode fails
        }
      }
      while (!(jsonData is Map)) {
        try {
          jsonData = jsonDecode(jsonData);
        } catch (e) {
          print(
              "getkeyvaluestring: Nested JSON decoding error: $e. Returning empty string.");
          return ""; // Return empty string if nested decode fails
        }
      }
    } catch (e) {
      print(
          "getkeyvaluestring: While Initial JSON decoding error: $e. Returning empty string.");
      return ""; // Return empty string if initial decode fails
    }

    if (key.contains('.')) {
      List<String> keys = key.split('.');
      dynamic currentValue = jsonData;
      for (int i = 0; i < keys.length; i++) {
        String k = keys[i];
        try {
          if (currentValue is Map && currentValue.containsKey(k)) {
            currentValue = currentValue[k];
            print(
                "getkeyvaluestring: Key '$k' found. Current value: $currentValue");
            if (i + 1 < keys.length) {
              if (currentValue is String) {
                try {
                  currentValue = jsonDecode(currentValue);
                } catch (e) {
                  print(
                      "getkeyvaluestring: Nested string value not JSON decodable for key '$k'. Leaving as string. Error: $e");
                  // it is a string but not json decodable, so we leave it like this
                }
              }
            }
          } else {
            return "";
          }
        } catch (e) {
          print(
              "getkeyvaluestring: Error accessing key '$k': $e. Returning empty string.");
          return "";
        }
      }
      if (currentValue is String) {
        try {
          currentValue = jsonDecode(currentValue);
        } catch (e) {
          print(
              "getkeyvaluestring: Final string value not JSON decodable. Returning string representation. Error: $e");
          // if it is the end, we try to parse it, but in case it fail
          // we just return the string representation
        }
      }
      try {
        String encodedValue = jsonEncode(currentValue) ?? "{}";
        return encodedValue;
      } catch (e) {
        print(
            "getkeyvaluestring: Error encoding final value to JSON: $e. Returning empty string.");
        return "";
      }
    } else {
      try {
        if (jsonData.containsKey(key)) {
          if (!(jsonData[key] is String) && jsonData[key] != null) {
            try {
              String encodedValue = jsonEncode(jsonData[key]);
              return encodedValue;
            } catch (e) {
              print(
                  "getkeyvaluestring: Error encoding value for key '$key' to JSON: $e. Returning empty string.");
              return "";
            }
          } else {
            String stringValue = jsonData[key] ?? "{}";
            return stringValue;
          }
        } else {
          print(
              "getkeyvaluestring: Key '$key' not found in JSON data. Returning empty string.");
          return "";
        }
      } catch (e) {
        print(
            "getkeyvaluestring: Error accessing key '$key' in JSON data: $e. Returning empty string.");
        return "";
      }
    }
  } catch (e) {
    print(
        "getkeyvaluestring: General error in getkeyvaluestring function: $e. Returning empty string.");
    return "";
  }
}

List<String> getallpropfromjson(
  String jsonString,
  String propSearch,
  String propGet,
  String value,
  String? path,
) {
  final data = jsonDecode(jsonString);
  // Get the list from specified path
  final items = data[path] as List<dynamic>;
  // Filter and map to get properties where propSearch equals value
  return items
      .where((item) => item[propSearch] == value)
      .map((item) => item[propGet] as String)
      .toList();
}

List<String> jsonArrayToObjectString(String jsonArrayString) {
  try {
    // Decode the JSON array string into a List
    print(jsonArrayString);
    final List<dynamic> jsonArray = json.decode(jsonArrayString);
    // Convert each element to a JSON string and store in result list
    final List<String> result = jsonArray.map((element) {
      if (element is Map) {
        // If element is already a Map, encode it directly
        return json.encode(element);
      } else {
        // For non-Map elements, wrap them in a Map with a value key
        return json.encode({'value': element});
      }
    }).toList();

    // Print the results
    print('Processed JSON objects:');
    for (var jsonString in result) {
      print(jsonString);
    }

    return result;
  } catch (e) {
    print('Error processing JSON array: $e');
    return []; // Return empty list in case of error
  }
}

List<String> arryofvaluefromjsonarray(
  List<String>? jsonstringArray,
  String property,
) {
  List<String> result = [];

  if (jsonstringArray != null) {
    for (String jsonString in jsonstringArray) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      if (jsonMap.containsKey(property)) {
        result.add(jsonMap[property].toString());
      }
    }
  }

  return result;
}

String fixJSONString(String input) {
  if (!input.trim().startsWith('{') || !input.trim().endsWith('}')) {
    return input;
  }

  try {
    String content = input.trim().substring(1, input.trim().length - 1);
    List<String> pairs = [];
    String current = '';
    bool inQuotes = false;
    int depth = 0;

    for (int i = 0; i < content.length; i++) {
      String c = content[i];
      if (c == '"' || c == "'") {
        inQuotes = !inQuotes;
      } else if (c == '{' && !inQuotes) {
        depth++;
      } else if (c == '}' && !inQuotes) {
        depth--;
      }

      if (c == ',' && !inQuotes && depth == 0) {
        pairs.add(current.trim());
        current = '';
      } else {
        current += c;
      }
    }
    pairs.add(current.trim());

    List<String> formattedPairs = [];
    for (String pair in pairs) {
      if (!pair.contains(':')) return input;
      List<String> keyValue = pair.split(':');
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();

      key = key.startsWith('"') || key.startsWith("'") ? key : '"$key"';

      bool isNumeric = double.tryParse(value.replaceAll('-', '')) != null;
      if (!isNumeric && !value.startsWith('"') && !value.startsWith("'")) {
        value = '"$value"';
      }

      formattedPairs.add('$key: $value');
    }

    return '{${formattedPairs.join(', ')}}';
  } catch (e) {
    return input;
  }
}

List<String> returnfirstthree(List<String> stringList) {
  // make a function that takes string list and return the firs three elements
  List<String> firstThreeElements = stringList.sublist(0, 3);
  return firstThreeElements;
}

String searchinarrayandreurnindexed(
  List<String> list1,
  List<String> list2,
  String search,
) {
  int index = list1.indexOf(search);
  return index != -1 ? list2[index] : '';
}

String largestindexinarray(
  String value,
  List<String> compare,
  String comparevalue,
) {
  int firstIndex = -1;
  int secondIndex = -1;

  for (int i = 0; i < compare.length; i++) {
    if (compare[i] == value) {
      firstIndex = i;
    }
    if (compare[i] == comparevalue) {
      secondIndex = i;
    }
  }

  return firstIndex > secondIndex ? value : comparevalue;
}

String concatenate(
  String string1,
  String? string2,
) {
  // conctenate two strings: string1, string2 and return the result
  return '$string1$string2';
}

List<String> tostringA(List<String> tostring) {
  return tostring
      .map((element) =>
          element.toString().replaceAll('"', '').replaceAll("'", ''))
      .toList();
}

List<String> getmuncipio(
  String jsonData,
  String estado,
) {
  dynamic data;
  try {
    // Decode the JSON string with UTF-8
    final decodedJson = utf8.decode(utf8.encode(jsonData));
    print(":");
    try {
      data = json.decode(decodedJson);
    } catch (e) {
      try {
        data = jsonDecode('{"' + estado + '": "' + decodedJson + '"}');
      } catch (e) {
        print('Error parsing data: $e');
      }
    }

    print(data);

    // Check if the estado exists and return its municipios
    if (data.containsKey(estado)) {
      // Convert the list and ensure UTF-8 encoding for each municipio
      return List<String>.from(data[estado]).map((municipio) {
        return utf8.decode(utf8.encode(municipio));
      }).toList();
    }

    return [];
  } catch (e) {
    print('Error processing  data: $e');
    return [];
  }
}

List<String> getKeys(String jsonStr) {
  try {
    // Parse the JSON string into a Map
    final Map<String, dynamic> data = jsonDecode(jsonStr);

    // Convert the keys (state names) to a List<String>
    final List<String> states = data.keys.toList();

    // Sort alphabetically for consistent ordering
    states.sort();

    return states;
  } catch (e) {
    print('Error parsing JSON: $e');
    return [];
  }
}

String getquestionaireCorrect(String jsonString) {
  try {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    String question = jsonMap['question'] ?? '';
    List<String> answers = List<String>.from(jsonMap['answer'] ?? []);
    if (answers.length > 0) {
      List<String> jsonFormattedAnswers = answers.map((e) => '"$e"').toList();
      answers = jsonFormattedAnswers;
    }
    List<String> values = List<String>.from(jsonMap['value'] ?? []);
    int correctIndex = values.indexOf("Correcto");
    if (correctIndex < 0) correctIndex = 0;
    String correctAnswer = correctIndex >= 0 ? answers[correctIndex] : '';
    return correctAnswer;
  } catch (e) {
    print('Error parsing questionnaire JSON: $e');
    return "";
  }
}

String strfromarray(List<String> output) {
  return output.join('\n');
}

List<String> filterArraySubstr(
  List<String> strings,
  String substring,
) {
  if (strings == null || substring == null) {
    return []; // Handle null inputs gracefully
  }

  List<String> result = [];
  for (String str in strings) {
    if (str != null && str.contains(substring)) {
      // Added null check for individual strings
      result.add(str);
    }
  }
  return result;
}

String removesymb(String input) {
  final regex = RegExp(
      r'[^\w\s]'); // Matches anything that's NOT a word character or whitespace

  // Replace matched characters with an empty string
  return input.replaceAll(regex, '');
}

List<String> findallkeys(
  String keyToFind,
  String jsonString,
) {
  List<String> foundValues = ["Todos"];
  dynamic jsonObject;
  try {
    jsonObject = jsonDecode(jsonString);
  } catch (e) {
    print("Error decoding JSON: $e");
    return [];
  }
  void _searchRecursive(dynamic currentObject) {
    if (currentObject is List) {
      for (var item in currentObject) {
        _searchRecursive(item);
      }
    } else if (currentObject is Map) {
      currentObject.forEach((key, value) {
        String stringValue = value.toString();
        if (key == keyToFind && value != null) {
          if (!foundValues.contains(stringValue)) {
            foundValues.add(stringValue);
          }
        }
        _searchRecursive(value);
      });
    }
  }

  _searchRecursive(jsonObject);
  return foundValues;
}

String locationtogooglemaps(
  double longitude,
  double latitude,
) {
  return 'https://www.google.com/maps?q=${latitude},${longitude}';
}

bool findstringinArray(
  List<String> arrayString,
  String search,
) {
  try {
    return arrayString.contains(search);
  } catch (e) {
    return false;
  }
}

List<String> searchstringinarrayandselectfromanother(
  List<String> array1,
  List<String> array2,
  String stringSearch,
) {
  if (array1.isEmpty || array2.isEmpty) {
    return [];
  }
  List<String> matchingElements = [];

  for (int i = 0; i < array2.length; i++) {
    if (array2[i].contains(stringSearch)) {
      if (i < array1.length) {
        matchingElements.add(array1[i]);
      }
    }
  }
  for (int i = 0; i < array2.length; i++) {
    if (stringSearch.contains(array2[i])) {
      if (i < array1.length) {
        matchingElements.add(array1[i]);
      }
    }
  }
  return matchingElements;
}

List<String> extractAndConcatenateProperties(
  List<String> jsonStrings,
  List<String> properties,
  String concatenator,
) {
  List<String> results = [];

  for (String jsonString in jsonStrings) {
    try {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      List<String> propertyValues = [];

      for (String property in properties) {
        if (jsonMap.containsKey(property)) {
          propertyValues.add(jsonMap[property].toString());
        }
      }
      results.add(propertyValues.join(concatenator));
    } catch (e) {
      results.add('');
    }
  }
  return results;
}

List<String> extractUniquePropertyValues(
  String jsonData,
  List<String> properties,
) {
  final parsedJson = json.decode(jsonData);
  List<String> result = [];

  if (parsedJson is! List) {
    return result;
  }

  for (String property in properties) {
    Set<String> values = {};
    void _extractValues(dynamic data) {
      if (data is Map) {
        data.forEach((key, value) {
          if (key == property && value is String) {
            values.add(value);
          }
          _extractValues(value);
        });
      } else if (data is List) {
        for (var item in data) {
          _extractValues(item);
        }
      }
    }

    _extractValues(parsedJson);
    result.add(json.encode({property: values.toList()}));
  }
  print(result);
  return result;
}

int findValue(
  String jsonData,
  String name,
) {
  try {
    final dynamic parsedJson = json.decode(jsonData);
    int? _findValueRecursive(dynamic data) {
      if (data is Map) {
        if (data.containsKey('name') && data['name'] == name) {
          if (data.containsKey('value') && data['value'] is int) {
            return data['value'];
          }
        }
        for (var value in data.values) {
          int? result = _findValueRecursive(value);
          if (result != null) {
            return result;
          }
        }
      } else if (data is List) {
        for (var item in data) {
          int? result = _findValueRecursive(item);
          if (result != null) {
            return result;
          }
        }
      } else if (data is String) {
        final intValue = int.tryParse(data);
        if (intValue != null) {
          return intValue;
        }
      }
      return null;
    }

    return _findValueRecursive(parsedJson) ?? 0;
  } catch (e) {
    return 0;
  }
}

String extractProperty(
  String schemaJson,
  String dataJson,
  List<String> propertyNames,
) {
  try {
    final schema = jsonDecode(schemaJson);
    final data = jsonDecode(dataJson);

    if (schema == null || data == null) {
      return jsonEncode({});
    }

    String? _getPropertyType(dynamic schema, String propertyName) {
      if (schema is Map) {
        if (schema.containsKey("properties")) {
          dynamic properties = schema["properties"];
          if (properties is Map) {
            if (properties.containsKey(propertyName)) {
              dynamic property = properties[propertyName];
              if (property is Map && property.containsKey("type")) {
                return property["type"];
              }
            } else {
              for (dynamic key in properties.keys) {
                if (properties[key] is Map) {
                  String? type =
                      _getPropertyType(properties[key], propertyName);
                  if (type != null) {
                    return type;
                  }
                }
              }
            }
          }
        }
        for (dynamic key in schema.keys) {
          if (schema[key] is Map) {
            String? type = _getPropertyType(schema[key], propertyName);
            if (type != null) {
              return type;
            }
          }
        }
      } else if (schema is List) {
        for (dynamic item in schema) {
          String? type = _getPropertyType(item, propertyName);
          if (type != null) {
            return type;
          }
        }
      }
      return null;
    }

    Map<String, dynamic> results = {};

    for (final propertyName in propertyNames) {
      String? propertyType = _getPropertyType(schema, propertyName);
      if (propertyType == null) {
        results[propertyName] = [];
        continue;
      }

      List<String> propertyResults = [];

      void _extractRecursive(dynamic obj) {
        if (obj is Map) {
          obj.forEach((key, value) {
            if (key == propertyName) {
              if (propertyType == 'string' && value is String) {
                propertyResults.add(value);
              } else if (propertyType == 'array' && value is List) {
                for (dynamic item in value) {
                  if (item is String) {
                    propertyResults.add(item);
                  }
                }
              } else {}
            }
            _extractRecursive(value);
          });
        } else if (obj is List) {
          for (dynamic item in obj) {
            _extractRecursive(item);
          }
        }
      }

      _extractRecursive(data);
      results[propertyName] = propertyResults;
    }

    return jsonEncode(results);
  } catch (e) {
    return jsonEncode({});
  }
}

List<String> extractKeysFromJson(String jsonString) {
  try {
    final dynamic decodedJson = json.decode(jsonString);
    List<String> keys = [];

    _extractKeys(dynamic jsonObject) {
      if (jsonObject is Map) {
        jsonObject.forEach((key, value) {
          keys.add(key.toString());
          _extractKeys(value);
        });
      } else if (jsonObject is List) {
        for (var item in jsonObject) {
          _extractKeys(item);
        }
      }
    }

    _extractKeys(decodedJson);
    return keys;
  } catch (e) {
    print('Error parsing JSON: $e');
    return [];
  }
}

int tryParseInt(String input) {
  try {
    return int.parse(input);
  } catch (e) {
    return 0;
  }
}

String collateJsonString(
  String source,
  List<String> collation,
  String property,
) {
  bool _deepEquals(dynamic a, dynamic b) {
    if (a is Map && b is Map) {
      if (a.length != b.length) return false;
      for (var key in a.keys) {
        if (!b.containsKey(key) || !_deepEquals(a[key], b[key])) {
          return false;
        }
      }
      return true;
    } else if (a is List && b is List) {
      if (a.length != b.length) return false;
      for (int i = 0; i < a.length; i++) {
        if (!_deepEquals(a[i], b[i])) {
          return false;
        }
      }
      return true;
    } else {
      return a == b;
    }
  }

  try {
    Map<String, dynamic> sourceJson = jsonDecode(source);
    List<dynamic> targetArrays = [];

    List<dynamic> _findArraysByPropertyRecursive(
        dynamic jsonObject, String property) {
      List<dynamic> foundArrays = [];
      if (jsonObject is Map<String, dynamic>) {
        jsonObject.forEach((key, value) {
          if (key == property && value is List) {
            foundArrays.add(value);
          }
          if (value is Map || value is List) {
            foundArrays.addAll(_findArraysByPropertyRecursive(value, property));
          }
        });
      } else if (jsonObject is List) {
        for (var item in jsonObject) {
          if (item is Map || item is List) {
            foundArrays.addAll(_findArraysByPropertyRecursive(item, property));
          }
        }
      }
      return foundArrays;
    }

    targetArrays = _findArraysByPropertyRecursive(sourceJson, property);

    if (targetArrays.isEmpty) {
      return source;
    }

    for (int i = 0; i < collation.length; i++) {
      if (i < targetArrays.length && targetArrays[i] is List) {
        List<dynamic> currentSourceArray = List<dynamic>.from(targetArrays[i]);
        List<dynamic> collationList;

        try {
          collationList = jsonDecode(collation[i]) as List<dynamic>;
        } catch (e) {
          print('Error parsing collation entry $i: ${collation[i]}');
          continue;
        }

        for (int j = 0; j < currentSourceArray.length; j++) {
          bool isMatch = collationList.any((collationElement) =>
              _deepEquals(currentSourceArray[j], collationElement));
          if (currentSourceArray[j] is Map<String, dynamic>) {
            Map<String, dynamic> elementToModify =
                currentSourceArray[j] as Map<String, dynamic>;
            elementToModify['found${i + 1}'] = isMatch;
          }
        }

        void _replaceArrayInJsonRecursive(dynamic jsonObject, String property,
            int targetArrayIndex, List<dynamic> newArray,
            {int currentArrayIndex = 0}) {
          if (jsonObject is Map<String, dynamic>) {
            jsonObject.forEach((key, value) {
              if (key == property && value is List) {
                if (currentArrayIndex == targetArrayIndex) {
                  jsonObject[key] = newArray;
                  return;
                }
                currentArrayIndex++;
              }
              if (value is Map || value is List) {
                _replaceArrayInJsonRecursive(
                    value, property, targetArrayIndex, newArray,
                    currentArrayIndex: currentArrayIndex);
              }
            });
          } else if (jsonObject is List) {
            for (var item in jsonObject) {
              if (item is Map || item is List) {
                _replaceArrayInJsonRecursive(
                    item, property, targetArrayIndex, newArray,
                    currentArrayIndex: currentArrayIndex);
              }
            }
          }
        }

        _replaceArrayInJsonRecursive(
            sourceJson, property, i, currentSourceArray);
      }
    }

    return jsonEncode(sourceJson);
  } catch (e) {
    print('Error processing JSON: $e');
    return source;
  }
}

List<String> insertOverride(
  List<String> list,
  int index,
  String value,
) {
  if (index >= list.length) {
    final needed = index + 1 - list.length;
    list.addAll(List.filled(needed, ''));
  }
  list[index] = value;
  return list;
}

String insertOverrideJson(
  String list,
  String property,
  String value,
) {
  try {
    dynamic listJSON = jsonDecode(list);
    listJSON[property] = value.toString();
    list = jsonEncode(listJSON);
    return list;
  } catch (e) {
    print("Error $e");
    return list;
  }
}

String findHighestScoredPropertyStringOutput(
  String propertiesJson,
  String dictionaryJson,
) {
  try {
    // --- [VERBOSE LEVEL 3] --- START: JSON Parsing Block
    print("--- [VERBOSE LEVEL 3] --- START: JSON Parsing Block");
    Map<String, dynamic> propertiesMap;
    try {
      print("VERBOSE 3: Attempting to decode propertiesJson: $propertiesJson");
      var propertiesMapDecoded = jsonDecode(propertiesJson);
      if (propertiesMapDecoded is! Map<String, dynamic>) {
        print(
            " = = = = = = = = = = = = = = = = = = = = = = = = = = VERBOSE 3 ERROR: propertiesJson is not a JSON object (Map).");
        print("VERBOSE 3 ERROR JSON String: $propertiesJson");
        return "null";
      }
      propertiesMap = propertiesMapDecoded;
      print(
          "VERBOSE 3: propertiesJson decoded successfully to Map: $propertiesMap");
    } catch (e) {
      print(
          "--- [VERBOSE LEVEL 3] --- ERROR [JSON Parsing - propertiesJson]: Error during JSON parsing: $e");
      return "null"; // Handle JSON parsing errors for propertiesJson
    }

    Map<String, dynamic> dictionaryMap;
    try {
      print("VERBOSE 3: Attempting to decode dictionaryJson: $dictionaryJson");
      var dictionaryMapDecoded = jsonDecode(dictionaryJson);
      if (dictionaryMapDecoded is! Map<String, dynamic>) {
        print(
            " = = = = = = = = = = = = = = = = = = = = = Error: dictionaryJson is not a JSON object (Map).");
        print("VERBOSE 3 ERROR JSON String: $dictionaryJson");
        return "null";
      }
      dictionaryMap = dictionaryMapDecoded;
      print(
          "VERBOSE 3: dictionaryJson decoded successfully to Map: $dictionaryMap");
      print("VERBOSE 3: dictionaryMap content: $dictionaryMap");
    } catch (e) {
      print(
          "--- [VERBOSE LEVEL 3] --- ERROR [JSON Parsing - dictionaryJson]: Error during JSON parsing: $e");
      return "null"; // Handle JSON parsing errors for dictionaryJson
    }
    print("--- [VERBOSE LEVEL 3] --- END: JSON Parsing Block - Success");

    // --- [VERBOSE LEVEL 3] --- START: Property Value Extraction Block
    print("--- [VERBOSE LEVEL 3] --- START: Property Value Extraction Block");
    List<String> propertyValues = [];
    List<dynamic> stack = [propertiesMap]; // Initialize stack with the root map

    try {
      while (stack.isNotEmpty) {
        dynamic current = stack.removeLast(); // Pop from stack
        print(
            "VERBOSE 3: Processing current item from stack: $current, type: ${current.runtimeType}");

        if (current is Map) {
          print("VERBOSE 3: Current item is a Map, adding values to stack.");
          current.values
              .forEach((value) => stack.add(value)); // Push Map values to stack
        } else if (current is List) {
          print("VERBOSE 3: Current item is a List, adding items to stack.");
          current
              .forEach((item) => stack.add(item)); // Push List items to stack
        } else if (current is String) {
          // Attempt to parse String as JSON
          try {
            print(
                "VERBOSE 3: Current item is a String, attempting JSON parse: $current");
            dynamic parsedJson = jsonDecode(current);
            print(
                "VERBOSE 3: String parsed as JSON successfully, adding parsed JSON to stack.");
            stack.add(
                parsedJson); // If parsing successful, add parsed JSON to stack for further processing
          } catch (e) {
            // If not valid JSON, treat as a regular string value
            print(
                "VERBOSE 3: String is not valid JSON, treating as property value: $current");
            propertyValues.add(current);
          }
        } else if (current != null) {
          // Handle other non-null values
          print(
              "VERBOSE 3: Current item is not null, converting to String and adding as property value: $current");
          propertyValues
              .add(current.toString()); // Convert to String and add to list
        } else {
          print("VERBOSE 3: Current item is null, skipping.");
        }
      }
      print("VERBOSE 3: Extracted property values: $propertyValues");
    } catch (e) {
      print(
          "--- [VERBOSE LEVEL 3] --- ERROR [Property Value Extraction]: Error during property value extraction: $e");
      return "null";
    }
    print(
        "--- [VERBOSE LEVEL 3] --- END: Property Value Extraction Block - Success");

    if (propertyValues.isEmpty) {
      print("VERBOSE 3: No property values extracted.");
      return "null"; // No property values found, return "null" string
    }

    // --- [VERBOSE LEVEL 3] --- START: Dictionary Lookup Block
    print("--- [VERBOSE LEVEL 3] --- START: Dictionary Lookup Block");
    List<MapEntry<String, int>> scoredValues = [];
    try {
      for (String value in propertyValues) {
        print("VERBOSE 3: Looking up value in dictionary: '$value'");
        print("VERBOSE 3: Dictionary keys: ${dictionaryMap.keys}");
        if (dictionaryMap.containsKey(value)) {
          print("VERBOSE 3: Value '$value' found in dictionary.");
          dynamic score = dictionaryMap[value];
          print(
              "VERBOSE 3: Retrieved score for '$value': $score, type: ${score.runtimeType}");
          if (score is int) {
            print("VERBOSE 3: Score is an integer, adding to scoredValues.");
            scoredValues.add(MapEntry(value, score));
          } else {
            print("VERBOSE 3: Score is not an integer, skipping value.");
          }
        } else {
          print("VERBOSE 3: Value '$value' not found in dictionary.");
        }
      }
      print("VERBOSE 3: Scored values after dictionary lookup: $scoredValues");
    } catch (e) {
      print(
          "--- [VERBOSE LEVEL 3] --- ERROR [Dictionary Lookup]: Error during dictionary lookup: $e");
      return "null";
    }
    print("--- [VERBOSE LEVEL 3] --- END: Dictionary Lookup Block - Success");

    if (scoredValues.isEmpty) {
      print("VERBOSE 3: No scored properties found in the dictionary.");
      print(" 0 0 0 0 0 0 0 0 scores empty 0 0 0 0 0 0 ");
      return "null"; // No property values found in the dictionary, return "null" string
    }

    // --- [VERBOSE LEVEL 3] --- START: Sorting Block
    print("--- [VERBOSE LEVEL 3] --- START: Sorting Block");
    try {
      print("VERBOSE 3: Sorting scoredValues: $scoredValues");
      scoredValues
          .sort((a, b) => b.value.compareTo(a.value)); // Descending order
      print("VERBOSE 3: Sorted scoredValues: $scoredValues");
    } catch (e) {
      print(
          "--- [VERBOSE LEVEL 3] --- ERROR [Sorting]: Error during sorting of scored values: $e");
      return "null";
    }
    print("--- [VERBOSE LEVEL 3] --- END: Sorting Block - Success");

    // --- [VERBOSE LEVEL 3] --- START: Result Encoding Block
    print("--- [VERBOSE LEVEL 3] --- START: Result Encoding Block");
    try {
      MapEntry<String, int> highestScored = scoredValues.first;
      print(
          "VERBOSE 3: Highest scored value found: ${highestScored.key} with score ${highestScored.value}");
      String resultJson =
          jsonEncode({"key": highestScored.key, "value": highestScored.value});
      print("VERBOSE 3: Result encoded to JSON string: $resultJson");
      print("--- [VERBOSE LEVEL 3] --- END: Result Encoding Block - Success");
      return resultJson;
    } catch (e) {
      print(
          "--- [VERBOSE LEVEL 3] --- ERROR [Result Encoding]: Error encoding result to JSON: $e");
      return "null";
    }
  } catch (e) {
    print(
        "*************************    --- [VERBOSE LEVEL 3] --- ERROR [General Exception]:  General Error processing JSON: $e");
    return "null"; // Handle any top-level exceptions
  }
}

String? singleArrayStringToStringFormatted(String string) {
  if (string.startsWith("[") && string.endsWith("]")) {
    String innerString = string.substring(1, string.length - 1);
    if (innerString.startsWith('"') && innerString.endsWith('"')) {
      return innerString.substring(1, innerString.length - 1);
    } else {
      return innerString; // Return as is if not quoted
    }
  } else {
    return string;
  }
}

int currentTimerData(
  DateTime startedTime,
  int milliSecondsSelected,
) {
  // substract startedTime with the actual time and return result in milliseconds
  DateTime currentTime = DateTime.now();
  Duration difference = currentTime.difference(startedTime);
  int result = milliSecondsSelected - difference.inMilliseconds;
  if (result > 0) {
    return result;
  }
  return 0;
}

String truncate(
  String inputText,
  int maxLength,
) {
  // Handle null or empty input string
  if (inputText == null || inputText.isEmpty) {
    return ''; // Return an empty string for null or empty input
  }

  // Handle non-positive maxLength gracefully
  // If maxLength is 0 or negative, an empty string is a reasonable output.
  if (maxLength <= 0) {
    return '';
  }

  // If the string's length is already less than or equal to maxLength,
  // return the original string.
  if (inputText.length <= maxLength) {
    return inputText;
  } else {
    // Otherwise, return the substring from the beginning up to maxLength.
    return inputText.substring(0, maxLength) + '...';
  }
}
