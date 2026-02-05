import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'opciones_violentometro_model.dart';
export 'opciones_violentometro_model.dart';

class OpcionesViolentometroWidget extends StatefulWidget {
  const OpcionesViolentometroWidget({
    super.key,
    this.titulo,
  });

  final String? titulo;

  @override
  State<OpcionesViolentometroWidget> createState() =>
      _OpcionesViolentometroWidgetState();
}

class _OpcionesViolentometroWidgetState
    extends State<OpcionesViolentometroWidget> {
  late OpcionesViolentometroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpcionesViolentometroModel());
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
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 2.5, 5.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget.titulo,
            'Titulo',
          ),
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
      ),
    );
  }
}
