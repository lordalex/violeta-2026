import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'navigation_bar_widget.dart' show NavigationBarWidget;
import 'package:flutter/material.dart';

class NavigationBarModel extends FlutterFlowModel<NavigationBarWidget> {
  ///  Local state fields for this component.

  bool timer = false;

  int counter = 0;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - locationgooglemaps] action in NavigationBar widget.
  String? locationFromGoogleMap;
  InstantTimer? instantTimerW;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in Image widget.
  List<String>? sendlocationoutput;
  InstantTimer? instantTimerZ;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in IconButton widget.
  List<String>? sendlocationoutputCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    instantTimerW?.cancel();
    instantTimerZ?.cancel();
  }
}
