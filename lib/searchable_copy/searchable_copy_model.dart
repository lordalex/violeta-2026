import '/components/header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'searchable_copy_widget.dart' show SearchableCopyWidget;
import 'package:flutter/material.dart';

class SearchableCopyModel extends FlutterFlowModel<SearchableCopyWidget> {
  ///  Local state fields for this page.

  List<String> contactList = [];
  void addToContactList(String item) => contactList.add(item);
  void removeFromContactList(String item) => contactList.remove(item);
  void removeAtIndexFromContactList(int index) => contactList.removeAt(index);
  void insertAtIndexInContactList(int index, String item) =>
      contactList.insert(index, item);
  void updateContactListAtIndex(int index, Function(String) updateFn) =>
      contactList[index] = updateFn(contactList[index]);

  List<String> contactListHold = [];
  void addToContactListHold(String item) => contactListHold.add(item);
  void removeFromContactListHold(String item) => contactListHold.remove(item);
  void removeAtIndexFromContactListHold(int index) =>
      contactListHold.removeAt(index);
  void insertAtIndexInContactListHold(int index, String item) =>
      contactListHold.insert(index, item);
  void updateContactListHoldAtIndex(int index, Function(String) updateFn) =>
      contactListHold[index] = updateFn(contactListHold[index]);

  List<String> properties = ['name', 'phoneNumber'];
  void addToProperties(String item) => properties.add(item);
  void removeFromProperties(String item) => properties.remove(item);
  void removeAtIndexFromProperties(int index) => properties.removeAt(index);
  void insertAtIndexInProperties(int index, String item) =>
      properties.insert(index, item);
  void updatePropertiesAtIndex(int index, Function(String) updateFn) =>
      properties[index] = updateFn(properties[index]);

  List<String> propertiesV = ['phoneNumber'];
  void addToPropertiesV(String item) => propertiesV.add(item);
  void removeFromPropertiesV(String item) => propertiesV.remove(item);
  void removeAtIndexFromPropertiesV(int index) => propertiesV.removeAt(index);
  void insertAtIndexInPropertiesV(int index, String item) =>
      propertiesV.insert(index, item);
  void updatePropertiesVAtIndex(int index, Function(String) updateFn) =>
      propertiesV[index] = updateFn(propertiesV[index]);

  List<String> contactListPhones = [];
  void addToContactListPhones(String item) => contactListPhones.add(item);
  void removeFromContactListPhones(String item) =>
      contactListPhones.remove(item);
  void removeAtIndexFromContactListPhones(int index) =>
      contactListPhones.removeAt(index);
  void insertAtIndexInContactListPhones(int index, String item) =>
      contactListPhones.insert(index, item);
  void updateContactListPhonesAtIndex(int index, Function(String) updateFn) =>
      contactListPhones[index] = updateFn(contactListPhones[index]);

  bool continuar = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - contacts] action in searchableCopy widget.
  List<String>? contactL;
  // Model for HeaderComponente component.
  late HeaderComponenteModel headerComponenteModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - contacts] action in TextField widget.
  List<String>? contactosoutputforporcessing;
  // Stores action output result for [Custom Action - contacts] action in TextField widget.
  List<String>? contactosoutputforporcessingCopy;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    headerComponenteModel = createModel(context, () => HeaderComponenteModel());
  }

  @override
  void dispose() {
    headerComponenteModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
