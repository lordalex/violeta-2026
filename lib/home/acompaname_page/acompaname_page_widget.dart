import '/auth/supabase_auth/auth_util.dart';
import '/components/acompaname_cancel_modal_widget.dart';
import '/components/new_header_componente_widget.dart';
import '/components/new_navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'acompaname_page_model.dart';
export 'acompaname_page_model.dart';

class AcompanamePageWidget extends StatefulWidget {
  const AcompanamePageWidget({
    super.key,
    this.timerMs,
  });

  final int? timerMs;

  static String routeName = 'AcompanamePage';
  static String routePath = '/acompanamePage';

  @override
  State<AcompanamePageWidget> createState() => _AcompanamePageWidgetState();
}

class _AcompanamePageWidgetState extends State<AcompanamePageWidget>
    with TickerProviderStateMixin {
  late AcompanamePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcompanamePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (FFAppState().integerTimerSelectorAcompaname != 0) {
            _model.integerTimerSelector =
                FFAppState().integerTimerSelectorAcompaname;
            _model.isTimerOn = true;
            safeSetState(() {});
          }
          if (FFAppState().sendinglocation) {
            _model.timerController.timer.setPresetTime(
              mSec: functions.currentTimerData(
                  FFAppState().startedDateTimeAcompaname!,
                  FFAppState().timeRangeSelectedInMsAcompaname),
              add: false,
            );
            _model.timerController.onResetTimer();

            _model.timerController.onStartTimer();
          }
        }),
      ]);
      if (FFAppState().sendinglocation) {
        // Acompañame AB
        _model.instantTimerVII = InstantTimer.periodic(
          duration: Duration(milliseconds: 10000),
          callback: (timer) async {
            if (FFAppState().counterAcompaname ==
                FFAppState().periodic30secondsTimerSelector) {
              _model.instantTimerVII?.cancel();
              FFAppState().sendinglocation = false;
              safeSetState(() {});
            } else {
              FFAppState().counterAcompaname =
                  FFAppState().counterAcompaname + 1;
              _model.locationFromGoogleMap23B =
                  await actions.locationgooglemaps();
              FFAppState().locationdata = _model.locationFromGoogleMap23B!;
              _model.sendlocationoutput = await actions.sendlocationtoapi(
                FFAppConstants.supbaseUrlLocation,
                FFAppConstants.supabaseKey,
                currentUserEmail,
                functions.getkeyvaluestring(
                    _model.locationFromGoogleMap23B!, 'latitude'),
                functions.getkeyvaluestring(
                    _model.locationFromGoogleMap23B!, 'longitude'),
                currentJwtToken,
              );
              FFAppState().sendinglocation = true;
              safeSetState(() {});
            }
          },
          startImmediately: true,
        );
      }
    });

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.3, 0.3),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
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
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 20.0),
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
                                '¡Usa el acompañame para compartir tu ubicación a tu contacto de emergencia constantemente por si te encuentras en una situación de emergencia!',
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().sendinglocation = true;
                        safeSetState(() {});
                        if (_model.integerTimerSelector == 0) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Selecciona un tiempo'),
                                  content: Text(
                                      '¡Debes seleccionar un tiempo para el acompañame!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          if (_model.isTimerOn) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AcompanameCancelModalWidget(
                                      actions: () async {
                                        _model.timerController.timer
                                            .setPresetTime(mSec: 0, add: false);
                                        _model.timerController.onResetTimer();

                                        FFAppState()
                                            .deleteStartedDateTimeAcompaname();
                                        FFAppState().startedDateTimeAcompaname =
                                            null;

                                        FFAppState().sendinglocation = false;
                                        safeSetState(() {});
                                        _model.isTimerOn = false;
                                        safeSetState(() {});
                                        HapticFeedback.heavyImpact();
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('Apagado'),
                                                content: Text(
                                                    'Acompañame ha sido apagado con exito'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            _model.messageGetterA =
                                await actions.getHTMLfromURL(
                              'https://bripwlbmdjnkvlbsunvq.supabase.co/storage/v1/object/public/files//message_emergency.json',
                            );
                            HapticFeedback.heavyImpact();
                            _model.locationFromGoogleMapV =
                                await actions.locationgooglemaps();
                            if (isiOS) {
                              await launchUrl(Uri.parse(
                                  "sms:${functions.getkeyvaluestring(FFAppState().ContactosDeEmergencia.firstOrNull!, 'phoneNumber')}&body=${Uri.encodeComponent('Acompáñame virtualmente durante este trayecto para sentirme más segura. Contáctame para verificar que llegué bien en ${_model.stringOfTimeRange}. Esta es mi ubicación actual: ${_model.locationFromGoogleMapV}')}"));
                            } else {
                              await launchUrl(Uri(
                                scheme: 'sms',
                                path: functions.getkeyvaluestring(
                                    FFAppState()
                                        .ContactosDeEmergencia
                                        .firstOrNull!,
                                    'phoneNumber'),
                                queryParameters: <String, String>{
                                  'body':
                                      'Acompáñame virtualmente durante este trayecto para sentirme más segura. Contáctame para verificar que llegué bien en ${_model.stringOfTimeRange}. Esta es mi ubicación actual: ${_model.locationFromGoogleMapV}',
                                },
                              ));
                            }

                            _model.timerController.onStartTimer();
                            HapticFeedback.heavyImpact();
                            FFAppState().startedDateTimeAcompaname =
                                getCurrentTimestamp;
                            FFAppState().integerTimerSelectorAcompaname =
                                _model.integerTimerSelector;
                            safeSetState(() {});
                            _model.isTimerOn = true;
                            safeSetState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '¡Acompáñame encendido con éxito!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            HapticFeedback.heavyImpact();
                            _model.instantTimerVIII = InstantTimer.periodic(
                              duration: Duration(milliseconds: 10000),
                              callback: (timer) async {
                                FFAppState().counterAcompaname =
                                    FFAppState().counterAcompaname + 1;
                                safeSetState(() {});
                                if (FFAppState().counterAcompaname ==
                                    FFAppState()
                                        .periodic30secondsTimerSelector) {
                                  _model.instantTimerVIII?.cancel();
                                  FFAppState().sendinglocation = false;
                                  safeSetState(() {});
                                } else {
                                  _model.sendlocationoutput1 =
                                      await actions.sendlocationtoapi(
                                    FFAppConstants.supbaseUrlLocation,
                                    FFAppConstants.supabaseKey,
                                    currentUserEmail,
                                    functions.getkeyvaluestring(
                                        _model.locationFromGoogleMap23B!,
                                        'latitude'),
                                    functions.getkeyvaluestring(
                                        _model.locationFromGoogleMap23B!,
                                        'longitude'),
                                    currentJwtToken,
                                  );
                                  FFAppState().sendinglocation = true;
                                  safeSetState(() {});
                                }
                              },
                              startImmediately: true,
                            );
                          }
                        }

                        safeSetState(() {});
                      },
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Container(
                                  width: 239.5,
                                  height: 239.5,
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
                                          width: 239.5,
                                          height: 239.5,
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
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FlutterFlowTimer(
                                              initialTime: valueOrDefault<int>(
                                                _model
                                                    .millisecondsTimerSelector,
                                                0,
                                              ),
                                              getDisplayTime: (value) =>
                                                  StopWatchTimer.getDisplayTime(
                                                      value,
                                                      milliSecond: false),
                                              controller:
                                                  _model.timerController,
                                              updateStateInterval:
                                                  Duration(milliseconds: 1000),
                                              onChanged: (value, displayTime,
                                                  shouldUpdate) {
                                                _model.timerMilliseconds =
                                                    value;
                                                _model.timerValue = displayTime;
                                                if (shouldUpdate)
                                                  safeSetState(() {});
                                              },
                                              onEnded: () async {
                                                FFAppState().locationdata = '';
                                                FFAppState()
                                                    .deleteStartedDateTimeAcompaname();
                                                FFAppState()
                                                        .startedDateTimeAcompaname =
                                                    null;

                                                FFAppState()
                                                    .deleteTimeRangeSelectedInMsAcompaname();
                                                FFAppState()
                                                    .timeRangeSelectedInMsAcompaname = 0;

                                                FFAppState()
                                                    .deleteIntegerTimerSelectorAcompaname();
                                                FFAppState()
                                                    .integerTimerSelectorAcompaname = 0;

                                                FFAppState()
                                                    .deleteCounterAcompaname();
                                                FFAppState().counterAcompaname =
                                                    0;

                                                FFAppState()
                                                    .deletePeriodic30secondsTimerSelector();
                                                FFAppState()
                                                    .periodic30secondsTimerSelector = 0;

                                                FFAppState().sendinglocation =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily,
                                                    color: Color(0xD7F1F4F8),
                                                    fontSize: 40.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmallIsCustom,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 139.0, 0.0, 0.0),
                            child: Stack(
                              children: [
                                if (_model.isTimerOn)
                                  FlutterFlowIconButton(
                                    borderRadius: 25.0,
                                    fillColor: Color(0x4621010B),
                                    icon: Icon(
                                      Icons.location_pin,
                                      color: Color(0xD7FFFFFF),
                                      size: 32.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  AcompanameCancelModalWidget(
                                                actions: () async {
                                                  _model.timerController.timer
                                                      .setPresetTime(
                                                          mSec: 0, add: false);
                                                  _model.timerController
                                                      .onResetTimer();

                                                  FFAppState()
                                                      .deleteStartedDateTimeAcompaname();
                                                  FFAppState()
                                                          .startedDateTimeAcompaname =
                                                      null;

                                                  FFAppState().sendinglocation =
                                                      false;
                                                  safeSetState(() {});
                                                  _model.isTimerOn = false;
                                                  _model.integerTimerSelector =
                                                      0;
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title:
                                                              Text('Apagado'),
                                                          content: Text(
                                                              'Acompañame ha sido apagado con exito'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                if (!_model.isTimerOn)
                                  FlutterFlowIconButton(
                                    borderRadius: 25.0,
                                    fillColor: Color(0x4621010B),
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Color(0xD7FFFFFF),
                                      size: 32.0,
                                    ),
                                    onPressed: loggedIn
                                        ? null
                                        : () {
                                            print('StartButton pressed ...');
                                          },
                                  ),
                              ],
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 12.0),
                          child: Text(
                            'Acompáñame durante',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.isTimerOn) {
                                    return;
                                  }

                                  if (_model.integerTimerSelector == 1) {
                                    _model.integerTimerSelector = 0;
                                    _model.stringOfTimeRange = null;
                                    safeSetState(() {});
                                    FFAppState()
                                        .deletePeriodic30secondsTimerSelector();
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 0;

                                    safeSetState(() {});
                                    _model.timerController.timer
                                        .setPresetTime(mSec: 0, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                        .deleteTimeRangeSelectedInMsAcompaname();
                                    FFAppState()
                                        .timeRangeSelectedInMsAcompaname = 0;

                                    safeSetState(() {});
                                  } else {
                                    _model.integerTimerSelector = 1;
                                    _model.stringOfTimeRange = '30 minutos';
                                    safeSetState(() {});
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 60;
                                    safeSetState(() {});
                                    _model.timerController.timer.setPresetTime(
                                        mSec: 1800000, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                            .timeRangeSelectedInMsAcompaname =
                                        1800000;
                                    safeSetState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xC8200030),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.integerTimerSelector == 1
                                            ? Color(0xC9D04870)
                                            : Colors.transparent,
                                        Colors.transparent,
                                      ),
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 9.0, 10.0, 9.0),
                                      child: Text(
                                        '30 minutos',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.isTimerOn) {
                                    return;
                                  }

                                  if (_model.integerTimerSelector == 2) {
                                    _model.integerTimerSelector = 0;
                                    _model.stringOfTimeRange = null;
                                    safeSetState(() {});
                                    FFAppState()
                                        .deletePeriodic30secondsTimerSelector();
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 0;

                                    safeSetState(() {});
                                    _model.timerController.timer
                                        .setPresetTime(mSec: 0, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                        .deleteTimeRangeSelectedInMsAcompaname();
                                    FFAppState()
                                        .timeRangeSelectedInMsAcompaname = 0;

                                    safeSetState(() {});
                                  } else {
                                    _model.integerTimerSelector = 2;
                                    _model.stringOfTimeRange = '1 hora';
                                    safeSetState(() {});
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 120;
                                    safeSetState(() {});
                                    _model.timerController.timer.setPresetTime(
                                        mSec: 3600000, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                            .timeRangeSelectedInMsAcompaname =
                                        3600000;
                                    safeSetState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xC8200030),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.integerTimerSelector == 2
                                            ? Color(0xC9D04870)
                                            : Colors.transparent,
                                        Colors.transparent,
                                      ),
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 9.0, 15.0, 9.0),
                                      child: Text(
                                        '1 hora',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.isTimerOn) {
                                    return;
                                  }

                                  if (_model.integerTimerSelector == 3) {
                                    _model.integerTimerSelector = 0;
                                    _model.stringOfTimeRange = null;
                                    safeSetState(() {});
                                    FFAppState()
                                        .deletePeriodic30secondsTimerSelector();
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 0;

                                    safeSetState(() {});
                                    _model.timerController.timer
                                        .setPresetTime(mSec: 0, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                        .deleteTimeRangeSelectedInMsAcompaname();
                                    FFAppState()
                                        .timeRangeSelectedInMsAcompaname = 0;

                                    safeSetState(() {});
                                  } else {
                                    _model.integerTimerSelector = 3;
                                    _model.stringOfTimeRange = '2 horas';
                                    safeSetState(() {});
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 240;
                                    safeSetState(() {});
                                    _model.timerController.timer.setPresetTime(
                                        mSec: 7200000, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                            .timeRangeSelectedInMsAcompaname =
                                        7200000;
                                    safeSetState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xC8200030),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.integerTimerSelector == 3
                                            ? Color(0xC9D04870)
                                            : Colors.transparent,
                                        Colors.transparent,
                                      ),
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 9.0, 15.0, 9.0),
                                      child: Text(
                                        '2 horas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.isTimerOn) {
                                    return;
                                  }

                                  if (_model.integerTimerSelector == 4) {
                                    _model.integerTimerSelector = 0;
                                    _model.stringOfTimeRange = null;
                                    safeSetState(() {});
                                    FFAppState()
                                        .deletePeriodic30secondsTimerSelector();
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 0;

                                    safeSetState(() {});
                                    _model.timerController.timer
                                        .setPresetTime(mSec: 0, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                        .deleteTimeRangeSelectedInMsAcompaname();
                                    FFAppState()
                                        .timeRangeSelectedInMsAcompaname = 0;

                                    safeSetState(() {});
                                  } else {
                                    _model.integerTimerSelector = 4;
                                    _model.stringOfTimeRange = '4 horas';
                                    safeSetState(() {});
                                    FFAppState()
                                        .periodic30secondsTimerSelector = 480;
                                    safeSetState(() {});
                                    _model.timerController.timer.setPresetTime(
                                        mSec: 14400000, add: false);
                                    _model.timerController.onResetTimer();

                                    FFAppState()
                                            .timeRangeSelectedInMsAcompaname =
                                        14400000;
                                    safeSetState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xC8200030),
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.integerTimerSelector == 4
                                            ? Color(0xC9D04870)
                                            : Colors.transparent,
                                        Colors.transparent,
                                      ),
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 9.0, 15.0, 9.0),
                                      child: Text(
                                        '4 horas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 175.0))
                    .addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
          if (loggedIn)
            wrapWithModel(
              model: _model.newNavigationBarModel,
              updateCallback: () => safeSetState(() {}),
              child: NewNavigationBarWidget(),
            ),
          wrapWithModel(
            model: _model.newHeaderComponenteModel,
            updateCallback: () => safeSetState(() {}),
            child: NewHeaderComponenteWidget(
              title: 'Acompáñame',
            ),
          ),
        ],
      ),
    );
  }
}
