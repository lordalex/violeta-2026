import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'violentometro_page_trivia_model.dart';
export 'violentometro_page_trivia_model.dart';

class ViolentometroPageTriviaWidget extends StatefulWidget {
  const ViolentometroPageTriviaWidget({
    super.key,
    required this.url,
    required this.type,
    required this.headerText,
  });

  final String? url;
  final String? type;
  final String? headerText;

  static String routeName = 'ViolentometroPageTrivia';
  static String routePath = '/violentometroPageTrivia';

  @override
  State<ViolentometroPageTriviaWidget> createState() =>
      _ViolentometroPageTriviaWidgetState();
}

class _ViolentometroPageTriviaWidgetState
    extends State<ViolentometroPageTriviaWidget> with TickerProviderStateMixin {
  late ViolentometroPageTriviaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViolentometroPageTriviaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          FFAppState().ruta = 'Violentometro';
          _model.contenidoInteractivo = await actions.getHTMLfromURL(
            widget.url!,
          );
          _model.contenido = _model.contenidoInteractivo!;
          safeSetState(() {});
          _model.mensajes =
              functions.getkeyvaluestring(_model.contenido, 'mensajes');
          safeSetState(() {});
          _model.imagenesValores =
              functions.getkeyvaluestring(_model.contenido, 'imagenes');
          safeSetState(() {});
          FFAppState().interactivoData = functions
              .getkeyvaluestringarray(_model.contenidoInteractivo!, 'questions')
              .toList()
              .cast<String>();
          _model.collationData = functions.collateJsonString(
              _model.contenidoInteractivo!,
              functions.makearrayfromstr('[]').toList(),
              '');
          safeSetState(() {});
          _model.diccionario = functions.getkeyvaluestring(
              _model.contenidoInteractivo!, 'diccionario');
          safeSetState(() {});
          _model.imagenes =
              functions.getkeyvaluestring(_model.contenido, 'imagenes');
          safeSetState(() {});
          if ((widget.url != null && widget.url != '') &&
              (widget.type != null && widget.type != '')) {
            _model.urlParam = widget.url;
            _model.typeParam = widget.type;
            safeSetState(() {});
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.newHeaderComponenteModel,
                updateCallback: () => safeSetState(() {}),
                child: NewHeaderComponenteWidget(
                  title: widget.headerText!,
                  isBackButtonActivated: true,
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.768,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (_) => safeSetState(() {}),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 14.0),
                                      child: FlutterFlowWebView(
                                        content: functions.getkeyvaluestring(
                                            _model.contenido, 'descripcion'),
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        verticalScroll: false,
                                        horizontalScroll: false,
                                        html: true,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 10.0, 25.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 15.0,
                                        buttonSize: 50.0,
                                        fillColor: Color(0xFFAE234D),
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 15.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 17.0, 0.0, 17.0),
                                      child: Text(
                                        'Responde las preguntas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF260033),
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.55,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final interactivoItems =
                                                      FFAppState()
                                                          .interactivoData
                                                          .toList();

                                                  return ListView.builder(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      60.0,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        interactivoItems.length,
                                                    itemBuilder: (context,
                                                        interactivoItemsIndex) {
                                                      final interactivoItemsItem =
                                                          interactivoItems[
                                                              interactivoItemsIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${(interactivoItemsIndex + 1).toString()}. ${functions.getkeyvaluestring(interactivoItemsItem, 'enunciado')}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  color: Color(
                                                                      0xFF260033),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLargeIsCustom,
                                                                ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final interactiveItems = functions
                                                                  .getkeyvaluestringarray(
                                                                      interactivoItemsItem,
                                                                      'opciones')
                                                                  .toList();

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    interactiveItems
                                                                        .length,
                                                                    (interactiveItemsIndex) {
                                                                  final interactiveItemsItem =
                                                                      interactiveItems[
                                                                          interactiveItemsIndex];
                                                                  return Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.selecciodos = functions.insertOverrideJson(
                                                                              _model.selecciodos,
                                                                              functions.getkeyvaluestring(interactivoItemsItem, 'enunciado'),
                                                                              interactiveItemsItem);
                                                                          if (widget.type ==
                                                                              'cuestionario') {
                                                                            _model.tempStr =
                                                                                functions.findallkeys(functions.getKeys(interactiveItemsItem).firstOrNull!, interactiveItemsItem).lastOrNull!;
                                                                            _model.seleccionadosValuesEnunciado = functions.insertOverrideJson(
                                                                                _model.seleccionadosValuesEnunciado,
                                                                                functions.getkeyvaluestring(interactivoItemsItem, 'enunciado'),
                                                                                _model.tempStr);
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            _model.globalString =
                                                                                functions.findHighestScoredPropertyStringOutput(_model.selecciodos, _model.diccionario);
                                                                            safeSetState(() {});
                                                                            _model.imagen =
                                                                                functions.getkeyvaluestring(_model.imagenes, functions.getkeyvaluestring(_model.globalString, 'key'));
                                                                            safeSetState(() {});
                                                                          }
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              ListTile(
                                                                            leading:
                                                                                Icon(
                                                                              Icons.square_rounded,
                                                                              size: 12.0,
                                                                            ),
                                                                            title:
                                                                                Text(
                                                                              functions.getKeys(interactiveItemsItem).firstOrNull!,
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                    fontSize: 15.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                  ),
                                                                            ),
                                                                            dense:
                                                                                true,
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                functions.getkeyvaluestring(_model.selecciodos, functions.getkeyvaluestring(interactivoItemsItem, 'enunciado')) == interactiveItemsItem,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                'https://picsum.photos/seed/463/600',
                                                                                width: 25.0,
                                                                                height: 25.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                          if (widget.type ==
                                                              'cuestionario')
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 55.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Visibility(
                                                                visible: functions.getkeyvaluestring(
                                                                            _model
                                                                                .selecciodos,
                                                                            functions.getkeyvaluestring(interactivoItemsItem,
                                                                                'enunciado')) !=
                                                                        '',
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions.getkeyvaluestring(
                                                                              _model.mensajes,
                                                                              functions.getkeyvaluestring(_model.seleccionadosValuesEnunciado, functions.getkeyvaluestring(interactivoItemsItem, 'enunciado'))),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            functions.strtoimagepath(functions.getkeyvaluestring(_model.imagenesValores,
                                                                                functions.getkeyvaluestring(_model.seleccionadosValuesEnunciado, functions.getkeyvaluestring(interactivoItemsItem, 'enunciado')))),
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                text: 'Ver resultados',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      functions.strtoimagepath(_model.imagen),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.58,
                                      fit: BoxFit.fill,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation']!),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 10.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 15.0,
                                        buttonSize: 54.0,
                                        fillColor: Color(0xFFAE234D),
                                        icon: FaIcon(
                                          FontAwesomeIcons.redoAlt,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          if ((widget.url != null &&
                                                  widget.url != '') &&
                                              (widget.type != null &&
                                                  widget.type != '')) {
                                            context.pushNamed(
                                              ViolentometroPageTriviaWidget
                                                  .routeName,
                                              queryParameters: {
                                                'url': serializeParam(
                                                  widget.url,
                                                  ParamType.String,
                                                ),
                                                'type': serializeParam(
                                                  widget.type,
                                                  ParamType.String,
                                                ),
                                                'headerText': serializeParam(
                                                  widget.headerText,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          } else {
                                            context.pushNamed(
                                              HomePageWidget.routeName,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                      ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
