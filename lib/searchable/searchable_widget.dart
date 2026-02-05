import '/components/empty_widget.dart';
import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'searchable_model.dart';
export 'searchable_model.dart';

class SearchableWidget extends StatefulWidget {
  const SearchableWidget({
    super.key,
    bool? settings,
  }) : this.settings = settings ?? true;

  final bool settings;

  static String routeName = 'searchable';
  static String routePath = '/searchable';

  @override
  State<SearchableWidget> createState() => _SearchableWidgetState();
}

class _SearchableWidgetState extends State<SearchableWidget>
    with TickerProviderStateMixin {
  late SearchableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchableModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.contactL = await actions.contacts();
          _model.contactListHold = functions
              .extractAndConcatenateProperties(
                  _model.contactL!.toList(), _model.properties.toList(), ' / ')
              .toList()
              .cast<String>();
          _model.contactListPhones = functions
              .extractAndConcatenateProperties(
                  _model.contactL!.toList(), _model.propertiesV.toList(), '')
              .toList()
              .cast<String>();
          _model.contactList = _model.contactL!.toList().cast<String>();
          safeSetState(() {});
          _model.tempContactList = _model.contactL!.toList().cast<String>();
          safeSetState(() {});
        }),
      ]);
    });

    _model.buscarTextController ??= TextEditingController();
    _model.buscarFocusNode ??= FocusNode();
    _model.buscarFocusNode!.addListener(
      () async {
        _model.contactosoutputforprocv2 = await actions.contacts();
        _model.contactList = functions
            .filterArraySubstr(_model.contactosoutputforprocv2!.toList(),
                _model.buscarTextController.text)
            .toList()
            .cast<String>();
        safeSetState(() {});

        safeSetState(() {});
      },
    );
    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1090.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 1.0.ms,
            duration: 1090.0.ms,
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.newHeaderComponenteModel,
              updateCallback: () => safeSetState(() {}),
              child: NewHeaderComponenteWidget(
                title: 'Contacto de Emergencia',
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(23.0),
                        child: TextFormField(
                          controller: _model.buscarTextController,
                          focusNode: _model.buscarFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.buscarTextController',
                            Duration(milliseconds: 100),
                            () async {
                              _model.boolSearchLoaded = false;
                              _model.contactList = [];
                              safeSetState(() {});
                              if (_model.buscarTextController.text == '') {
                                _model.contactList = _model.tempContactList
                                    .toList()
                                    .cast<String>();
                                safeSetState(() {});
                              } else {
                                _model.contactosoutputforprocv =
                                    await actions.contacts();
                                _model.contactList = functions
                                    .filterArraySubstr(
                                        _model.contactosoutputforprocv!
                                            .toList(),
                                        _model.buscarTextController.text)
                                    .toList()
                                    .cast<String>();
                                safeSetState(() {});
                                await Future.delayed(
                                  Duration(
                                    milliseconds: 5000,
                                  ),
                                );
                                if ((_model.contactList.isNotEmpty) == true) {
                                  _model.boolSearchLoaded = false;
                                  _model.boolIsEmptySearch = false;
                                  safeSetState(() {});
                                } else {
                                  _model.boolSearchLoaded = true;
                                  _model.boolIsEmptySearch = true;
                                  safeSetState(() {});
                                }
                              }

                              safeSetState(() {});
                            },
                          ),
                          autofocus: true,
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
                                color: (_model.buscarFocusNode?.hasFocus ??
                                            false) ==
                                        null
                                    ? FlutterFlowTheme.of(context).error
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                            suffixIcon: _model
                                    .buscarTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.buscarTextController?.clear();
                                      _model.boolSearchLoaded = false;
                                      _model.contactList = [];
                                      safeSetState(() {});
                                      if (_model.buscarTextController.text ==
                                              '') {
                                        _model.contactList = _model
                                            .tempContactList
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                      } else {
                                        _model.contactosoutputforprocv =
                                            await actions.contacts();
                                        _model.contactList = functions
                                            .filterArraySubstr(
                                                _model.contactosoutputforprocv!
                                                    .toList(),
                                                _model
                                                    .buscarTextController.text)
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 5000,
                                          ),
                                        );
                                        if ((_model.contactList.isNotEmpty) ==
                                            true) {
                                          _model.boolSearchLoaded = false;
                                          _model.boolIsEmptySearch = false;
                                          safeSetState(() {});
                                        } else {
                                          _model.boolSearchLoaded = true;
                                          _model.boolIsEmptySearch = true;
                                          safeSetState(() {});
                                        }
                                      }

                                      safeSetState(() {});
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
                          style: FlutterFlowTheme.of(context)
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          cursorColor: Color(0xFFD44973),
                          validator: _model.buscarTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            if (!isAndroid && !isiOS)
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                return TextEditingValue(
                                  selection: newValue.selection,
                                  text: newValue.text.toCapitalization(
                                      TextCapitalization.words),
                                );
                              }),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Text(
                            'Contacto Seleccionado:',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: ListTile(
                              title: Text(
                                valueOrDefault<String>(
                                  functions.getkeyvaluestring(
                                                  FFAppState()
                                                      .ContactosDeEmergencia
                                                      .firstOrNull!,
                                                  'name') !=
                                              ''
                                      ? functions.getkeyvaluestring(
                                          FFAppState()
                                              .ContactosDeEmergencia
                                              .firstOrNull!,
                                          'name')
                                      : 'Seleccione contacto',
                                  'Seleccione contacto',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleLargeIsCustom,
                                    ),
                              ),
                              subtitle: Text(
                                functions.getkeyvaluestring(
                                    FFAppState()
                                        .ContactosDeEmergencia
                                        .firstOrNull!,
                                    'phoneNumber'),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.emergency_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                              dense: false,
                              contentPadding: EdgeInsets.all(14.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.355,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  if ((_model.contactList.isNotEmpty) == true)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final contactosHold = _model
                                              .contactList
                                              .toList()
                                              .take(85)
                                              .toList();

                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: List.generate(
                                                  contactosHold.length,
                                                  (contactosHoldIndex) {
                                                final contactosHoldItem =
                                                    contactosHold[
                                                        contactosHoldIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                      onTap: () async {
                                                        FFAppState()
                                                            .deleteContactosDeEmergencia();
                                                        FFAppState()
                                                            .ContactosDeEmergencia = [];

                                                        safeSetState(() {});
                                                        _model.contactosdemergencianuevodespuesdeinsercion =
                                                            await actions
                                                                .addContactTo(
                                                          contactosHoldItem,
                                                          FFAppState()
                                                              .ContactosDeEmergencia
                                                              .toList(),
                                                        );
                                                        FFAppState()
                                                                .ContactosDeEmergencia =
                                                            _model
                                                                .contactosdemergencianuevodespuesdeinsercion!
                                                                .toList()
                                                                .cast<String>();
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: ListTile(
                                                          title: Text(
                                                            functions
                                                                .getkeyvaluestring(
                                                                    contactosHoldItem,
                                                                    'name'),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                          ),
                                                          subtitle: Text(
                                                            functions.getkeyvaluestring(
                                                                functions.getkeyvaluestring(
                                                                    contactosHoldItem,
                                                                    'phoneNumber'),
                                                                'phoneNumber'),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                          trailing: Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: Color(
                                                                0x5157636C),
                                                            size: 22.0,
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          dense: false,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  if (((_model.contactList.isNotEmpty) ==
                                          false) &&
                                      !_model.boolSearchLoaded)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.circleNotch,
                                            color: Color(0xDDD04870),
                                            size: 50.0,
                                          ).animateOnPageLoad(animationsMap[
                                              'iconOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    ),
                                  if (_model.boolIsEmptySearch)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.emptyModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: EmptyWidget(),
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
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed:
                      (FFAppState().ContactosDeEmergencia.firstOrNull == ' '
                              ? true
                              : false)
                          ? null
                          : () async {
                              if (widget.settings) {
                                context.pushNamed(
                                  SettingsWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
                              } else {
                                context.pushNamed(
                                  PerfilUsuarioWidget.routeName,
                                  queryParameters: {
                                    'config': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );
                              }
                            },
                  text: '',
                  icon: Icon(
                    Icons.arrow_forward_outlined,
                    size: 35.0,
                  ),
                  options: FFButtonOptions(
                    width: 200.0,
                    height: 56.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(28.0),
                    disabledColor: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
