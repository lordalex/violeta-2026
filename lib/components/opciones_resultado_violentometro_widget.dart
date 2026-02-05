import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'opciones_resultado_violentometro_model.dart';
export 'opciones_resultado_violentometro_model.dart';

class OpcionesResultadoViolentometroWidget extends StatefulWidget {
  const OpcionesResultadoViolentometroWidget({
    super.key,
    String? textResultado,
  }) : this.textResultado = textResultado ?? 'Text';

  final String textResultado;

  @override
  State<OpcionesResultadoViolentometroWidget> createState() =>
      _OpcionesResultadoViolentometroWidgetState();
}

class _OpcionesResultadoViolentometroWidgetState
    extends State<OpcionesResultadoViolentometroWidget> {
  late OpcionesResultadoViolentometroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpcionesResultadoViolentometroModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
        child: Text(
          widget.textResultado,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).alternate,
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
      ),
    );
  }
}
