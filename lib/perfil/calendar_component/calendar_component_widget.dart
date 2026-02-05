import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'calendar_component_model.dart';
export 'calendar_component_model.dart';

class CalendarComponentWidget extends StatefulWidget {
  const CalendarComponentWidget({super.key});

  @override
  State<CalendarComponentWidget> createState() =>
      _CalendarComponentWidgetState();
}

class _CalendarComponentWidgetState extends State<CalendarComponentWidget> {
  late CalendarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarComponentModel());
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
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: custom_widgets.CustomClender(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.5,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 8.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(RegistrationWidget.routeName);
              },
            ),
          ),
        ),
      ],
    );
  }
}
