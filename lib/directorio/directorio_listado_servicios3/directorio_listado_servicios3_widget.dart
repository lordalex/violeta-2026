import '/components/empty_widget.dart';
import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'directorio_listado_servicios3_model.dart';
export 'directorio_listado_servicios3_model.dart';

class DirectorioListadoServicios3Widget extends StatefulWidget {
  const DirectorioListadoServicios3Widget({
    super.key,
    required this.url,
    required this.municipio,
  });

  final String? url;
  final String? municipio;

  static String routeName = 'directorioListadoServicios3';
  static String routePath = '/directorioListadoServicios3';

  @override
  State<DirectorioListadoServicios3Widget> createState() =>
      _DirectorioListadoServicios3WidgetState();
}

class _DirectorioListadoServicios3WidgetState
    extends State<DirectorioListadoServicios3Widget>
    with TickerProviderStateMixin {
  late DirectorioListadoServicios3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DirectorioListadoServicios3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fileContent = await actions.getHTMLfromURL(
        widget.url!,
      );
      _model.dirFileNameList = functions
          .findallkeys('servicio_ofrecido', _model.fileContent!)
          .toList()
          .cast<String>();
      safeSetState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.buscarTextController ??= TextEditingController();
    _model.buscarFocusNode ??= FocusNode();
    _model.buscarFocusNode!.addListener(
      () async {
        FFAppState().update(() {});
      },
    );
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
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

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 23.0),
                  child: TextFormField(
                    controller: _model.buscarTextController,
                    focusNode: _model.buscarFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.buscarTextController',
                      Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    autofocus: false,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.raleway(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      hintText: 'Buscar',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.raleway(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (_model.buscarFocusNode?.hasFocus ?? false) ==
                                  null
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).secondaryText,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF20505),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF20505),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).tertiary,
                      prefixIcon: Icon(
                        Icons.manage_search,
                        color: Color(0xFFE91E63),
                        size: 25.0,
                      ),
                      suffixIcon: _model.buscarTextController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.buscarTextController?.clear();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFFE91E63),
                                size: 25.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    cursorColor: Color(0xFFD44973),
                    validator: _model.buscarTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      if (!isAndroid && !isiOS)
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return TextEditingValue(
                            selection: newValue.selection,
                            text: newValue.text
                                .toCapitalization(TextCapitalization.words),
                          );
                        }),
                    ],
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.673,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 5.0),
                        child: Builder(
                          builder: (context) {
                            final fileNames = _model.dirFileNameList.toList();
                            if (fileNames.isEmpty) {
                              return EmptyWidget();
                            }

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(fileNames.length,
                                    (fileNamesIndex) {
                                  final fileNamesItem =
                                      fileNames[fileNamesIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 3.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  CriteriosBusqueda4Widget
                                                      .routeName,
                                                  queryParameters: {
                                                    'fileString':
                                                        serializeParam(
                                                      widget.url,
                                                      ParamType.String,
                                                    ),
                                                    'municipio': serializeParam(
                                                      widget.municipio,
                                                      ParamType.String,
                                                    ),
                                                    'servicio': serializeParam(
                                                      functions
                                                          .getkeyvaluestring(
                                                              fileNamesItem,
                                                              'name'),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                child: ListTile(
                                                  title: Text(
                                                    functions.getkeyvaluestring(
                                                        fileNamesItem, 'name'),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          fontSize: 19.5,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLargeIsCustom,
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    functions.getkeyvaluestring(
                                                        fileNamesItem, 'name'),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMediumIsCustom,
                                                        ),
                                                  ),
                                                  trailing: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    color: Color(0x5757636C),
                                                    size: 20.0,
                                                  ),
                                                  dense: false,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              12.0, 0.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).addToEnd(SizedBox(height: 75.0)),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation']!);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 175.0)),
            ),
          ),
          if ((isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible) ==
              false)
            wrapWithModel(
              model: _model.newNavigationBarModel,
              updateCallback: () => safeSetState(() {}),
              child: NewNavigationBarWidget(
                indexPages: 2,
              ),
            ),
          wrapWithModel(
            model: _model.newHeaderComponenteModel,
            updateCallback: () => safeSetState(() {}),
            child: NewHeaderComponenteWidget(
              title: 'Servicios disponibles',
              isBackButtonActivated: true,
            ),
          ),
        ],
      ),
    );
  }
}
