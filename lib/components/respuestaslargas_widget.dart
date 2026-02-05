import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'respuestaslargas_model.dart';
export 'respuestaslargas_model.dart';

class RespuestaslargasWidget extends StatefulWidget {
  const RespuestaslargasWidget({super.key});

  @override
  State<RespuestaslargasWidget> createState() => _RespuestaslargasWidgetState();
}

class _RespuestaslargasWidgetState extends State<RespuestaslargasWidget> {
  late RespuestaslargasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RespuestaslargasModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
