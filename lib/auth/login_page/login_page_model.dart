import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in Text widget.
  String? messageresetpasswordfilecontent;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
    passwordVisibility = false;
  }

  @override
  void dispose() {
    newHeaderComponenteModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
