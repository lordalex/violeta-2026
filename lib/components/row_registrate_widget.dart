import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_registrate_model.dart';
export 'row_registrate_model.dart';

class RowRegistrateWidget extends StatefulWidget {
  const RowRegistrateWidget({super.key});

  @override
  State<RowRegistrateWidget> createState() => _RowRegistrateWidgetState();
}

class _RowRegistrateWidgetState extends State<RowRegistrateWidget> {
  late RowRegistrateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowRegistrateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            '¿No  estás registrada?',
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  font: GoogleFonts.raleway(
                    fontWeight: FontWeight.w800,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                  ),
                  color: Color(0xFF4B3425),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              RegistrationWidget.routeName,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                ),
              },
            );
          },
          child: Text(
            'Registrate',
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
      ].divide(SizedBox(width: 10.0)),
    );
  }
}
