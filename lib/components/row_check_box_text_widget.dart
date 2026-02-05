import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_check_box_text_model.dart';
export 'row_check_box_text_model.dart';

class RowCheckBoxTextWidget extends StatefulWidget {
  const RowCheckBoxTextWidget({super.key});

  @override
  State<RowCheckBoxTextWidget> createState() => _RowCheckBoxTextWidgetState();
}

class _RowCheckBoxTextWidgetState extends State<RowCheckBoxTextWidget> {
  late RowCheckBoxTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowCheckBoxTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
            ),
            child: Checkbox(
              value: _model.checkboxValue ??= false,
              onChanged: (newValue) async {
                safeSetState(() => _model.checkboxValue = newValue!);
              },
              side: (FlutterFlowTheme.of(context).alternate != null)
                  ? BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).alternate,
                    )
                  : null,
              activeColor: FlutterFlowTheme.of(context).primary,
              checkColor: FlutterFlowTheme.of(context).info,
            ),
          ),
          Text(
            'Estoy de acuerdo con los',
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
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await launchURL(
                  'https://docs.flutterflow.io/concepts/navigation/launch-url/#open-a-webpage');
            },
            child: Text(
              'Términos',
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
        ].divide(SizedBox(width: 8.0)),
      ),
    );
  }
}
