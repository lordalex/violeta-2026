import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'violentometro_page_model.dart';
export 'violentometro_page_model.dart';

class ViolentometroPageWidget extends StatefulWidget {
  const ViolentometroPageWidget({
    super.key,
    required this.url,
    required this.type,
  });

  final String? url;
  final String? type;

  static String routeName = 'ViolentometroPage';
  static String routePath = '/violentometroPage';

  @override
  State<ViolentometroPageWidget> createState() =>
      _ViolentometroPageWidgetState();
}

class _ViolentometroPageWidgetState extends State<ViolentometroPageWidget>
    with TickerProviderStateMixin {
  late ViolentometroPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViolentometroPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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
                  title: 'Violentómetro',
                  isBackButtonActivated: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.71,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F4F2),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                7.5, 0.0, 7.5, 0.0),
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                    indicatorColor: Color(0xFF260033),
                                    indicatorWeight: 2.5,
                                    padding: EdgeInsets.all(2.0),
                                    tabs: [
                                      Tab(
                                        text: 'Info',
                                      ),
                                      Tab(
                                        text: 'Preguntas',
                                      ),
                                      Tab(
                                        text: widget.type == 'cuestionario'
                                            ? ''
                                            : 'Resultados',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 556.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: FlutterFlowWebView(
                                                  content: functions
                                                      .getkeyvaluestring(
                                                          _model.contenido,
                                                          'descripcion'),
                                                  height: 500.0,
                                                  verticalScroll: false,
                                                  horizontalScroll: false,
                                                  html: true,
                                                ),
                                              ),
                                            ),
                                          ].addToEnd(SizedBox(height: 80.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final interactivoItems =
                                                      FFAppState()
                                                          .interactivoData
                                                          .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
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
                                                            functions.getkeyvaluestring(
                                                                interactivoItemsItem,
                                                                'enunciado'),
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
                                                                          .w600,
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

                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    interactiveItems
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        interactiveItemsIndex) {
                                                                  final interactiveItemsItem =
                                                                      interactiveItems[
                                                                          interactiveItemsIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.selecciodos = functions.insertOverrideJson(
                                                                          _model
                                                                              .selecciodos,
                                                                          functions.getkeyvaluestring(
                                                                              interactivoItemsItem,
                                                                              'enunciado'),
                                                                          interactiveItemsItem);
                                                                      if (widget
                                                                              .type ==
                                                                          'cuestionario') {
                                                                        _model.tempStr = functions
                                                                            .findallkeys(functions.getKeys(interactiveItemsItem).firstOrNull!,
                                                                                interactiveItemsItem)
                                                                            .lastOrNull!;
                                                                        _model.seleccionadosValuesEnunciado = functions.insertOverrideJson(
                                                                            _model
                                                                                .seleccionadosValuesEnunciado,
                                                                            functions.getkeyvaluestring(interactivoItemsItem,
                                                                                'enunciado'),
                                                                            _model.tempStr);
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.globalString = functions.findHighestScoredPropertyStringOutput(
                                                                            _model.selecciodos,
                                                                            _model.diccionario);
                                                                        safeSetState(
                                                                            () {});
                                                                        _model.imagen = functions.getkeyvaluestring(
                                                                            _model
                                                                                .imagenes,
                                                                            functions.getkeyvaluestring(_model.globalString,
                                                                                'key'));
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          ListTile(
                                                                        leading:
                                                                            Icon(
                                                                          Icons
                                                                              .square_rounded,
                                                                          size:
                                                                              12.0,
                                                                        ),
                                                                        title:
                                                                            Text(
                                                                          functions
                                                                              .getKeys(interactiveItemsItem)
                                                                              .firstOrNull!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                              ),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color: functions.getkeyvaluestring(_model.selecciodos, functions.getkeyvaluestring(interactivoItemsItem, 'enunciado')) == interactiveItemsItem
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : Color(0x0057636C),
                                                                          size:
                                                                              24.0,
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
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                functions.strtoimagepath(
                                                    _model.imagen),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.6,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
