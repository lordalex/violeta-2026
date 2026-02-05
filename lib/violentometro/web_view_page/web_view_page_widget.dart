import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'web_view_page_model.dart';
export 'web_view_page_model.dart';

class WebViewPageWidget extends StatefulWidget {
  const WebViewPageWidget({
    super.key,
    required this.url,
  });

  final String? url;

  static String routeName = 'WebViewPage';
  static String routePath = '/webViewPage';

  @override
  State<WebViewPageWidget> createState() => _WebViewPageWidgetState();
}

class _WebViewPageWidgetState extends State<WebViewPageWidget> {
  late WebViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebViewPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.htmlstring = await actions.getHTMLfromURL(
        widget.url!,
      );
      _model.htmlcontent = _model.htmlstring!;
      safeSetState(() {});
    });
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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.747,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: FlutterFlowWebView(
                            content: _model.htmlcontent,
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            height: MediaQuery.sizeOf(context).height * 0.662,
                            verticalScroll: true,
                            horizontalScroll: false,
                            html: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 165.0)),
            ),
            if (false)
              wrapWithModel(
                model: _model.newNavigationBarModel,
                updateCallback: () => safeSetState(() {}),
                child: NewNavigationBarWidget(),
              ),
            wrapWithModel(
              model: _model.newHeaderComponenteModel,
              updateCallback: () => safeSetState(() {}),
              child: NewHeaderComponenteWidget(
                title: 'Artículo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
