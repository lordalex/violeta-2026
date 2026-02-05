import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'acompaname_page_widget.dart' show AcompanamePageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class AcompanamePageModel extends FlutterFlowModel<AcompanamePageWidget> {
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

  int integerTimerSelector = 0;

  int? millisecondsTimerSelector = 0;

  bool isTimerOn = false;

  DateTime? startedDateTime;

  String? stringOfTimeRange;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimerVII;
  // Stores action output result for [Custom Action - locationgooglemaps] action in AcompanamePage widget.
  String? locationFromGoogleMap23B;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in AcompanamePage widget.
  List<String>? sendlocationoutput;
  // Stores action output result for [Custom Action - getHTMLfromURL] action in Stack widget.
  String? messageGetterA;
  // Stores action output result for [Custom Action - locationgooglemaps] action in Stack widget.
  String? locationFromGoogleMapV;
  InstantTimer? instantTimerVIII;
  // Stores action output result for [Custom Action - sendlocationtoapi] action in Stack widget.
  List<String>? sendlocationoutput1;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

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
    instantTimerVIII?.cancel();
    timerController.dispose();
    newNavigationBarModel.dispose();
    newHeaderComponenteModel.dispose();
  }
}
