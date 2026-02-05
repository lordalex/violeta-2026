import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'selectbuttons_widget.dart' show SelectbuttonsWidget;
import 'package:flutter/material.dart';

class SelectbuttonsModel extends FlutterFlowModel<SelectbuttonsWidget> {
  ///  Local state fields for this component.

  int? radioselected;

  String value = ' ';

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
