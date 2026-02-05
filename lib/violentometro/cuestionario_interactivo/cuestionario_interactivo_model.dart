import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cuestionario_interactivo_widget.dart'
    show CuestionarioInteractivoWidget;
import 'package:flutter/material.dart';

class CuestionarioInteractivoModel
    extends FlutterFlowModel<CuestionarioInteractivoWidget> {
  ///  Local state fields for this page.

  List<String> cuestionariorows = [];
  void addToCuestionariorows(String item) => cuestionariorows.add(item);
  void removeFromCuestionariorows(String item) => cuestionariorows.remove(item);
  void removeAtIndexFromCuestionariorows(int index) =>
      cuestionariorows.removeAt(index);
  void insertAtIndexInCuestionariorows(int index, String item) =>
      cuestionariorows.insert(index, item);
  void updateCuestionariorowsAtIndex(int index, Function(String) updateFn) =>
      cuestionariorows[index] = updateFn(cuestionariorows[index]);

  String cuestionarioData = ' ';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in CuestionarioInteractivo widget.
  String? cuestionarioresultado;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for newNavigationBar component.
  late NewNavigationBarModel newNavigationBarModel;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
    newNavigationBarModel = createModel(context, () => NewNavigationBarModel());
  }

  @override
  void dispose() {
    newHeaderComponenteModel.dispose();
    tabBarController?.dispose();
    newNavigationBarModel.dispose();
  }
}
