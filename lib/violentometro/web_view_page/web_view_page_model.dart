import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'web_view_page_widget.dart' show WebViewPageWidget;
import 'package:flutter/material.dart';

class WebViewPageModel extends FlutterFlowModel<WebViewPageWidget> {
  ///  Local state fields for this page.

  String htmlcontent = '  ';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHTMLfromURL] action in WebViewPage widget.
  String? htmlstring;
  // Model for newNavigationBar component.
  late NewNavigationBarModel newNavigationBarModel;
  // Model for NewHeaderComponente component.
  late NewHeaderComponenteModel newHeaderComponenteModel;

  @override
  void initState(BuildContext context) {
    newNavigationBarModel = createModel(context, () => NewNavigationBarModel());
    newHeaderComponenteModel =
        createModel(context, () => NewHeaderComponenteModel());
  }

  @override
  void dispose() {
    newNavigationBarModel.dispose();
    newHeaderComponenteModel.dispose();
  }
}
