import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_page_widget.dart' show ChangePasswordPageWidget;
import 'package:flutter/material.dart';

class ChangePasswordPageModel
    extends FlutterFlowModel<ChangePasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // State field(s) for passwordCurrent widget.
  FocusNode? passwordCurrentFocusNode;
  TextEditingController? passwordCurrentTextController;
  late bool passwordCurrentVisibility;
  String? Function(BuildContext, String?)?
      passwordCurrentTextControllerValidator;
  // State field(s) for passwordNew widget.
  FocusNode? passwordNewFocusNode;
  TextEditingController? passwordNewTextController;
  late bool passwordNewVisibility;
  String? Function(BuildContext, String?)? passwordNewTextControllerValidator;
  // Stores action output result for [Custom Action - updatePassword] action in Button widget.
  String? changedString;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
    passwordCurrentVisibility = false;
    passwordNewVisibility = false;
  }

  @override
  void dispose() {
    newHeaderComponenteModel.dispose();
    passwordCurrentFocusNode?.dispose();
    passwordCurrentTextController?.dispose();

    passwordNewFocusNode?.dispose();
    passwordNewTextController?.dispose();
  }
}
