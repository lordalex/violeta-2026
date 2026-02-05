import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'directorio1_widget.dart' show Directorio1Widget;
import 'package:flutter/material.dart';

class Directorio1Model extends FlutterFlowModel<Directorio1Widget> {
  ///  Local state fields for this page.

  List<String> dirFileNameList = [' '];
  void addToDirFileNameList(String item) => dirFileNameList.add(item);
  void removeFromDirFileNameList(String item) => dirFileNameList.remove(item);
  void removeAtIndexFromDirFileNameList(int index) =>
      dirFileNameList.removeAt(index);
  void insertAtIndexInDirFileNameList(int index, String item) =>
      dirFileNameList.insert(index, item);
  void updateDirFileNameListAtIndex(int index, Function(String) updateFn) =>
      dirFileNameList[index] = updateFn(dirFileNameList[index]);

  String baseURL = ' ';

  bool isSearchOn = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in directorio1 widget.
  String? directorioIndex;
  // State field(s) for Buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for newNavigationBar component.
  late NewNavigationBarModel newNavigationBarModel;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;

  @override
  void initState(BuildContext context) {
    newNavigationBarModel = createModel(context, () => NewNavigationBarModel());
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
  }

  @override
  void dispose() {
    buscarFocusNode?.dispose();
    buscarTextController?.dispose();

    newNavigationBarModel.dispose();
    newHeaderComponenteModel.dispose();
  }
}
