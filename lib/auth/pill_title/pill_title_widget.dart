import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pill_title_model.dart';
export 'pill_title_model.dart';

class PillTitleWidget extends StatefulWidget {
  const PillTitleWidget({super.key});

  @override
  State<PillTitleWidget> createState() => _PillTitleWidgetState();
}

class _PillTitleWidgetState extends State<PillTitleWidget> {
  late PillTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PillTitleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFC0CB),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Paso 1',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: Colors.black,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                ),
          ),
        ),
      ),
    );
  }
}
