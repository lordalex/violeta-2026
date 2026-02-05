import '/auth/supabase_auth/auth_util.dart';
import '/components/emergency_page_exit_modal_widget.dart';
import '/components/new_header_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'emergency_button_page_model.dart';
export 'emergency_button_page_model.dart';

class EmergencyButtonPageWidget extends StatefulWidget {
  const EmergencyButtonPageWidget({super.key});

  static String routeName = 'EmergencyButtonPage';
  static String routePath = '/emergencyButtonPage';

  @override
  State<EmergencyButtonPageWidget> createState() =>
      _EmergencyButtonPageWidgetState();
}

class _EmergencyButtonPageWidgetState extends State<EmergencyButtonPageWidget>
    with TickerProviderStateMixin {
  late EmergencyButtonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergencyButtonPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.messageGetterA = await actions.getHTMLfromURL(
        'https://bripwlbmdjnkvlbsunvq.supabase.co/storage/v1/object/public/files//message_emergency.json',
      );
      HapticFeedback.heavyImpact();
      _model.locationFromGoogleMapV = await actions.locationgooglemaps();
      await actions.sendsmstocontacts(
        FFAppState().ContactosDeEmergencia.toList(),
        '${functions.getkeyvaluestring(_model.messageGetterA!, 'message')}${_model.locationFromGoogleMapV}',
      );
      await Future.wait([
        Future(() async {
          _model.instantTimer = InstantTimer.periodic(
            duration: Duration(milliseconds: 20000),
            callback: (timer) async {
              _model.locationFromGoogleMap3 =
                  await actions.locationgooglemaps();
              FFAppState().locationdata = _model.locationFromGoogleMap3!;
              safeSetState(() {});
              _model.sendlocationoutput = await actions.sendlocationtoapi(
                FFAppConstants.supbaseUrlLocation,
                FFAppConstants.supabaseKey,
                currentUserEmail,
                functions.getkeyvaluestring(
                    _model.locationFromGoogleMap3!, 'latitude'),
                functions.getkeyvaluestring(
                    _model.locationFromGoogleMap3!, 'longitude'),
                currentJwtToken,
              );
            },
            startImmediately: true,
          );
        }),
      ]);
      _model.messageGetter = await actions.getHTMLfromURL(
        'https://bripwlbmdjnkvlbsunvq.supabase.co/storage/v1/object/public/files//message_emergency.json',
      );
      HapticFeedback.heavyImpact();
      unawaited(
        () async {
          await actions.sendsmstocontacts(
            FFAppState().ContactosDeEmergencia.toList(),
            functions.getkeyvaluestring(_model.messageGetter!, 'message'),
          );
        }(),
      );
      if (isiOS) {
        await launchUrl(Uri.parse(
            "sms:${functions.getkeyvaluestring(FFAppState().ContactosDeEmergencia.firstOrNull!, 'phoneNumber')}&body=${Uri.encodeComponent('${functions.getkeyvaluestring(_model.messageGetter!, 'message')}${_model.locationFromGoogleMap3}')}"));
      } else {
        await launchUrl(Uri(
          scheme: 'sms',
          path: functions.getkeyvaluestring(
              FFAppState().ContactosDeEmergencia.firstOrNull!, 'phoneNumber'),
          queryParameters: <String, String>{
            'body':
                '${functions.getkeyvaluestring(_model.messageGetter!, 'message')}${_model.locationFromGoogleMap3}',
          },
        ));
      }

      unawaited(
        () async {
          await actions.sendsmstocontacts(
            FFAppState().ContactosDeEmergencia.toList(),
            functions.getkeyvaluestring(_model.messageGetter!, 'message'),
          );
        }(),
      );
      if (isiOS) {
        await launchUrl(Uri.parse(
            "sms:${functions.getkeyvaluestring(FFAppState().ContactosDeEmergencia.firstOrNull!, 'phoneNumber')}&body=${Uri.encodeComponent('${functions.getkeyvaluestring(_model.messageGetter!, 'message')}${_model.locationFromGoogleMap3}')}"));
      } else {
        await launchUrl(Uri(
          scheme: 'sms',
          path: functions.getkeyvaluestring(
              FFAppState().ContactosDeEmergencia.firstOrNull!, 'phoneNumber'),
          queryParameters: <String, String>{
            'body':
                '${functions.getkeyvaluestring(_model.messageGetter!, 'message')}${_model.locationFromGoogleMap3}',
          },
        ));
      }
    });

    animationsMap.addAll({
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.85, 0.85),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.85, 0.85),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'stackOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.78, 0.78),
            end: Offset(1.0, 1.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1800.0.ms,
            duration: 800.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.78, 0.78),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF60102D),
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                11.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.info_outlined,
                              color: Color(0x9D200030),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  11.0, 8.0, 15.0, 8.0),
                              child: Text(
                                'Este botón de emergencia alertará a tu contacto de confianza y le enviará tu ubicación constantemente.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (isiOS) {
                          await launchUrl(Uri.parse(
                              "sms:${functions.getkeyvaluestring(FFAppState().ContactosDeEmergencia.firstOrNull!, 'phoneNumber')}&body=${Uri.encodeComponent('${functions.getkeyvaluestring(_model.messageGetter!, 'message')}${_model.locationFromGoogleMap3}')}"));
                        } else {
                          await launchUrl(Uri(
                            scheme: 'sms',
                            path: functions.getkeyvaluestring(
                                FFAppState().ContactosDeEmergencia.firstOrNull!,
                                'phoneNumber'),
                            queryParameters: <String, String>{
                              'body':
                                  '${functions.getkeyvaluestring(_model.messageGetter!, 'message')}${_model.locationFromGoogleMap3}',
                            },
                          ));
                        }
                      },
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x2DE0E3E7),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  width: 220.0,
                                  height: 220.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Opacity(
                                    opacity: 0.9,
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(11.0),
                                        child: Container(
                                          width: 220.0,
                                          height: 220.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFC40037),
                                                FlutterFlowTheme.of(context)
                                                    .secondary
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/warning.png',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        .animateOnPageLoad(
                            animationsMap['stackOnPageLoadAnimation']!)
                        .animateOnActionTrigger(
                          animationsMap['stackOnActionTriggerAnimation']!,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 2.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: '911',
                          ));
                        },
                        text: 'LLAMAR 911',
                        icon: Icon(
                          Icons.emergency_sharp,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Color(0x6F200030),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Contacto de emergencia:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                SearchableWidget.routeName,
                                queryParameters: {
                                  'settings': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Material(
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
                                        : 'Agregue un contacto',
                                    'Agregue un contacto',
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 9.0, 15.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: EmergencyPageExitModalWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 200.0,
                            decoration: BoxDecoration(
                              color: Color(0x74200030),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'SALIR DE MODO PÁNICO',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 175.0))
                    .addToEnd(SizedBox(height: 50.0)),
              ),
            ),
            wrapWithModel(
              model: _model.newHeaderComponenteModel,
              updateCallback: () => safeSetState(() {}),
              child: NewHeaderComponenteWidget(
                title: 'Botón de Pánico',
                isBackButtonActivated: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
