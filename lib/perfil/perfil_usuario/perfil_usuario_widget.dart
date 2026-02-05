import '/auth/supabase_auth/auth_util.dart';
import '/components/new_header_componente_widget.dart';
import '/components/notifications_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'perfil_usuario_model.dart';
export 'perfil_usuario_model.dart';

/// a login form
class PerfilUsuarioWidget extends StatefulWidget {
  const PerfilUsuarioWidget({
    super.key,
    bool? config,
  }) : this.config = config ?? false;

  final bool config;

  static String routeName = 'PerfilUsuario';
  static String routePath = '/perfilUsuario';

  @override
  State<PerfilUsuarioWidget> createState() => _PerfilUsuarioWidgetState();
}

class _PerfilUsuarioWidgetState extends State<PerfilUsuarioWidget> {
  late PerfilUsuarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilUsuarioModel());

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
      _model.filled = 0;
      safeSetState(() {});
      _model.avatarnameOutput = await actions.initialsAction(
        functions.getkeyvaluestring(FFAppState().profile, 'nombre'),
      );
      FFAppState().avatarname = _model.avatarnameOutput!;
      safeSetState(() {});
      _model.estadosdownloaded = await actions.getHTMLfromURL(
        FFAppConstants.estados,
      );
      _model.municipio = functions
          .getmuncipio(_model.estadosdownloaded!, _model.dropDownValue1!)
          .toList()
          .cast<String>();
      safeSetState(() {});
      if (_model.nombreApellidoTextController.text != '') {
        _model.filled = _model.filled + 1;
        safeSetState(() {});
      }
      if (_model.nrodetelefonoTextController.text != '') {
        _model.filled = _model.filled + 1;
        safeSetState(() {});
      }
      if (_model.cedulaTextController.text != '') {
        _model.filled = _model.filled + 1;
        safeSetState(() {});
      }
      if (_model.fechaNacTextController.text != '') {
        _model.filled = _model.filled + 1;
        safeSetState(() {});
      }
      if (_model.dropDownValue1 != null && _model.dropDownValue1 != '') {
        _model.filled = _model.filled + 1;
        safeSetState(() {});
      }
      if ((_model.filled > 4) && !widget.config) {
        context.pushNamed(HomePageWidget.routeName);
      }
    });

    _model.nombreApellidoTextController ??= TextEditingController(
        text: functions.getkeyvaluestring(FFAppState().profile, 'nombre'));
    _model.nombreApellidoFocusNode ??= FocusNode();
    _model.nombreApellidoFocusNode!.addListener(
      () async {
        if (_model.nombreApellidoTextController.text != '') {
          _model.filled = _model.filled + 1;
          safeSetState(() {});
        } else {
          _model.filled = _model.filled + -1;
          safeSetState(() {});
        }

        _model.avatarnameOutputx = await actions.initialsAction(
          functions.getkeyvaluestring(FFAppState().profile, 'nombre'),
        );
        FFAppState().avatarname = _model.avatarnameOutputx!;

        safeSetState(() {});
      },
    );
    _model.nrodetelefonoTextController ??= TextEditingController(
        text: functions.getkeyvaluestring(FFAppState().profile, 'telefono'));
    _model.nrodetelefonoFocusNode ??= FocusNode();
    _model.nrodetelefonoFocusNode!.addListener(
      () async {
        if (_model.nrodetelefonoTextController.text != '') {
          _model.filled = _model.filled + 1;
          safeSetState(() {});
        } else {
          _model.filled = _model.filled + -1;
          safeSetState(() {});
        }
      },
    );
    _model.nrodetelefonoMask = MaskTextInputFormatter(mask: '(####)#######');
    _model.cedulaTextController ??= TextEditingController(
        text: functions.getkeyvaluestring(FFAppState().profile, 'cedula'));
    _model.cedulaFocusNode ??= FocusNode();
    _model.cedulaFocusNode!.addListener(
      () async {
        if (_model.cedulaTextController.text != '') {
          _model.filled = _model.filled + 1;
          safeSetState(() {});
        } else {
          _model.filled = _model.filled + -1;
          safeSetState(() {});
        }
      },
    );
    _model.fechaNacTextController ??= TextEditingController(
        text: functions.getkeyvaluestring(FFAppState().profile, 'date'));
    _model.fechaNacFocusNode ??= FocusNode();
    _model.fechaNacFocusNode!.addListener(
      () async {
        if (_model.fechaNacTextController.text != '') {
          _model.filled = _model.filled + 1;
          safeSetState(() {});
        } else {
          _model.filled = _model.filled + -1;
          safeSetState(() {});
        }
      },
    );
    _model.fechaNacMask = MaskTextInputFormatter(mask: '##/##/####');
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  widget.config ? currentUserEmail : '',
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
                                        color: Color(0xFF260033),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Datos',
                                  textAlign: TextAlign.center,
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
                                        color: Color(0xFF260033),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 5.0,
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Nombre y Apellido',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            TextFormField(
                              controller: _model.nombreApellidoTextController,
                              focusNode: _model.nombreApellidoFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.nombreApellidoTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.nombreApellidoTextController
                                              .text !=
                                          '') {
                                    _model.filled = _model.filled + 1;
                                    safeSetState(() {});
                                  } else {
                                    _model.filled = _model.filled + -1;
                                    safeSetState(() {});
                                  }

                                  _model.avatarnameOutputy =
                                      await actions.initialsAction(
                                    functions.getkeyvaluestring(
                                        FFAppState().profile, 'nombre'),
                                  );
                                  FFAppState().avatarname =
                                      _model.avatarnameOutputy!;

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
                                hintText: 'Nombre y Apellido',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
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
                                    color: (_model.nombreApellidoFocusNode
                                                    ?.hasFocus ??
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xFFE91E63),
                                  size: 25.0,
                                ),
                                suffixIcon: _model.nombreApellidoTextController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.nombreApellidoTextController
                                              ?.clear();
                                          if (_model.nombreApellidoTextController
                                                      .text !=
                                                  '') {
                                            _model.filled = _model.filled + 1;
                                            safeSetState(() {});
                                          } else {
                                            _model.filled = _model.filled + -1;
                                            safeSetState(() {});
                                          }

                                          _model.avatarnameOutputy =
                                              await actions.initialsAction(
                                            functions.getkeyvaluestring(
                                                FFAppState().profile, 'nombre'),
                                          );
                                          FFAppState().avatarname =
                                              _model.avatarnameOutputy!;

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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              cursorColor: Color(0xFFD44973),
                              validator: _model
                                  .nombreApellidoTextControllerValidator
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Teléfono',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            TextFormField(
                              controller: _model.nrodetelefonoTextController,
                              focusNode: _model.nrodetelefonoFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.nrodetelefonoTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.nrodetelefonoTextController.text !=
                                          '') {
                                    _model.filled = _model.filled + 1;
                                    safeSetState(() {});
                                  } else {
                                    _model.filled = _model.filled + -1;
                                    safeSetState(() {});
                                  }
                                },
                              ),
                              autofocus: true,
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
                                hintText: 'Teléfono',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF20505),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF20505),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xFFE91E63),
                                  size: 25.0,
                                ),
                                suffixIcon: _model.nrodetelefonoTextController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.nrodetelefonoTextController
                                              ?.clear();
                                          if (_model.nrodetelefonoTextController
                                                      .text !=
                                                  '') {
                                            _model.filled = _model.filled + 1;
                                            safeSetState(() {});
                                          } else {
                                            _model.filled = _model.filled + -1;
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              maxLength: 13,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              keyboardType: TextInputType.phone,
                              cursorColor: Color(0xFFD44973),
                              validator: _model
                                  .nrodetelefonoTextControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.nrodetelefonoMask],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Cedula',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            TextFormField(
                              controller: _model.cedulaTextController,
                              focusNode: _model.cedulaFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.cedulaTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.cedulaTextController.text != '') {
                                    _model.filled = _model.filled + 1;
                                    safeSetState(() {});
                                  } else {
                                    _model.filled = _model.filled + -1;
                                    safeSetState(() {});
                                  }
                                },
                              ),
                              autofocus: true,
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
                                hintText: 'Cedula',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF20505),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF20505),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: Color(0xFFE91E63),
                                  size: 25.0,
                                ),
                                suffixIcon: _model
                                        .cedulaTextController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.cedulaTextController?.clear();
                                          if (_model.cedulaTextController
                                                      .text !=
                                                  '') {
                                            _model.filled = _model.filled + 1;
                                            safeSetState(() {});
                                          } else {
                                            _model.filled = _model.filled + -1;
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              maxLength: 9,
                              keyboardType: TextInputType.number,
                              cursorColor: Color(0xFFD44973),
                              validator: _model.cedulaTextControllerValidator
                                  .asValidator(context),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Fecha de Nacimiento',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            TextFormField(
                              controller: _model.fechaNacTextController,
                              focusNode: _model.fechaNacFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.fechaNacTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.fechaNacTextController.text !=
                                          '') {
                                    _model.filled = _model.filled + 1;
                                    safeSetState(() {});
                                  } else {
                                    _model.filled = _model.filled + -1;
                                    safeSetState(() {});
                                  }
                                },
                              ),
                              autofocus: true,
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
                                hintText: 'Fecha de Nacimiento',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF20505),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF20505),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                prefixIcon: Icon(
                                  Icons.cake,
                                  color: Color(0xFFE91E63),
                                  size: 25.0,
                                ),
                                suffixIcon: _model
                                        .fechaNacTextController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.fechaNacTextController
                                              ?.clear();
                                          if (_model.fechaNacTextController
                                                      .text !=
                                                  '') {
                                            _model.filled = _model.filled + 1;
                                            safeSetState(() {});
                                          } else {
                                            _model.filled = _model.filled + -1;
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              maxLength: 10,
                              keyboardType: TextInputType.datetime,
                              cursorColor: Color(0xFFD44973),
                              validator: _model.fechaNacTextControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.fechaNacMask],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Estado',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.pin_drop_rounded,
                                    color: Color(0xFFE91E63),
                                    size: 25.0,
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController1 ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue1 ??=
                                            functions.getkeyvaluestring(
                                                FFAppState().profile, 'stado'),
                                      ),
                                      options: List<String>.from(
                                          functions.tostringA(FFAppState()
                                              .listaadeestados
                                              .toList())),
                                      optionLabels: <String>[],
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.dropDownValue1 = val);
                                        _model.estadosdownloadedv =
                                            await actions.getHTMLfromURL(
                                          FFAppConstants.estados,
                                        );
                                        _model.municipio = functions
                                            .getmuncipio(
                                                _model.estadosdownloadedv!,
                                                _model.dropDownValue1!)
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                      width: 280.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.raleway(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Color(0xFFE91E63),
                                        size: 25.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Municipio',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.pin_drop_rounded,
                                    color: Color(0xFFE91E63),
                                    size: 25.0,
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController2 ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue2 ??=
                                            functions.getkeyvaluestring(
                                                FFAppState().profile,
                                                'municipio'),
                                      ),
                                      options: _model.municipio,
                                      onChanged: (val) => safeSetState(
                                          () => _model.dropDownValue2 = val),
                                      width: 280.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.raleway(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Color(0xFFE91E63),
                                        size: 25.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Genero',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.female,
                                    color: Color(0xFFE91E63),
                                    size: 25.0,
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController3 ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue3 ??=
                                            functions.getkeyvaluestring(
                                                FFAppState().profile, 'genero'),
                                      ),
                                      options: [
                                        'Mujer',
                                        'Hombre',
                                        'Mujer trans',
                                        'Hombre trans',
                                        'Hombre cis',
                                        'Mujer cis',
                                        'Persona trans no binaria',
                                        'Persona no binaria',
                                        'Queer',
                                        'Prefiero no decirlo'
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.dropDownValue3 = val),
                                      width: 280.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.raleway(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Color(0xFFE91E63),
                                        size: 25.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '¿Se identifica con algún tipo de discapacidad?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF260033),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.personal_injury_sharp,
                                    color: Color(0xFFE91E63),
                                    size: 25.0,
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController4 ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue4 ??=
                                            functions.getkeyvaluestring(
                                                FFAppState().profile,
                                                'discapacidad'),
                                      ),
                                      options: ['Si', 'No'],
                                      onChanged: (val) => safeSetState(
                                          () => _model.dropDownValue4 = val),
                                      width: 280.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.raleway(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Color(0xFFE91E63),
                                        size: 25.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_model.dropDownValue4 == 'Si')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Especifique',
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
                                        color: Color(0xFF260033),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.dropDownValue4 == 'Si')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.personal_injury_sharp,
                                            color: Color(0xFFE91E63),
                                            size: 25.0,
                                          ),
                                        ),
                                        Flexible(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController5 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                'Fisica',
                                                'Auditiva',
                                                'Visual',
                                                'Cognitiva',
                                                'Psicosocial',
                                                'Multiple'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model.dropDownValue5 =
                                                      val),
                                              width: 280.0,
                                              height: 40.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Select...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Color(0xFFE91E63),
                                                size: 25.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: _model.filled < 2 ? 100.0 : 0.0,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: _model.filled < 2,
                                child: wrapWithModel(
                                  model: _model.notificationsModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NotificationsWidget(
                                    error: true,
                                    title: _model.filled < 2
                                        ? 'FORMULARIO INCOMPLETO'
                                        : 'RELLENO EXITOSAMENTE',
                                    body: _model.filled < 2
                                        ? 'Faltan campos por rellenar'
                                        : 'Presione Guardar para avanzar a la proxima pagina',
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: (_model.filled < _model.fieldsnumber)
                                    ? null
                                    : () async {
                                        _model.profileMK =
                                            await actions.makeprofile(
                                          _model.cedulaTextController.text,
                                          _model.nombreApellidoTextController
                                              .text,
                                          _model
                                              .nrodetelefonoTextController.text,
                                          _model.fechaNacTextController.text,
                                          _model.dropDownValue1,
                                          _model.dropDownValue2,
                                          '',
                                          _model.dropDownValue3,
                                          _model.dropDownValue4,
                                        );
                                        _model.response =
                                            await actions.sendprofile(
                                          FFAppConstants.supabaseKey,
                                          FFAppConstants.updateProfileURL,
                                          currentJwtToken,
                                          _model.profileMK!,
                                        );
                                        FFAppState().profile =
                                            _model.profileMK!;
                                        safeSetState(() {});
                                        FFAppState().rutasvisitadas = 'Perfil';
                                        safeSetState(() {});
                                        FFAppState().PerfilCreado = true;
                                        safeSetState(() {});
                                        if (widget.config) {
                                          context.pushNamed(
                                            SettingsWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                              ),
                                            },
                                          );
                                        } else {
                                          context.pushNamed(
                                              NewWalkThroughPageWidget
                                                  .routeName);
                                        }

                                        safeSetState(() {});
                                      },
                                text: 'Guardar',
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 56.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF260033),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                  disabledColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.12,
                        decoration: BoxDecoration(),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ].addToStart(SizedBox(height: 160.0)),
              ),
            ),
            wrapWithModel(
              model: _model.newHeaderComponenteModel,
              updateCallback: () => safeSetState(() {}),
              child: NewHeaderComponenteWidget(
                title: 'Perfil',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
