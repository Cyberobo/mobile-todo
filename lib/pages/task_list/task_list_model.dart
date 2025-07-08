import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'task_list_widget.dart' show TaskListWidget;
import 'package:flutter/material.dart';

class TaskListModel extends FlutterFlowModel<TaskListWidget> {
  ///  Local state fields for this page.

  bool isOn = true;

  bool isOff = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (getComplatedTask)] action in Tab widget.
  ApiCallResponse? aaaa;
  // State field(s) for Checkbox widget.
  Map<TodoModelStruct, bool> checkboxValueMap1 = {};
  List<TodoModelStruct> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - API (updateTaskState)] action in Checkbox widget.
  ApiCallResponse? checkbox;
  // Stores action output result for [Backend Call - API (getPendingTask)] action in Checkbox widget.
  ApiCallResponse? pendingTasks;
  // Stores action output result for [Backend Call - API (getComplatedTask)] action in Checkbox widget.
  ApiCallResponse? completedTasksList;
  // Stores action output result for [Backend Call - API (getPendingTask)] action in Tab widget.
  ApiCallResponse? bbbbb;
  // State field(s) for Checkbox widget.
  Map<TodoModelStruct, bool> checkboxValueMap2 = {};
  List<TodoModelStruct> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - API (updateTaskState)] action in Checkbox widget.
  ApiCallResponse? apiResultrll;
  // Stores action output result for [Backend Call - API (getPendingTask)] action in Checkbox widget.
  ApiCallResponse? pendingTaskList;
  // Stores action output result for [Backend Call - API (getComplatedTask)] action in Checkbox widget.
  ApiCallResponse? completedTasks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
