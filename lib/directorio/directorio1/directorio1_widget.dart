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
import 'package:text_search/text_search.dart';
import 'directorio1_model.dart';
export 'directorio1_model.dart';

class Directorio1Widget extends StatefulWidget {
  const Directorio1Widget({super.key});

  static String routeName = 'directorio1';
  static String routePath = '/directorio1';

  @override
  State<Directorio1Widget> createState() => _Directorio1WidgetState();
}

class _Directorio1WidgetState extends State<Directorio1Widget>
    with TickerProviderStateMixin {
  late Directorio1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Directorio1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.directorioIndex = await actions.getHTMLfromURL(
            'https://bripwlbmdjnkvlbsunvq.supabase.co/storage/v1/object/public/files/directorio.json',
          );
          _model.dirFileNameList = functions
              .getkeyvaluestringarray(_model.directorioIndex!, 'files')
              .toList()
              .cast<String>();
          safeSetState(() {});
          _model.baseURL =
              functions.getkeyvaluestring(_model.directorioIndex!, 'base_url');
          safeSetState(() {});
        }),
      ]);
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
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 23.0),
                child: TextFormField(
                  controller: _model.buscarTextController,
                  focusNode: _model.buscarFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.buscarTextController',
                    Duration(milliseconds: 150),
                    () async {
                      safeSetState(() {
                        _model.simpleSearchResults = TextSearch(
                                (_model.dirFileNameList as List)
                                    .cast<String>()
                                    .map((str) =>
                                        TextSearchItem.fromTerms(str, [str]))
                                    .toList())
                            .search(_model.buscarTextController.text)
                            .map((r) => r.object)
                            .toList();
                        ;
                      });
                      if (_model.buscarTextController.text != '') {
                        _model.isSearchOn = true;
                        safeSetState(() {});
                      } else {
                        _model.isSearchOn = false;
                        safeSetState(() {});
                      }
                    },
                  ),
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    hintText: 'Buscar',
                    hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
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
                              safeSetState(() {
                                _model.simpleSearchResults = TextSearch(
                                        (_model.dirFileNameList as List)
                                            .cast<String>()
                                            .map((str) =>
                                                TextSearchItem.fromTerms(
                                                    str, [str]))
                                            .toList())
                                    .search(_model.buscarTextController.text)
                                    .map((r) => r.object)
                                    .toList();
                                ;
                              });
                              if (_model.buscarTextController.text != '') {
                                _model.isSearchOn = true;
                                safeSetState(() {});
                              } else {
                                _model.isSearchOn = false;
                                safeSetState(() {});
                              }

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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  cursorColor: Color(0xFFD44973),
                  validator:
                      _model.buscarTextControllerValidator.asValidator(context),
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
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.673,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      if (!_model.isSearchOn)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 5.0),
                          child: Builder(
                            builder: (context) {
                              final fileNames = _model.dirFileNameList.toList();

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
                                                    DirectorioMunicipios2Widget
                                                        .routeName,
                                                    queryParameters: {
                                                      'url': serializeParam(
                                                        '${_model.baseURL}${functions.getkeyvaluestring(fileNamesItem, 'file')}',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: ListTile(
                                                    title: Text(
                                                      functions
                                                          .getkeyvaluestring(
                                                              fileNamesItem,
                                                              'name'),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeIsCustom,
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                indent: 15.0,
                                                endIndent: 15.0,
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
                      if (_model.isSearchOn)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 5.0),
                          child: Builder(
                            builder: (context) {
                              final fileNames =
                                  _model.simpleSearchResults.toList();

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
                                                    DirectorioMunicipios2Widget
                                                        .routeName,
                                                    queryParameters: {
                                                      'url': serializeParam(
                                                        '${_model.baseURL}${functions.getkeyvaluestring(fileNamesItem, 'file')}',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: ListTile(
                                                    title: Text(
                                                      functions
                                                          .getkeyvaluestring(
                                                              fileNamesItem,
                                                              'name'),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeIsCustom,
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                indent: 15.0,
                                                endIndent: 15.0,
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
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ].addToStart(SizedBox(height: 175.0)),
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
              title: 'Directorio',
            ),
          ),
        ],
      ),
    );
  }
}
