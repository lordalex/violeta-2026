import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_page_model.dart';
export 'loading_page_model.dart';

class LoadingPageWidget extends StatefulWidget {
  const LoadingPageWidget({super.key});

  static String routeName = 'LoadingPage';
  static String routePath = '/loadingPage';

  @override
  State<LoadingPageWidget> createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget>
    with TickerProviderStateMixin {
  late LoadingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.profileGOT = await actions.getProfile(
        FFAppConstants.supabaseKey,
        FFAppConstants.updateProfileURL,
        currentJwtToken,
      );
      _model.profileparameters = await actions.stringtoparameters(
        _model.profileGOT!,
        '[\"data.user.profile\"]',
      );
      FFAppState().profile = _model.profileparameters!;
      _model.avatarnameOutput = await actions.initialsAction(
        functions.getkeyvaluestring(FFAppState().profile, 'nombre'),
      );
      FFAppState().avatarname = _model.avatarnameOutput!;
      _model.interactivoIndexFrom = await actions.getHTMLfromURL(
        FFAppConstants.interactivoindex,
      );
      FFAppState().listadodeinteractivos = functions
          .jsonArrayToObjectString(_model.interactivoIndexFrom!)
          .toList()
          .cast<String>();
      safeSetState(() {});
      _model.lstF = await actions.getHTMLfromURL(
        'https://bripwlbmdjnkvlbsunvq.supabase.co/storage/v1/object/public/files/index_destacados.json',
      );
      FFAppState().listadodestaticos = functions
          .jsonArrayToObjectString(_model.interactivoIndexFrom!)
          .toList()
          .cast<String>();
      safeSetState(() {});
      _model.status = _model.status + 1;
      safeSetState(() {});
      _model.listastringdeestados = await actions.getHTMLfromURL(
        FFAppConstants.estados,
      );
      FFAppState().listaadeestados = functions
          .getKeys(_model.listastringdeestados!)
          .toList()
          .cast<String>();
      _model.indexEstaticosL = await actions.getHTMLfromURL(
        FFAppConstants.indexEstaticos,
      );
      FFAppState().listadodestaticos = functions
          .jsonArrayToObjectString(_model.indexEstaticosL!)
          .toList()
          .cast<String>();
      safeSetState(() {});
      _model.indexDestacados = await actions.getHTMLfromURL(
        FFAppConstants.indexDestacados,
      );
      FFAppState().listadodestacados = functions
          .jsonArrayToObjectString(_model.indexDestacados!)
          .toList()
          .cast<String>();
      safeSetState(() {});
      if (FFAppState().LocalizacionActiva == true) {
        if (FFAppState().firstTime == true) {
          if (FFAppState().rutasvisitadas == 'Perfil') {
            context.goNamed(HomePageWidget.routeName);
          } else {
            context.goNamed(PerfilUsuarioWidget.routeName);
          }
        } else {
          context.goNamed(NewWalkThroughPageWidget.routeName);
        }
      } else {
        context.goNamed(PasoProximoAuthorizationWidget.routeName);
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 780.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 780.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 1.0.ms,
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF7F4F2),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.06, -0.87),
                    child: Image.asset(
                      'assets/images/violet_logo1.png',
                      width: 90.0,
                      height: 102.0,
                      fit: BoxFit.contain,
                      alignment: Alignment(0.0, 0.0),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.02, -0.48),
                    child: Text(
                      'Bienvenida a Red Violeta',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.w900,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .fontStyle,
                            ),
                            color: Color(0xFF39004D),
                            fontSize: 33.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displayLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.14),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'CARGANDO CONTENIDO...',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.raleway(
                                fontWeight: FontWeight.w800,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF39004D),
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.21, 0.56),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/bt01.png',
                          width: 270.0,
                          height: 251.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FaIcon(
                            FontAwesomeIcons.circleNotch,
                            color: Color(0xFF992EC9),
                            size: 50.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation']!),
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
    );
  }
}
