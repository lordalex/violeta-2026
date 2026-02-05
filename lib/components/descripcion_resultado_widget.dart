import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'descripcion_resultado_model.dart';
export 'descripcion_resultado_model.dart';

class DescripcionResultadoWidget extends StatefulWidget {
  const DescripcionResultadoWidget({super.key});

  @override
  State<DescripcionResultadoWidget> createState() =>
      _DescripcionResultadoWidgetState();
}

class _DescripcionResultadoWidgetState
    extends State<DescripcionResultadoWidget> {
  late DescripcionResultadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescripcionResultadoModel());
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
      child: Text(
        '',
        textAlign: TextAlign.justify,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.raleway(
                fontWeight: FontWeight.w800,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: Color(0xFF260033),
              fontSize: 22.5,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w800,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
