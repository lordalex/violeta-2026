import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // State field(s) for Email widget.
  final emailKey = GlobalKey();
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? emailSelectedOption;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
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
    emailFocusNode?.dispose();

    passwordCurrentFocusNode?.dispose();
    passwordCurrentTextController?.dispose();

    passwordNewFocusNode?.dispose();
    passwordNewTextController?.dispose();
  }
}
