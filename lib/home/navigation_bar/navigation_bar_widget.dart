import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_model.dart';
export 'navigation_bar_model.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  late NavigationBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 20000),
        callback: (timer) async {
          _model.locationFromGoogleMap = await actions.locationgooglemaps();
          FFAppState().locationdata = _model.locationFromGoogleMap!;
          safeSetState(() {});
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    // On component dispose action.
    () async {
      _model.instantTimer?.cancel();
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.95,
        height: 66.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0xF9000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondary,
            width: 2.0,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 12.0,
                    buttonSize: MediaQuery.sizeOf(context).width * 0.1,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.home_sharp,
                      color: FlutterFlowTheme.of(context).info,
                      size: 25.0,
                    ),
                    onPressed: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(HomePageWidget.routeName);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 12.0,
                  buttonSize: MediaQuery.sizeOf(context).width * 0.1,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.contacts_outlined,
                    color: FlutterFlowTheme.of(context).info,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(Directorio1Widget.routeName);
                  },
                ),
              ),
              Flexible(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await actions.sendsmstocontacts(
                      FFAppState().ContactosDeEmergencia.toList(),
                      '${functions.getkeyvaluestring(FFAppState().message, 'message')}${_model.locationFromGoogleMap}',
                    );
                    _model.instantTimerW = InstantTimer.periodic(
                      duration: Duration(milliseconds: 30000),
                      callback: (timer) async {
                        _model.counter = _model.counter + 1;
                        safeSetState(() {});
                        if (_model.counter == 10) {
                          _model.instantTimerW?.cancel();
                          FFAppState().sendinglocation = false;
                          safeSetState(() {});
                        } else {
                          _model.sendlocationoutput =
                              await actions.sendlocationtoapi(
                            FFAppConstants.supbaseUrlLocation,
                            FFAppConstants.supabaseKey,
                            currentUserEmail,
                            functions.getkeyvaluestring(
                                _model.locationFromGoogleMap!, 'latitude'),
                            functions.getkeyvaluestring(
                                _model.locationFromGoogleMap!, 'longitude'),
                            currentJwtToken,
                          );
                          FFAppState().sendinglocation = true;
                          safeSetState(() {});
                        }
                      },
                      startImmediately: true,
                    );

                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/warning.png',
                      height: 65.0,
                      fit: BoxFit.fill,
                      alignment: Alignment(0.0, 0.0),
                    ),
                  ),
                ),
              ),
              if (!FFAppState().sendinglocation)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 12.0,
                    buttonSize: MediaQuery.sizeOf(context).width * 0.1,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.location_on,
                      color: FlutterFlowTheme.of(context).info,
                      size: 25.0,
                    ),
                    onPressed: () async {
                      await actions.sendsmstocontacts(
                        FFAppState().ContactosDeEmergencia.toList(),
                        '${functions.getkeyvaluestring(FFAppState().message, 'message')}${_model.locationFromGoogleMap}',
                      );
                      _model.instantTimerZ = InstantTimer.periodic(
                        duration: Duration(milliseconds: 30000),
                        callback: (timer) async {
                          _model.counter = _model.counter + 1;
                          safeSetState(() {});
                          if (_model.counter == 10) {
                            _model.instantTimerZ?.cancel();
                            FFAppState().sendinglocation = false;
                            safeSetState(() {});
                          } else {
                            _model.sendlocationoutputCopy =
                                await actions.sendlocationtoapi(
                              FFAppConstants.supbaseUrlLocation,
                              FFAppConstants.supabaseKey,
                              currentUserEmail,
                              functions.getkeyvaluestring(
                                  _model.locationFromGoogleMap!, 'latitude'),
                              functions.getkeyvaluestring(
                                  _model.locationFromGoogleMap!, 'longitude'),
                              currentJwtToken,
                            );
                            FFAppState().sendinglocation = true;
                            safeSetState(() {});
                          }
                        },
                        startImmediately: true,
                      );

                      safeSetState(() {});
                    },
                  ),
                ),
              if (FFAppState().sendinglocation)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 12.0,
                    buttonSize: MediaQuery.sizeOf(context).width * 0.1,
                    fillColor: FlutterFlowTheme.of(context).alternate,
                    icon: Icon(
                      Icons.share_location,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      _model.instantTimerZ?.cancel();
                      FFAppState().sendinglocation = false;
                      safeSetState(() {});
                    },
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(3.0),
                child: FlutterFlowIconButton(
                  borderRadius: 12.0,
                  buttonSize: MediaQuery.sizeOf(context).width * 0.1,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.support_agent,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(LineasDeAtencionPageWidget.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
