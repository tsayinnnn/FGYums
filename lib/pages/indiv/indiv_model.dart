import '/flutter_flow/flutter_flow_util.dart';
import 'indiv_widget.dart' show IndivWidget;
import 'package:flutter/material.dart';

class IndivModel extends FlutterFlowModel<IndivWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
