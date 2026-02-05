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

Future<List<String>> searchServices(
  String searchCriteriaString,
  String fileContentString,
) async {
  final List<String> matchingObjects = [];

  try {
    print('Starting searchServices');
    final searchCriteria =
        jsonDecode(searchCriteriaString) as Map<String, dynamic>;
    final decodedData = jsonDecode(fileContentString);

    void searchNested(dynamic node, Map<String, dynamic> accumulated) {
      try {
        if (node is Map) {
          // Merge current level properties with accumulated ones
          final currentLevel = Map<String, dynamic>.from(accumulated);
          currentLevel.addAll(Map<String, dynamic>.from(node));

          // Check if current level matches all criteria
          bool matchesAll = true;
          searchCriteria.forEach((key, value) {
            final nodeValue = currentLevel[key]?.toString().toLowerCase();
            final searchValue = value.toString().toLowerCase();
            if (nodeValue == null ||
                (nodeValue != searchValue &&
                    nodeValue != "todos" &&
                    searchValue != "todos")) {
              matchesAll = false;
            }
          });

          if (matchesAll) {
            print('Found match: ${jsonEncode(node)}');
            matchingObjects.add(jsonEncode(node));
          }

          // Continue searching nested properties
          node.values.forEach((value) {
            searchNested(value, currentLevel);
          });
        } else if (node is List) {
          node.forEach((item) => searchNested(item, accumulated));
        }
      } catch (e) {
        print('Error in searchNested: $e');
      }
    }

    print('Starting recursive search');
    if (decodedData is Map) {
      searchNested(decodedData, {});
    } else if (decodedData is List) {
      decodedData.forEach((item) => searchNested(item, {}));
    }

    print('Found ${matchingObjects.length} matches');
    return matchingObjects;
  } catch (e) {
    print('Error in searchServices: $e');
    return [];
  }
}
