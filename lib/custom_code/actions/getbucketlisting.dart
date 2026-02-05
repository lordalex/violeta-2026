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

Future<List<String>> getbucketlisting(
    String bucketname, String path, String supabaseKey, String filter) async {
  debugPrint('Starting getbucketlisting operation...');
  debugPrint('Parameters received - Bucket: $bucketname, Path: $path');

  // Initialize empty response variable
  List<FileObject> response = [];

  try {
    debugPrint('Setting up headers with Supabase key...');
    final headers = {
      'apikey': supabaseKey,
    };
    debugPrint('Headers setup completed successfully');

    try {
      debugPrint('Configuring search options...');
      final searchOptions = SearchOptions(
          sortBy: SortBy(
        column: 'name',
        order: 'desc',
      ));
      debugPrint('Search options configured successfully');

      try {
        debugPrint('Initiating storage client connection...');
        final storageClient = SupaFlow.client.storage;
        debugPrint('Storage client connection established');

        try {
          debugPrint('Attempting to list files from bucket: $bucketname');
          response = await storageClient.from(bucketname).list();
          debugPrint(response.toString());
          response = await storageClient.from(bucketname).list(path: path);
          debugPrint(response.toString());
          debugPrint(
              'Successfully retrieved ${response.length} files from storage');
        } catch (storageError) {
          debugPrint('❌ Error accessing storage: $storageError');
          throw Exception('Storage access failed: $storageError');
        }
      } catch (clientError) {
        debugPrint('❌ Error with storage client: $clientError');
        throw Exception('Storage client error: $clientError');
      }
    } catch (optionsError) {
      debugPrint('❌ Error configuring search options: $optionsError');
      throw Exception('Search options configuration failed: $optionsError');
    }

    if (response.isEmpty) {
      debugPrint('⚠️ No files found in the specified path');
      return [];
    }

    try {
      debugPrint('Filtering HTML files and mapping results...');
      final filteredFiles = response
          .where((file) => file.name.toLowerCase().endsWith(filter))
          .map((file) => file.name)
          .toList();
      debugPrint('Successfully filtered ${filteredFiles.length} files');

      // Log each found file for debugging
      filteredFiles.forEach((fileName) {
        debugPrint('Found HTML file: $fileName');
      });

      return filteredFiles;
    } catch (filterError) {
      debugPrint('❌ Error filtering/mapping files: $filterError');
      throw Exception('File filtering failed: $filterError');
    }
  } catch (error) {
    debugPrint('❌ Critical error in getbucketlisting: $error');
    debugPrint('Stack trace: ${StackTrace.current}');
    throw Exception('Failed to complete bucket listing operation: $error');
  } finally {
    debugPrint('Completing getbucketlisting operation');
  }
}
