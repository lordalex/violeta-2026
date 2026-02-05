import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'modal_box_emergency_button_model.dart';
export 'modal_box_emergency_button_model.dart';

class ModalBoxEmergencyButtonWidget extends StatefulWidget {
  const ModalBoxEmergencyButtonWidget({super.key});

  @override
  State<ModalBoxEmergencyButtonWidget> createState() =>
      _ModalBoxEmergencyButtonWidgetState();
}

class _ModalBoxEmergencyButtonWidgetState
    extends State<ModalBoxEmergencyButtonWidget> {
  late ModalBoxEmergencyButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalBoxEmergencyButtonModel());
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
      child: Container(
        width: 244.1,
        height: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
