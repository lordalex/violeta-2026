import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'header_chat_widget.dart' show HeaderChatWidget;
import 'package:flutter/material.dart';

class HeaderChatModel extends FlutterFlowModel<HeaderChatWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimerVII;
  // Stores action output result for [Custom Action - locationgooglemaps] action in HeaderChat widget.
  String? locationFromGoogleMap234;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in HeaderChat widget.
  List<String>? sendlocationoutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimerVII?.cancel();
  }
}
