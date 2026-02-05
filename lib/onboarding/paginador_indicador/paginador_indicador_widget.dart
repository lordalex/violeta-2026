import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'paginador_indicador_model.dart';
export 'paginador_indicador_model.dart';

/// create a dot pagination where each dot represents a page and changes color
/// when moving among pages pages.
class PaginadorIndicadorWidget extends StatefulWidget {
  const PaginadorIndicadorWidget({super.key});

  @override
  State<PaginadorIndicadorWidget> createState() =>
      _PaginadorIndicadorWidgetState();
}

class _PaginadorIndicadorWidgetState extends State<PaginadorIndicadorWidget> {
  late PaginadorIndicadorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginadorIndicadorModel());
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
        Container(
          width: 12.0,
          height: 12.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ].divide(SizedBox(width: 8.0)),
    );
  }
}
