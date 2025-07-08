import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_widget.dart' show EditWidget;
import 'package:flutter/material.dart';

class EditModel extends FlutterFlowModel<EditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  // Stores action output result for [Backend Call - API (updateTask)] action in Button widget.
  ApiCallResponse? apiResultokh;
  // Stores action output result for [Backend Call - API (getComplatedTask)] action in Button widget.
  ApiCallResponse? completedTasks;
  // Stores action output result for [Backend Call - API (getPendingTask)] action in Button widget.
  ApiCallResponse? pendingTasks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();
  }
}
