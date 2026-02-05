import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ya_estas_registrado_model.dart';
export 'ya_estas_registrado_model.dart';

class YaEstasRegistradoWidget extends StatefulWidget {
  const YaEstasRegistradoWidget({super.key});

  @override
  State<YaEstasRegistradoWidget> createState() =>
      _YaEstasRegistradoWidgetState();
}

class _YaEstasRegistradoWidgetState extends State<YaEstasRegistradoWidget> {
  late YaEstasRegistradoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YaEstasRegistradoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿Ya estás registrada?',
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  font: GoogleFonts.raleway(
                    fontWeight: FontWeight.w800,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                  ),
                  color: Color(0xFF39004D),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(LoginPageWidget.routeName);
              },
              child: Text(
                'Iniciar sesión.',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.raleway(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                      ),
                      color: Color(0xFFE91E63),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ),
          ),
        ].divide(SizedBox(width: 4.0)),
      ),
    );
  }
}
