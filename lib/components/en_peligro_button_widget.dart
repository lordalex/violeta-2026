import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'en_peligro_button_model.dart';
export 'en_peligro_button_model.dart';

class EnPeligroButtonWidget extends StatefulWidget {
  const EnPeligroButtonWidget({super.key});

  @override
  State<EnPeligroButtonWidget> createState() => _EnPeligroButtonWidgetState();
}

class _EnPeligroButtonWidgetState extends State<EnPeligroButtonWidget> {
  late EnPeligroButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnPeligroButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderRadius: 10.0,
      buttonSize: 50.0,
      icon: Icon(
        Icons.location_pin,
        color: FlutterFlowTheme.of(context).tertiary,
        size: 32.0,
      ),
      onPressed: () {
        print('EnPeligro pressed ...');
      },
    );
  }
}
