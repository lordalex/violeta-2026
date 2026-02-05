import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'password_reset_model.dart';
export 'password_reset_model.dart';

class PasswordResetWidget extends StatefulWidget {
  const PasswordResetWidget({super.key});

  @override
  State<PasswordResetWidget> createState() => _PasswordResetWidgetState();
}

class _PasswordResetWidgetState extends State<PasswordResetWidget> {
  late PasswordResetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordResetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Olvidé mi contraseña',
      textAlign: TextAlign.center,
      style: FlutterFlowTheme.of(context).titleSmall.override(
            font: GoogleFonts.raleway(
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
            color: Color(0xFF4B3425),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
          ),
    );
  }
}
