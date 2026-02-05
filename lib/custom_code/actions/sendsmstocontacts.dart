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

import 'package:url_launcher/url_launcher.dart';

Future<List<String>> sendsmstocontacts(
    List<String> phoneNumbers, String message) async {
  if (phoneNumbers.isEmpty) {
    return ['No se proporcionaron números de teléfono'];
  }
  if (message.trim().isEmpty) {
    return ['El mensaje no puede estar vacío'];
  }

  List<String> statuses = [];
  final encodedMessage = Uri.encodeComponent(message);

  for (final phoneNumberElement in phoneNumbers) {
    final phoneData = jsonDecode(phoneNumberElement);
    String phoneNumber = phoneData["phoneNumber"];
    final regex = RegExp(r'[^\w\s]');
    phoneNumber = "+" + phoneNumber.replaceAll(regex, '');
    try {
      if (!phoneNumber.contains(RegExp(r'^\+?\d{10,15}$'))) {
        statuses.add('fallo: $phoneNumber - Formato inválido');
        continue;
      }

      final uri = Uri.parse('sms:$phoneNumber?body=$encodedMessage');
      bool success = await launchUrl(uri, mode: LaunchMode.externalApplication);
      statuses.add('${success ? "éxito" : "fallo"}: $phoneNumber');
    } catch (e) {
      statuses.add('fallo: $phoneNumber - ${e.toString()}');
    }
  }

  return statuses;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
