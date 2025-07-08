import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<TodoModelStruct> _completedTaskList = [];
  List<TodoModelStruct> get completedTaskList => _completedTaskList;
  set completedTaskList(List<TodoModelStruct> value) {
    _completedTaskList = value;
  }

  void addToCompletedTaskList(TodoModelStruct value) {
    completedTaskList.add(value);
  }

  void removeFromCompletedTaskList(TodoModelStruct value) {
    completedTaskList.remove(value);
  }

  void removeAtIndexFromCompletedTaskList(int index) {
    completedTaskList.removeAt(index);
  }

  void updateCompletedTaskListAtIndex(
    int index,
    TodoModelStruct Function(TodoModelStruct) updateFn,
  ) {
    completedTaskList[index] = updateFn(_completedTaskList[index]);
  }

  void insertAtIndexInCompletedTaskList(int index, TodoModelStruct value) {
    completedTaskList.insert(index, value);
  }

  List<TodoModelStruct> _pendingTaskList = [];
  List<TodoModelStruct> get pendingTaskList => _pendingTaskList;
  set pendingTaskList(List<TodoModelStruct> value) {
    _pendingTaskList = value;
  }

  void addToPendingTaskList(TodoModelStruct value) {
    pendingTaskList.add(value);
  }

  void removeFromPendingTaskList(TodoModelStruct value) {
    pendingTaskList.remove(value);
  }

  void removeAtIndexFromPendingTaskList(int index) {
    pendingTaskList.removeAt(index);
  }

  void updatePendingTaskListAtIndex(
    int index,
    TodoModelStruct Function(TodoModelStruct) updateFn,
  ) {
    pendingTaskList[index] = updateFn(_pendingTaskList[index]);
  }

  void insertAtIndexInPendingTaskList(int index, TodoModelStruct value) {
    pendingTaskList.insert(index, value);
  }

  int _totalTaskCount = 0;
  int get totalTaskCount => _totalTaskCount;
  set totalTaskCount(int value) {
    _totalTaskCount = value;
  }

  int _completedTaskCount = 0;
  int get completedTaskCount => _completedTaskCount;
  set completedTaskCount(int value) {
    _completedTaskCount = value;
  }

  int _pendingTaskCount = 0;
  int get pendingTaskCount => _pendingTaskCount;
  set pendingTaskCount(int value) {
    _pendingTaskCount = value;
  }
}
