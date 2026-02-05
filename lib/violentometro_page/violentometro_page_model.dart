import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'violentometro_page_widget.dart' show ViolentometroPageWidget;
import 'package:flutter/material.dart';

class ViolentometroPageModel extends FlutterFlowModel<ViolentometroPageWidget> {
  ///  Local state fields for this page.

  String globalString = '{}';

  String diccionario = '{}';

  String selecciodos = '{}';

  String collationData = '{}';

  String tempStr = ' ';

  String value = ' ';

  String contenido = '{}';

  String mensajes = '{}';

  String seleccionadosValuesEnunciado = '{}';

  String imagenesValores = '{}';

  String imagenes = '{}';

  String imagen = ' ';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in ViolentometroPage widget.
  String? contenidoInteractivo;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
  }

  @override
  void dispose() {
    newHeaderComponenteModel.dispose();
    tabBarController?.dispose();
  }
}
