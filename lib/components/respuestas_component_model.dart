import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'respuestas_component_widget.dart' show RespuestasComponentWidget;
import 'package:flutter/material.dart';

class RespuestasComponentModel
    extends FlutterFlowModel<RespuestasComponentWidget> {
  ///  Local state fields for this component.

  bool respuestaVisible = false;

  int listaN = 0;

  String text1 = ' ';

  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
