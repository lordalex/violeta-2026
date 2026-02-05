import '/components/waitforemail_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'wait_for_email_confirmation_model.dart';
export 'wait_for_email_confirmation_model.dart';

class WaitForEmailConfirmationWidget extends StatefulWidget {
  const WaitForEmailConfirmationWidget({super.key});

  static String routeName = 'WaitForEmailConfirmation';
  static String routePath = '/waitForEmailConfirmation';

  @override
  State<WaitForEmailConfirmationWidget> createState() =>
      _WaitForEmailConfirmationWidgetState();
}

class _WaitForEmailConfirmationWidgetState
    extends State<WaitForEmailConfirmationWidget> {
  late WaitForEmailConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitForEmailConfirmationModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF7F4F2),
        body: wrapWithModel(
          model: _model.waitforemailModel,
          updateCallback: () => safeSetState(() {}),
          child: WaitforemailWidget(),
        ),
      ),
    );
  }
}
