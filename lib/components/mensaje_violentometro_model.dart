import '/components/mensaje_resultado_violentometro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mensaje_violentometro_widget.dart' show MensajeViolentometroWidget;
import 'package:flutter/material.dart';

class MensajeViolentometroModel
    extends FlutterFlowModel<MensajeViolentometroWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MensajeResultadoViolentometro component.
  late MensajeResultadoViolentometroModel mensajeResultadoViolentometroModel;

  @override
  void initState(BuildContext context) {
    mensajeResultadoViolentometroModel =
        createModel(context, () => MensajeResultadoViolentometroModel());
  }

  @override
  void dispose() {
    mensajeResultadoViolentometroModel.dispose();
  }
}
