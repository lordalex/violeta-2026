import '/components/new_header_componente_widget.dart';
import '/components/ya_estas_registrado_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_widget.dart' show RegistrationWidget;
import 'package:flutter/material.dart';

class RegistrationModel extends FlutterFlowModel<RegistrationWidget> {
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
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  // State field(s) for CheckBoxTerms widget.
  bool? checkBoxTermsValue;
  // Model for YaEstasRegistrado component.
  late YaEstasRegistradoModel yaEstasRegistradoModel;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
    passwordVisibility = false;
    passwordConfirmVisibility = false;
    yaEstasRegistradoModel =
        createModel(context, () => YaEstasRegistradoModel());
  }

  @override
  void dispose() {
    newHeaderComponenteModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();

    yaEstasRegistradoModel.dispose();
  }
}
