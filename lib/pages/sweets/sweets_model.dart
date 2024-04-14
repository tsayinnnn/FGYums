import '/flutter_flow/flutter_flow_util.dart';
import 'sweets_widget.dart' show SweetsWidget;
import 'package:flutter/material.dart';

class SweetsModel extends FlutterFlowModel<SweetsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
