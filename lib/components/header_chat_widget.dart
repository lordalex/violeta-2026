import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'header_chat_model.dart';
export 'header_chat_model.dart';

class HeaderChatWidget extends StatefulWidget {
  const HeaderChatWidget({
    super.key,
    String? title,
    bool? isBackButtonActivated,
  })  : this.title = title ?? 'Untitled',
        this.isBackButtonActivated = isBackButtonActivated ?? true;

  final String title;
  final bool isBackButtonActivated;

  @override
  State<HeaderChatWidget> createState() => _HeaderChatWidgetState();
}

class _HeaderChatWidgetState extends State<HeaderChatWidget> {
  late HeaderChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderChatModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().sendinglocation) {
        _model.instantTimerVII = InstantTimer.periodic(
          duration: Duration(milliseconds: 10000),
          callback: (timer) async {
            if (FFAppState().counterAcompaname ==
                FFAppState().periodic30secondsTimerSelector) {
              _model.instantTimerVII?.cancel();
              FFAppState().sendinglocation = false;
              safeSetState(() {});
              FFAppState().counterAcompaname = 0;
              safeSetState(() {});
            } else {
              FFAppState().counterAcompaname =
                  FFAppState().counterAcompaname + 1;
              safeSetState(() {});
              _model.locationFromGoogleMap234 =
                  await actions.locationgooglemaps();
              FFAppState().locationdata = _model.locationFromGoogleMap234!;
              safeSetState(() {});
              _model.sendlocationoutput = await actions.sendlocationtoapi(
                FFAppConstants.supbaseUrlLocation,
                FFAppConstants.supabaseKey,
                currentUserEmail,
                functions.getkeyvaluestring(
                    _model.locationFromGoogleMap234!, 'latitude'),
                functions.getkeyvaluestring(
                    _model.locationFromGoogleMap234!, 'longitude'),
                currentJwtToken,
              );
              FFAppState().sendinglocation = true;
              safeSetState(() {});
            }
          },
          startImmediately: true,
        );
      } else {
        FFAppState().locationdata = '';
        FFAppState().deleteStartedDateTimeAcompaname();
        FFAppState().startedDateTimeAcompaname = null;

        FFAppState().deleteTimeRangeSelectedInMsAcompaname();
        FFAppState().timeRangeSelectedInMsAcompaname = 0;

        FFAppState().deleteIntegerTimerSelectorAcompaname();
        FFAppState().integerTimerSelectorAcompaname = 0;

        FFAppState().deleteCounterAcompaname();
        FFAppState().counterAcompaname = 0;

        FFAppState().deletePeriodic30secondsTimerSelector();
        FFAppState().periodic30secondsTimerSelector = 0;

        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
