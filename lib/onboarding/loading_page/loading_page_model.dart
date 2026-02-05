import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'loading_page_widget.dart' show LoadingPageWidget;
import 'package:flutter/material.dart';

class LoadingPageModel extends FlutterFlowModel<LoadingPageWidget> {
  ///  Local state fields for this page.

  List<String> stringlistdeestados = [];
  void addToStringlistdeestados(String item) => stringlistdeestados.add(item);
  void removeFromStringlistdeestados(String item) =>
      stringlistdeestados.remove(item);
  void removeAtIndexFromStringlistdeestados(int index) =>
      stringlistdeestados.removeAt(index);
  void insertAtIndexInStringlistdeestados(int index, String item) =>
      stringlistdeestados.insert(index, item);
  void updateStringlistdeestadosAtIndex(int index, Function(String) updateFn) =>
      stringlistdeestados[index] = updateFn(stringlistdeestados[index]);

  int status = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getProfile] action in LoadingPage widget.
  String? profileGOT;
  // Stores action output result for [Custom Action - stringtoparameters] action in LoadingPage widget.
  String? profileparameters;
  // Stores action output result for [Custom Action - initialsAction] action in LoadingPage widget.
  String? avatarnameOutput;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in LoadingPage widget.
  String? interactivoIndexFrom;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in LoadingPage widget.
  String? lstF;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in LoadingPage widget.
  String? listastringdeestados;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in LoadingPage widget.
  String? indexEstaticosL;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in LoadingPage widget.
  String? indexDestacados;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
