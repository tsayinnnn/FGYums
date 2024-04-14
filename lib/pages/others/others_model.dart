import '/flutter_flow/flutter_flow_util.dart';
import 'others_widget.dart' show OthersWidget;
import 'package:flutter/material.dart';

class OthersModel extends FlutterFlowModel<OthersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
