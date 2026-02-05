import '/components/mensaje_resultado_violentometro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mensaje_violentometro_model.dart';
export 'mensaje_violentometro_model.dart';

class MensajeViolentometroWidget extends StatefulWidget {
  const MensajeViolentometroWidget({super.key});

  @override
  State<MensajeViolentometroWidget> createState() =>
      _MensajeViolentometroWidgetState();
}

class _MensajeViolentometroWidgetState
    extends State<MensajeViolentometroWidget> {
  late MensajeViolentometroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeViolentometroModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.5, 0.0, 0.0),
        child: Container(
          width: 110.0,
          height: 35.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: Image.asset(
                'assets/images/Group_4_(2).png',
              ).image,
            ),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: wrapWithModel(
            model: _model.mensajeResultadoViolentometroModel,
            updateCallback: () => safeSetState(() {}),
            child: MensajeResultadoViolentometroWidget(),
          ),
        ),
      ),
    );
  }
}
