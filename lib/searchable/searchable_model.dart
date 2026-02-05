import '/components/empty_widget.dart';
import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'searchable_widget.dart' show SearchableWidget;
import 'package:flutter/material.dart';

class SearchableModel extends FlutterFlowModel<SearchableWidget> {
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

  int iteratorEmptyHandler = 0;

  bool boolSearchLoaded = false;

  bool boolIsEmptySearch = false;

  List<String> tempContactList = [];
  void addToTempContactList(String item) => tempContactList.add(item);
  void removeFromTempContactList(String item) => tempContactList.remove(item);
  void removeAtIndexFromTempContactList(int index) =>
      tempContactList.removeAt(index);
  void insertAtIndexInTempContactList(int index, String item) =>
      tempContactList.insert(index, item);
  void updateTempContactListAtIndex(int index, Function(String) updateFn) =>
      tempContactList[index] = updateFn(tempContactList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - contacts] action in searchable widget.
  List<String>? contactL;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // State field(s) for Buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
  // Stores action output result for [Custom Action - contacts] action in Buscar widget.
  List<String>? contactosoutputforprocv;
  // Stores action output result for [Custom Action - contacts] action in Buscar widget.
  List<String>? contactosoutputforprocv2;
  // Stores action output result for [Custom Action - addContactTo] action in ListTile widget.
  List<String>? contactosdemergencianuevodespuesdeinsercion;
  // Model for empty component.
  late EmptyModel emptyModel;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
    emptyModel = createModel(context, () => EmptyModel());
  }

  @override
  void dispose() {
    newHeaderComponenteModel.dispose();
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    emptyModel.dispose();
  }
}
