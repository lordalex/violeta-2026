import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_pregunta_model.dart';
export 'text_pregunta_model.dart';

class TextPreguntaWidget extends StatefulWidget {
  const TextPreguntaWidget({super.key});

  @override
  State<TextPreguntaWidget> createState() => _TextPreguntaWidgetState();
}

class _TextPreguntaWidgetState extends State<TextPreguntaWidget> {
  late TextPreguntaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextPreguntaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        '¿Te cela constantemente sin razón aparente?',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: Color(0xFF260033),
              fontSize: 16.5,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
