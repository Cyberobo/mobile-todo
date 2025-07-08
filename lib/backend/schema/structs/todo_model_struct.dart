// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodoModelStruct extends BaseStruct {
  TodoModelStruct({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  })  : _id = id,
        _title = title,
        _description = description,
        _isCompleted = isCompleted;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "is_completed" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  set isCompleted(bool? val) => _isCompleted = val;

  bool hasIsCompleted() => _isCompleted != null;

  static TodoModelStruct fromMap(Map<String, dynamic> data) => TodoModelStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        isCompleted: data['is_completed'] as bool?,
      );

  static TodoModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TodoModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'description': _description,
        'is_completed': _isCompleted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'is_completed': serializeParam(
          _isCompleted,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TodoModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TodoModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        isCompleted: deserializeParam(
          data['is_completed'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TodoModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TodoModelStruct &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        isCompleted == other.isCompleted;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, title, description, isCompleted]);
}

TodoModelStruct createTodoModelStruct({
  String? id,
  String? title,
  String? description,
  bool? isCompleted,
}) =>
    TodoModelStruct(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
