import '/components/info_pointer1_column_widget.dart';
import '/components/info_pointer2_column_widget.dart';
import '/components/info_pointer3_column_widget.dart';
import '/components/info_pointer4_column_widget.dart';
import '/components/info_pointer5_column_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_walk_through_page_widget.dart' show NewWalkThroughPageWidget;
import 'package:flutter/material.dart';

class NewWalkThroughPageModel
    extends FlutterFlowModel<NewWalkThroughPageWidget> {
  ///  Local state fields for this page.

  bool isGpsTutorialActivated = false;

  int integerPointers = 1;

  ///  State fields for stateful widgets in this page.

  // Model for InfoPointer1Column component.
  late InfoPointer1ColumnModel infoPointer1ColumnModel;
  // Model for InfoPointer2Column component.
  late InfoPointer2ColumnModel infoPointer2ColumnModel;
  // Model for InfoPointer3Column component.
  late InfoPointer3ColumnModel infoPointer3ColumnModel;
  // Model for InfoPointer4Column component.
  late InfoPointer4ColumnModel infoPointer4ColumnModel;
  // Model for InfoPointer5Column component.
  late InfoPointer5ColumnModel infoPointer5ColumnModel;

  @override
  void initState(BuildContext context) {
    infoPointer1ColumnModel =
        createModel(context, () => InfoPointer1ColumnModel());
    infoPointer2ColumnModel =
        createModel(context, () => InfoPointer2ColumnModel());
    infoPointer3ColumnModel =
        createModel(context, () => InfoPointer3ColumnModel());
    infoPointer4ColumnModel =
        createModel(context, () => InfoPointer4ColumnModel());
    infoPointer5ColumnModel =
        createModel(context, () => InfoPointer5ColumnModel());
  }

  @override
  void dispose() {
    infoPointer1ColumnModel.dispose();
    infoPointer2ColumnModel.dispose();
    infoPointer3ColumnModel.dispose();
    infoPointer4ColumnModel.dispose();
    infoPointer5ColumnModel.dispose();
  }
}
