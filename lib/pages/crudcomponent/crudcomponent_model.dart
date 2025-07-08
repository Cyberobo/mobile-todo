import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'crudcomponent_widget.dart' show CrudcomponentWidget;
import 'package:flutter/material.dart';

class CrudcomponentModel extends FlutterFlowModel<CrudcomponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (deleteTask)] action in Button widget.
  ApiCallResponse? apiResulteh3;
  // Stores action output result for [Backend Call - API (getPendingTask)] action in Button widget.
  ApiCallResponse? pendingTasks;
  // Stores action output result for [Backend Call - API (getComplatedTask)] action in Button widget.
  ApiCallResponse? completedTasks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
