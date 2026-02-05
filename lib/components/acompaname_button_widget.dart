import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'acompaname_button_model.dart';
export 'acompaname_button_model.dart';

class AcompanameButtonWidget extends StatefulWidget {
  const AcompanameButtonWidget({super.key});

  @override
  State<AcompanameButtonWidget> createState() => _AcompanameButtonWidgetState();
}

class _AcompanameButtonWidgetState extends State<AcompanameButtonWidget> {
  late AcompanameButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcompanameButtonModel());
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
        Icons.perm_contact_cal,
        color: FlutterFlowTheme.of(context).tertiary,
        size: 32.0,
      ),
      onPressed: () {
        print('Acompaname pressed ...');
      },
    );
  }
}
