import '/flutter_flow/flutter_flow_util.dart';
import 'book_widget.dart' show BookWidget;
import 'package:flutter/material.dart';

class BookModel extends FlutterFlowModel<BookWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
