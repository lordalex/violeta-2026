import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  int filled = 0;

  int fieldsnumber = 4;

  List<String> municipio = ['Seleccione un Estado'];
  void addToMunicipio(String item) => municipio.add(item);
  void removeFromMunicipio(String item) => municipio.remove(item);
  void removeAtIndexFromMunicipio(int index) => municipio.removeAt(index);
  void insertAtIndexInMunicipio(int index, String item) =>
      municipio.insert(index, item);
  void updateMunicipioAtIndex(int index, Function(String) updateFn) =>
      municipio[index] = updateFn(municipio[index]);

  ///  State fields for stateful widgets in this page.

  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
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
    newNavigationBarModel.dispose();
  }
}
