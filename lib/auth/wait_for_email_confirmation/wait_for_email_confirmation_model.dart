import '/components/waitforemail_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wait_for_email_confirmation_widget.dart'
    show WaitForEmailConfirmationWidget;
import 'package:flutter/material.dart';

class WaitForEmailConfirmationModel
    extends FlutterFlowModel<WaitForEmailConfirmationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for waitforemail component.
  late WaitforemailModel waitforemailModel;

  @override
  void initState(BuildContext context) {
    waitforemailModel = createModel(context, () => WaitforemailModel());
  }

  @override
  void dispose() {
    waitforemailModel.dispose();
  }
}
