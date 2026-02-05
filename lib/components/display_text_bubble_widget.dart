import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'display_text_bubble_model.dart';
export 'display_text_bubble_model.dart';

class DisplayTextBubbleWidget extends StatefulWidget {
  const DisplayTextBubbleWidget({
    super.key,
    required this.description,
  });

  final String? description;

  @override
  State<DisplayTextBubbleWidget> createState() =>
      _DisplayTextBubbleWidgetState();
}

class _DisplayTextBubbleWidgetState extends State<DisplayTextBubbleWidget> {
  late DisplayTextBubbleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayTextBubbleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        widget.description,
        'description here',
      ),
      textAlign: TextAlign.center,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            color: Color(0xFFFFBD1A),
            fontSize: 30.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.bold,
            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
          ),
    );
  }
}
