import '/components/shinmer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_de_contacto_component_shinmer_widget.dart'
    show ListaDeContactoComponentShinmerWidget;
import 'package:flutter/material.dart';

class ListaDeContactoComponentShinmerModel
    extends FlutterFlowModel<ListaDeContactoComponentShinmerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ShinmerComponent component.
  late ShinmerComponentModel shinmerComponentModel;

  @override
  void initState(BuildContext context) {
    shinmerComponentModel = createModel(context, () => ShinmerComponentModel());
  }

  @override
  void dispose() {
    shinmerComponentModel.dispose();
  }
}
