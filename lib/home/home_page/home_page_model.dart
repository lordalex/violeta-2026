import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<String> listadodecontenidoestatico = [' '];
  void addToListadodecontenidoestatico(String item) =>
      listadodecontenidoestatico.add(item);
  void removeFromListadodecontenidoestatico(String item) =>
      listadodecontenidoestatico.remove(item);
  void removeAtIndexFromListadodecontenidoestatico(int index) =>
      listadodecontenidoestatico.removeAt(index);
  void insertAtIndexInListadodecontenidoestatico(int index, String item) =>
      listadodecontenidoestatico.insert(index, item);
  void updateListadodecontenidoestaticoAtIndex(
          int index, Function(String) updateFn) =>
      listadodecontenidoestatico[index] =
          updateFn(listadodecontenidoestatico[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in HomePage widget.
  String? messageOutput;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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
    newNavigationBarModel.dispose();
    newHeaderComponenteModel.dispose();
  }
}
