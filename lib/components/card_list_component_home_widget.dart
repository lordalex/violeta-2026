import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'card_list_component_home_model.dart';
export 'card_list_component_home_model.dart';

class CardListComponentHomeWidget extends StatefulWidget {
  const CardListComponentHomeWidget({
    super.key,
    required this.json,
  });

  final String? json;

  @override
  State<CardListComponentHomeWidget> createState() =>
      _CardListComponentHomeWidgetState();
}

class _CardListComponentHomeWidgetState
    extends State<CardListComponentHomeWidget> {
  late CardListComponentHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardListComponentHomeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.imagePath = functions
          .strtoimagepath(functions.getkeyvaluestring(widget.json!, 'image'));
      safeSetState(() {});
      _model.title = functions.getkeyvaluestring(widget.json!, 'title');
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  _model.imagePath!,
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  fit: BoxFit.fill,
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                functions.getkeyvaluestring(_model.title, ''),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
