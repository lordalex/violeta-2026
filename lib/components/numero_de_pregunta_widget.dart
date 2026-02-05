import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'numero_de_pregunta_model.dart';
export 'numero_de_pregunta_model.dart';

class NumeroDePreguntaWidget extends StatefulWidget {
  const NumeroDePreguntaWidget({super.key});

  @override
  State<NumeroDePreguntaWidget> createState() => _NumeroDePreguntaWidgetState();
}

class _NumeroDePreguntaWidgetState extends State<NumeroDePreguntaWidget> {
  late NumeroDePreguntaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumeroDePreguntaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Container(
        width: 79.0,
        height: 79.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            '1',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: Color(0xFFC91C50),
                  fontSize: 22.5,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ),
      ),
    );
  }
}
