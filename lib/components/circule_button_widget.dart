import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'circule_button_model.dart';
export 'circule_button_model.dart';

class CirculeButtonWidget extends StatefulWidget {
  const CirculeButtonWidget({super.key});

  @override
  State<CirculeButtonWidget> createState() => _CirculeButtonWidgetState();
}

class _CirculeButtonWidgetState extends State<CirculeButtonWidget> {
  late CirculeButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CirculeButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 25.0, 0.0),
        child: FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: '',
          icon: Icon(
            Icons.arrow_forward,
            size: 35.0,
          ),
          options: FFButtonOptions(
            width: 50.0,
            height: 50.0,
            padding: EdgeInsets.all(0.0),
            iconAlignment: IconAlignment.end,
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 250.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  color: Colors.white,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleSmallIsCustom,
                ),
            elevation: 5.0,
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
