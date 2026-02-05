import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/components/respuestas_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cuestionario_interactivo_model.dart';
export 'cuestionario_interactivo_model.dart';

class CuestionarioInteractivoWidget extends StatefulWidget {
  const CuestionarioInteractivoWidget({
    super.key,
    required this.url,
  });

  final String? url;

  static String routeName = 'CuestionarioInteractivo';
  static String routePath = '/cuestionarioInteractivo';

  @override
  State<CuestionarioInteractivoWidget> createState() =>
      _CuestionarioInteractivoWidgetState();
}

class _CuestionarioInteractivoWidgetState
    extends State<CuestionarioInteractivoWidget> with TickerProviderStateMixin {
  late CuestionarioInteractivoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuestionarioInteractivoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.cuestionarioresultado = await actions.getHTMLfromURL(
        widget.url!,
      );
      _model.cuestionariorows = functions
          .makearrayfromstr(_model.cuestionarioresultado!)
          .toList()
          .cast<String>();
      safeSetState(() {});
      _model.cuestionariorows = functions
          .getkeyvaluestringarray(_model.cuestionarioData, 'questions')
          .toList()
          .cast<String>();
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.newHeaderComponenteModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NewHeaderComponenteWidget(
                      title: 'Orientaciones legales',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 597.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F4F2),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(7.5, 0.0, 7.5, 0.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(-1.0, 0),
                            child: TabBar(
                              labelColor: Color(0xFF260033),
                              unselectedLabelColor: Color(0xFFC91C50),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.raleway(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleMediumIsCustom,
                                  ),
                              indicatorColor: Color(0xFF260033),
                              indicatorWeight: 2.5,
                              tabs: [
                                Tab(
                                  text: 'Info',
                                ),
                                Tab(
                                  text: 'Preguntas',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 713.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 0.0),
                                          child: AutoSizeText(
                                            functions.getkeyvaluestring(
                                                _model.cuestionarioData,
                                                'descripcion'),
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.raleway(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF260033),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final quiz =
                                          _model.cuestionariorows.toList();

                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Stack(
                                          children: [
                                            PageView.builder(
                                              controller:
                                                  _model.pageViewController ??=
                                                      PageController(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  quiz.length -
                                                                      1))),
                                              onPageChanged: (_) =>
                                                  safeSetState(() {}),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: quiz.length,
                                              itemBuilder:
                                                  (context, quizIndex) {
                                                final quizItem =
                                                    quiz[quizIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child:
                                                      RespuestasComponentWidget(
                                                    key: Key(
                                                        'Key3ua_${quizIndex}_of_${quiz.length}'),
                                                    nLista: quizIndex,
                                                    preguntaLista: functions
                                                        .getkeyvaluestring(
                                                            quizItem,
                                                            'enunciado'),
                                                    respuestaCorrecta: functions
                                                        .getquestionaireCorrect(
                                                            quizItem),
                                                    respuestas: functions
                                                        .getkeyvaluestringarray(
                                                            quizItem,
                                                            'opciones'),
                                                  ),
                                                );
                                              },
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  quiz.length -
                                                                      1))),
                                                  count: quiz.length,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) async {
                                                    await _model
                                                        .pageViewController!
                                                        .animateToPage(
                                                      i,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  effect: smooth_page_indicator
                                                      .SlideEffect(
                                                    spacing: 8.0,
                                                    radius: 8.0,
                                                    dotWidth: 8.0,
                                                    dotHeight: 8.0,
                                                    dotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    paintStyle:
                                                        PaintingStyle.stroke,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          wrapWithModel(
            model: _model.newNavigationBarModel,
            updateCallback: () => safeSetState(() {}),
            child: NewNavigationBarWidget(),
          ),
        ],
      ),
    );
  }
}
