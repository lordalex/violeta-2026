import '/components/new_header_componente_widget.dart';
import '/components/notifications_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'perfil_usuario_widget.dart' show PerfilUsuarioWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PerfilUsuarioModel extends FlutterFlowModel<PerfilUsuarioWidget> {
  ///  Local state fields for this page.

  int filled = 0;

  int fieldsnumber = 4;

  List<String> municipio = ['Seleccione un Estado'];
  void addToMunicipio(String item) => municipio.add(item);
  void removeFromMunicipio(String item) => municipio.remove(item);
  void removeAtIndexFromMunicipio(int index) => municipio.removeAt(index);
  void insertAtIndexInMunicipio(int index, String item) =>
      municipio.insert(index, item);
  void updateMunicipioAtIndex(int index, Function(String) updateFn) =>
      municipio[index] = updateFn(municipio[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProfile] action in PerfilUsuario widget.
  String? profileGOT;
  // Stores action output result for [Custom Action - stringtoparameters] action in PerfilUsuario widget.
  String? profileparameters;
  // Stores action output result for [Custom Action - initialsAction] action in PerfilUsuario widget.
  String? avatarnameOutput;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in PerfilUsuario widget.
  String? estadosdownloaded;
  // State field(s) for nombreApellido widget.
  FocusNode? nombreApellidoFocusNode;
  TextEditingController? nombreApellidoTextController;
  String? Function(BuildContext, String?)?
      nombreApellidoTextControllerValidator;
  // Stores action output result for [Custom Action - initialsAction] action in nombreApellido widget.
  String? avatarnameOutputy;
  // Stores action output result for [Custom Action - initialsAction] action in nombreApellido widget.
  String? avatarnameOutputx;
  // State field(s) for nrodetelefono widget.
  FocusNode? nrodetelefonoFocusNode;
  TextEditingController? nrodetelefonoTextController;
  late MaskTextInputFormatter nrodetelefonoMask;
  String? Function(BuildContext, String?)? nrodetelefonoTextControllerValidator;
  // State field(s) for cedula widget.
  FocusNode? cedulaFocusNode;
  TextEditingController? cedulaTextController;
  String? Function(BuildContext, String?)? cedulaTextControllerValidator;
  // State field(s) for fecha_nac widget.
  FocusNode? fechaNacFocusNode;
  TextEditingController? fechaNacTextController;
  late MaskTextInputFormatter fechaNacMask;
  String? Function(BuildContext, String?)? fechaNacTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in DropDown widget.
  String? estadosdownloadedv;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // Model for Notifications component.
  late NotificationsModel notificationsModel;
  // Stores action output result for [Custom Action - makeprofile] action in Button widget.
  String? profileMK;
  // Stores action output result for [Custom Action - sendprofile] action in Button widget.
  String? response;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;

  @override
  void initState(BuildContext context) {
    notificationsModel = createModel(context, () => NotificationsModel());
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
  }

  @override
  void dispose() {
    nombreApellidoFocusNode?.dispose();
    nombreApellidoTextController?.dispose();

    nrodetelefonoFocusNode?.dispose();
    nrodetelefonoTextController?.dispose();

    cedulaFocusNode?.dispose();
    cedulaTextController?.dispose();

    fechaNacFocusNode?.dispose();
    fechaNacTextController?.dispose();

    notificationsModel.dispose();
    newHeaderComponenteModel.dispose();
  }
}
