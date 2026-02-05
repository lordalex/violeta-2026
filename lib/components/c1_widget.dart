import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'c1_model.dart';
export 'c1_model.dart';

class C1Widget extends StatefulWidget {
  const C1Widget({
    super.key,
    String? parameter2,
  }) : this.parameter2 = parameter2 ??
            'https://bripwlbmdjnkvlbsunvq.supabase.co/storage/v1/object/public/files/walktrough/home.png';

  final String parameter2;

  @override
  State<C1Widget> createState() => _C1WidgetState();
}

class _C1WidgetState extends State<C1Widget> {
  late C1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => C1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.parameter2,
              width: 394.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Hello World',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
        ),
      ],
    );
  }
}
