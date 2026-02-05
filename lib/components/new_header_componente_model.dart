import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'new_header_componente_widget.dart' show NewHeaderComponenteWidget;
import 'package:flutter/material.dart';

class NewHeaderComponenteModel
    extends FlutterFlowModel<NewHeaderComponenteWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimerVII;
  // Stores action output result for [Custom Action - locationgooglemaps] action in NewHeaderComponente widget.
  String? locationFromGoogleMap234;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in NewHeaderComponente widget.
  List<String>? sendlocationoutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimerVII?.cancel();
  }
}
