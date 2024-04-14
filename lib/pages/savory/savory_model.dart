import '/flutter_flow/flutter_flow_util.dart';
import 'savory_widget.dart' show SavoryWidget;
import 'package:flutter/material.dart';

class SavoryModel extends FlutterFlowModel<SavoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
