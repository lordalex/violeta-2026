import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'violentometro_page_trivia_widget.dart'
    show ViolentometroPageTriviaWidget;
import 'package:flutter/material.dart';

class ViolentometroPageTriviaModel
    extends FlutterFlowModel<ViolentometroPageTriviaWidget> {
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

  String? urlParam;

  String? typeParam;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in ViolentometroPageTrivia widget.
  String? contenidoInteractivo;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
  }

  @override
  void dispose() {
    newHeaderComponenteModel.dispose();
  }
}
