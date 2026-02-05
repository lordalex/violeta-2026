import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'interactive_content_button_model.dart';
export 'interactive_content_button_model.dart';

class InteractiveContentButtonWidget extends StatefulWidget {
  const InteractiveContentButtonWidget({super.key});

  @override
  State<InteractiveContentButtonWidget> createState() =>
      _InteractiveContentButtonWidgetState();
}

class _InteractiveContentButtonWidgetState
    extends State<InteractiveContentButtonWidget> {
  late InteractiveContentButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InteractiveContentButtonModel());
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
        Icons.phone,
        color: FlutterFlowTheme.of(context).tertiary,
        size: 32.0,
      ),
      onPressed: () {
        print('InteractiveContentButton pressed ...');
      },
    );
  }
}
