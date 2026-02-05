import '/components/info_pointer1_column_widget.dart';
import '/components/info_pointer2_column_widget.dart';
import '/components/info_pointer3_column_widget.dart';
import '/components/info_pointer4_column_widget.dart';
import '/components/info_pointer5_column_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_walk_through_page_model.dart';
export 'new_walk_through_page_model.dart';

class NewWalkThroughPageWidget extends StatefulWidget {
  const NewWalkThroughPageWidget({super.key});

  static String routeName = 'newWalkThroughPage';
  static String routePath = '/newWalkThroughPage';

  @override
  State<NewWalkThroughPageWidget> createState() =>
      _NewWalkThroughPageWidgetState();
}

class _NewWalkThroughPageWidgetState extends State<NewWalkThroughPageWidget>
    with TickerProviderStateMixin {
  late NewWalkThroughPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewWalkThroughPageModel());

    animationsMap.addAll({
      'stackOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 1200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 1200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 1200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 1200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 1200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.78, 0.78),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (_model.isGpsTutorialActivated == false) {
              if (_model.integerPointers == 1) {
                _model.isGpsTutorialActivated = true;
                safeSetState(() {});
                HapticFeedback.heavyImpact();
                if (animationsMap['stackOnActionTriggerAnimation4'] != null) {
                  await animationsMap['stackOnActionTriggerAnimation4']!
                      .controller
                      .forward(from: 0.0);
                }
                await Future.delayed(
                  Duration(
                    milliseconds: 500,
                  ),
                );
                _model.integerPointers = _model.integerPointers + 1;
                safeSetState(() {});
                _model.isGpsTutorialActivated = false;
                safeSetState(() {});
              } else if (_model.integerPointers == 2) {
                _model.isGpsTutorialActivated = true;
                safeSetState(() {});
                HapticFeedback.heavyImpact();
                if (animationsMap['stackOnActionTriggerAnimation4'] != null) {
                  await animationsMap['stackOnActionTriggerAnimation4']!
                      .controller
                      .reverse();
                }
                if (animationsMap['stackOnActionTriggerAnimation3'] != null) {
                  await animationsMap['stackOnActionTriggerAnimation3']!
                      .controller
                      .forward(from: 0.0);
                }
                await Future.delayed(
                  Duration(
                    milliseconds: 500,
                  ),
                );
                _model.integerPointers = _model.integerPointers + 1;
                safeSetState(() {});
                _model.isGpsTutorialActivated = false;
                safeSetState(() {});
              } else if (_model.integerPointers == 3) {
                _model.isGpsTutorialActivated = true;
                safeSetState(() {});
                HapticFeedback.heavyImpact();
                if (animationsMap['stackOnActionTriggerAnimation3'] != null) {
                  await animationsMap['stackOnActionTriggerAnimation3']!
                      .controller
                      .reverse();
                }
                if (animationsMap['stackOnActionTriggerAnimation5'] != null) {
                  await animationsMap['stackOnActionTriggerAnimation5']!
                      .controller
                      .forward(from: 0.0);
                }
                await Future.delayed(
                  Duration(
                    milliseconds: 500,
                  ),
                );
                _model.integerPointers = _model.integerPointers + 1;
                safeSetState(() {});
                _model.isGpsTutorialActivated = false;
                safeSetState(() {});
              } else if (_model.integerPointers == 4) {
                _model.isGpsTutorialActivated = true;
                safeSetState(() {});
                HapticFeedback.heavyImpact();
                if (animationsMap['stackOnActionTriggerAnimation5'] != null) {
                  await animationsMap['stackOnActionTriggerAnimation5']!
                      .controller
                      .reverse();
                }
                if (animationsMap['stackOnActionTriggerAnimation2'] != null) {
                  await animationsMap['stackOnActionTriggerAnimation2']!
                      .controller
                      .forward(from: 0.0);
                }
                await Future.delayed(
                  Duration(
                    milliseconds: 500,
                  ),
                );
                _model.integerPointers = _model.integerPointers + 1;
                safeSetState(() {});
                _model.isGpsTutorialActivated = false;
                safeSetState(() {});
              } else if (_model.integerPointers == 5) {
                HapticFeedback.heavyImpact();
                HapticFeedback.mediumImpact();
                FFAppState().firstTime = true;
                safeSetState(() {});
                if (FFAppState().PerfilCreado) {
                  context.pushNamed(HomePageWidget.routeName);
                } else {
                  context.pushNamed(
                    PerfilUsuarioWidget.routeName,
                    queryParameters: {
                      'config': serializeParam(
                        true,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                  );
                }
              } else {
                return;
              }
            } else {
              return;
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFCF7691),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/clouds.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 350.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(70.0),
                                topRight: Radius.circular(70.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 5.0),
                                  child: Container(
                                    width: 120.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2E5FF),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'TUTORIAL',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.raleway(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF39004D),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 69.4,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEDEDED),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
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
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x79B7B7B7),
                  ),
                ),
                if (_model.integerPointers == 5)
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Container(
                          width: 80.7,
                          height: 80.7,
                          decoration: BoxDecoration(
                            color: Color(0xB4F1F4F8),
                            shape: BoxShape.circle,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      ),
                    ],
                  ).animateOnActionTrigger(
                    animationsMap['stackOnActionTriggerAnimation1']!,
                  ),
                if (_model.integerPointers == 4)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 78.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Container(
                            width: 80.7,
                            height: 80.7,
                            decoration: BoxDecoration(
                              color: Color(0xB4F1F4F8),
                              shape: BoxShape.circle,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['stackOnActionTriggerAnimation2']!,
                    ),
                  ),
                if (_model.integerPointers == 2)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(78.0, 0.0, 0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Container(
                            width: 80.7,
                            height: 80.7,
                            decoration: BoxDecoration(
                              color: Color(0xB4F1F4F8),
                              shape: BoxShape.circle,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation3']!),
                        ),
                      ],
                    ).animateOnActionTrigger(
                      animationsMap['stackOnActionTriggerAnimation3']!,
                    ),
                  ),
                if (_model.integerPointers == 1)
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Container(
                          width: 80.7,
                          height: 80.7,
                          decoration: BoxDecoration(
                            color: Color(0xB4F1F4F8),
                            shape: BoxShape.circle,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation4']!),
                      ),
                    ],
                  ).animateOnActionTrigger(
                    animationsMap['stackOnActionTriggerAnimation4']!,
                  ),
                if (_model.integerPointers == 3)
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: 132.7,
                          height: 132.7,
                          decoration: BoxDecoration(
                            color: Color(0xB4F1F4F8),
                            shape: BoxShape.circle,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation5']!),
                      ),
                    ],
                  ).animateOnActionTrigger(
                    animationsMap['stackOnActionTriggerAnimation5']!,
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 69.4,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          if (_model.integerPointers == 1)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x17200030),
                                                  shape: BoxShape.circle,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation6']!),
                                            ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.home_outlined,
                                              color: Color(0xD4D04870),
                                              size: 30.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        if (_model.integerPointers == 2)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x17200030),
                                                shape: BoxShape.circle,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation7']!),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.groups_outlined,
                                            color: Color(0xD4D04870),
                                            size: 30.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Color(0xD4D04870),
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                      if (_model.integerPointers == 4)
                                        Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xC9D04870),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(7.0),
                                                    child: Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'containerOnActionTriggerAnimation']!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.support_agent,
                                            color: Color(0xD4D04870),
                                            size: 30.0,
                                          ),
                                        ),
                                        if (_model.integerPointers == 5)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x17200030),
                                                shape: BoxShape.circle,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation8']!),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 26.0),
                            child: Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0xA3D048B9),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                    spreadRadius: 4.0,
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.exclamation,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 32.0,
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation9']!),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 80.0),
                    child: Container(
                      width: double.infinity,
                      height: 197.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Stack(
                        children: [
                          if (_model.integerPointers == 1)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.infoPointer1ColumnModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfoPointer1ColumnWidget(
                                  parameter1: _model.integerPointers,
                                ),
                              ),
                            ),
                          if (_model.integerPointers == 2)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.infoPointer2ColumnModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfoPointer2ColumnWidget(
                                  parameter1: _model.integerPointers,
                                ),
                              ),
                            ),
                          if (_model.integerPointers == 3)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.infoPointer3ColumnModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfoPointer3ColumnWidget(
                                  parameter1: _model.integerPointers,
                                ),
                              ),
                            ),
                          if (_model.integerPointers == 4)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.infoPointer4ColumnModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfoPointer4ColumnWidget(
                                  parameter1: _model.integerPointers,
                                ),
                              ),
                            ),
                          if (_model.integerPointers == 5)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.infoPointer5ColumnModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InfoPointer5ColumnWidget(
                                  parameter1: _model.integerPointers,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.heavyImpact();
                        HapticFeedback.mediumImpact();
                        FFAppState().firstTime = true;
                        safeSetState(() {});
                        if (FFAppState().PerfilCreado) {
                          context.pushNamed(HomePageWidget.routeName);
                        } else {
                          context.pushNamed(
                            PerfilUsuarioWidget.routeName,
                            queryParameters: {
                              'config': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                      child: Text(
                        'SALTAR',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xB9F1F4F8),
                              fontSize: 28.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
