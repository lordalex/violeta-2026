import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'emergency_button_page_widget.dart' show EmergencyButtonPageWidget;
import 'package:flutter/material.dart';

class EmergencyButtonPageModel
    extends FlutterFlowModel<EmergencyButtonPageWidget> {
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

  bool isEmergencyOn = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in EmergencyButtonPage widget.
  String? messageGetterA;
  // Stores action output result for [Custom Action - locationgooglemaps] action in EmergencyButtonPage widget.
  String? locationFromGoogleMapV;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - locationgooglemaps] action in EmergencyButtonPage widget.
  String? locationFromGoogleMap3;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in EmergencyButtonPage widget.
  List<String>? sendlocationoutput;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in EmergencyButtonPage widget.
  String? messageGetter;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    newHeaderComponenteModel.dispose();
  }
}
