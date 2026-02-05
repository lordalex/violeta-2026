import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'lineas_de_atencion_page_widget.dart' show LineasDeAtencionPageWidget;
import 'package:flutter/material.dart';

class LineasDeAtencionPageModel
    extends FlutterFlowModel<LineasDeAtencionPageWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimerVII;
  // Stores action output result for [Custom Action - locationgooglemaps] action in LineasDeAtencionPage widget.
  String? locationFromGoogleMap234;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in LineasDeAtencionPage widget.
  List<String>? sendlocationoutput;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // Model for newNavigationBar component.
  late NewNavigationBarModel newNavigationBarModel;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
    newNavigationBarModel = createModel(context, () => NewNavigationBarModel());
  }

  @override
  void dispose() {
    instantTimerVII?.cancel();
    newHeaderComponenteModel.dispose();
    newNavigationBarModel.dispose();
  }
}
