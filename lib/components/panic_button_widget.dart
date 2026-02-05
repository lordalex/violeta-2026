import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'panic_button_model.dart';
export 'panic_button_model.dart';

class PanicButtonWidget extends StatefulWidget {
  const PanicButtonWidget({super.key});

  @override
  State<PanicButtonWidget> createState() => _PanicButtonWidgetState();
}

class _PanicButtonWidgetState extends State<PanicButtonWidget> {
  late PanicButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanicButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          shape: BoxShape.circle,
        ),
        child: FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).tertiary,
          borderRadius: 40.0,
          buttonSize: 70.0,
          fillColor: FlutterFlowTheme.of(context).tertiary,
          icon: FaIcon(
            FontAwesomeIcons.exclamation,
            color: FlutterFlowTheme.of(context).secondary,
            size: 50.0,
          ),
          onPressed: () async {
            _model.resultadosms = await actions.sendsmstocontacts(
              FFAppState().ContactosDeEmergencia.toList(),
              '-----',
            );
            FFAppState().errores = _model.resultadosms!.toList().cast<String>();
            safeSetState(() {});

            safeSetState(() {});
          },
        ),
      ),
    );
  }
}
