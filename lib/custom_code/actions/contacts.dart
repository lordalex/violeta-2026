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

import 'package:flutter_contacts/flutter_contacts.dart';

Future<List<String>> contacts() async {
  try {
    print("Requesting Permissions");
    if (await FlutterContacts.requestPermission()) {
      print("Requesting Contacts");
      List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );
      // Map each contact name to a TextForntamField widget
      List<String> ContactString = contacts.map((contact) {
        String phoneNumber =
            contact.phones.isNotEmpty ? contact.phones.first.number : '';
        return jsonEncode({
          'name': contact.displayName,
          'phoneNumber': phoneNumber,
        });
      }).toList();
      return ContactString;
    }
  } catch (e) {
    return ["Failed"];
  }
  return ["Empty"];
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
