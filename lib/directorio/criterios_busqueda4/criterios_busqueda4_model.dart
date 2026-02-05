import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'criterios_busqueda4_widget.dart' show CriteriosBusqueda4Widget;
import 'package:flutter/material.dart';

class CriteriosBusqueda4Model
    extends FlutterFlowModel<CriteriosBusqueda4Widget> {
  ///  Local state fields for this page.

  List<String> serviciosArray = [' '];
  void addToServiciosArray(String item) => serviciosArray.add(item);
  void removeFromServiciosArray(String item) => serviciosArray.remove(item);
  void removeAtIndexFromServiciosArray(int index) =>
      serviciosArray.removeAt(index);
  void insertAtIndexInServiciosArray(int index, String item) =>
      serviciosArray.insert(index, item);
  void updateServiciosArrayAtIndex(int index, Function(String) updateFn) =>
      serviciosArray[index] = updateFn(serviciosArray[index]);

  List<String> municipioArray = [' '];
  void addToMunicipioArray(String item) => municipioArray.add(item);
  void removeFromMunicipioArray(String item) => municipioArray.remove(item);
  void removeAtIndexFromMunicipioArray(int index) =>
      municipioArray.removeAt(index);
  void insertAtIndexInMunicipioArray(int index, String item) =>
      municipioArray.insert(index, item);
  void updateMunicipioArrayAtIndex(int index, Function(String) updateFn) =>
      municipioArray[index] = updateFn(municipioArray[index]);

  List<String> searchResults = [' '];
  void addToSearchResults(String item) => searchResults.add(item);
  void removeFromSearchResults(String item) => searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(int index, String item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(int index, Function(String) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in CriteriosBusqueda4 widget.
  String? fileContent;
  // Stores action output result for [Custom Action - searchServices] action in CriteriosBusqueda4 widget.
  List<String>? searchContent;
  InstantTimer? instantTimerVII;
  // Stores action output result for [Custom Action - locationgooglemaps] action in CriteriosBusqueda4 widget.
  String? locationFromGoogleMap234;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in CriteriosBusqueda4 widget.
  List<String>? sendlocationoutput;
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
    instantTimerVII?.cancel();
    newNavigationBarModel.dispose();
    newHeaderComponenteModel.dispose();
  }
}
