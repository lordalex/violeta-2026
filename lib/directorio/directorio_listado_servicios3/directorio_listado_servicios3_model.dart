import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'directorio_listado_servicios3_widget.dart'
    show DirectorioListadoServicios3Widget;
import 'package:flutter/material.dart';

class DirectorioListadoServicios3Model
    extends FlutterFlowModel<DirectorioListadoServicios3Widget> {
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

  String? servicioSetter;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in directorioListadoServicios3 widget.
  String? fileContent;
  // State field(s) for Buscar widget.
  FocusNode? buscarFocusNode;
  TextEditingController? buscarTextController;
  String? Function(BuildContext, String?)? buscarTextControllerValidator;
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
