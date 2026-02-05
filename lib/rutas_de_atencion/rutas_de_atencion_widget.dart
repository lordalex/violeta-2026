import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'rutas_de_atencion_model.dart';
export 'rutas_de_atencion_model.dart';

/// Esta pagina es un directorio que te indica donde se encuanteran puestos de
/// atencion basado en tu ubicacion.
class RutasDeAtencionWidget extends StatefulWidget {
  const RutasDeAtencionWidget({super.key});

  static String routeName = 'RutasDeAtencion';
  static String routePath = '/rutasDeAtencion';

  @override
  State<RutasDeAtencionWidget> createState() => _RutasDeAtencionWidgetState();
}

class _RutasDeAtencionWidgetState extends State<RutasDeAtencionWidget> {
  late RutasDeAtencionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutasDeAtencionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'LÍNEAS DE ATENCIÓN',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
