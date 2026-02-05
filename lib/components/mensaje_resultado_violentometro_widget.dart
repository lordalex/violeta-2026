import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mensaje_resultado_violentometro_model.dart';
export 'mensaje_resultado_violentometro_model.dart';

class MensajeResultadoViolentometroWidget extends StatefulWidget {
  const MensajeResultadoViolentometroWidget({super.key});

  @override
  State<MensajeResultadoViolentometroWidget> createState() =>
      _MensajeResultadoViolentometroWidgetState();
}

class _MensajeResultadoViolentometroWidgetState
    extends State<MensajeResultadoViolentometroWidget> {
  late MensajeResultadoViolentometroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeResultadoViolentometroModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.5, 0.0, 0.0, 0.0),
      child: Text(
        'PELIGRO',
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.raleway(
                fontWeight: FontWeight.w800,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).tertiary,
              fontSize: 18.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w800,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
