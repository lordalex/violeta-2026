import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'home_button_model.dart';
export 'home_button_model.dart';

class HomeButtonWidget extends StatefulWidget {
  const HomeButtonWidget({
    super.key,
    required this.bgcolor,
    required this.fgcolor,
    required this.pushedcolor,
    required this.pushfgcolor,
  });

  final Color? bgcolor;
  final Color? fgcolor;
  final Color? pushedcolor;
  final Color? pushfgcolor;

  @override
  State<HomeButtonWidget> createState() => _HomeButtonWidgetState();
}

class _HomeButtonWidgetState extends State<HomeButtonWidget> {
  late HomeButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowIconButton(
      borderRadius: 10.0,
      buttonSize: 50.0,
      fillColor:
          FFAppState().ruta == 'Home' ? widget.pushedcolor : widget.bgcolor,
      icon: FaIcon(
        FontAwesomeIcons.house,
        color:
            FFAppState().ruta == 'Home' ? widget.pushfgcolor : widget.fgcolor,
        size: 24.0,
      ),
      onPressed: () async {
        FFAppState().ruta = 'Home';
        safeSetState(() {});

        context.pushNamed(HomePageWidget.routeName);
      },
    );
  }
}
