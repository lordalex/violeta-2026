import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'sexos_model.dart';
export 'sexos_model.dart';

/// a list with sexes with text and icon: female, trans, prefiero no decir
class SexosWidget extends StatefulWidget {
  const SexosWidget({super.key});

  @override
  State<SexosWidget> createState() => _SexosWidgetState();
}

class _SexosWidgetState extends State<SexosWidget> {
  late SexosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SexosModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowChoiceChips(
      options: [
        ChipData('Female', Icons.female),
        ChipData('Trans', Icons.transgender),
        ChipData('Prefiero no decir', Icons.remove)
      ],
      onChanged: (val) =>
          safeSetState(() => _model.choiceChipsValue = val?.firstOrNull),
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).info,
              fontSize: 14.0,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
        iconColor: FlutterFlowTheme.of(context).info,
        iconSize: 18.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(20.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 14.0,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
            ),
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        iconSize: 18.0,
        elevation: 0.0,
        borderRadius: BorderRadius.circular(20.0),
      ),
      chipSpacing: 12.0,
      rowSpacing: 12.0,
      multiselect: false,
      alignment: WrapAlignment.start,
      controller: _model.choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      wrapped: true,
    );
  }
}
