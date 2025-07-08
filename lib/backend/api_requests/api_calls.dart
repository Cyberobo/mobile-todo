import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start todoApi Group Code

class TodoApiGroup {
  static String getBaseUrl() =>
      'https://68650c3c5b5d8d03397f77f6.mockapi.io/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetTaskByIdCall getTaskByIdCall = GetTaskByIdCall();
  static GetComplatedTaskCall getComplatedTaskCall = GetComplatedTaskCall();
  static GetPendingTaskCall getPendingTaskCall = GetPendingTaskCall();
  static CreateTaskCall createTaskCall = CreateTaskCall();
  static UpdateTaskCall updateTaskCall = UpdateTaskCall();
  static DeleteTaskCall deleteTaskCall = DeleteTaskCall();
  static UpdateTaskStateCall updateTaskStateCall = UpdateTaskStateCall();
}

class GetTaskByIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = TodoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getTaskById',
      apiUrl: '${baseUrl}/task/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetComplatedTaskCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TodoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getComplatedTask',
      apiUrl: '${baseUrl}/task',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'is_completed': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? iscompleted(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_completed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class GetPendingTaskCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TodoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getPendingTask',
      apiUrl: '${baseUrl}/task',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'is_completed': false,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? iscompleted(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_completed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class CreateTaskCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? description = '',
  }) async {
    final baseUrl = TodoApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"title": "${escapeStringForJson(title)}",
"description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTask',
      apiUrl: '${baseUrl}/task',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTaskCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? description = '',
    String? id = '',
  }) async {
    final baseUrl = TodoApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"title": "${escapeStringForJson(title)}",
"description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateTask',
      apiUrl: '${baseUrl}/task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
}

class DeleteTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TodoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteTask',
      apiUrl: '${baseUrl}/task/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTaskStateCall {
  Future<ApiCallResponse> call({
    String? id = '',
    bool? isCompleted,
  }) async {
    final baseUrl = TodoApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "is_completed": ${isCompleted}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateTaskState',
      apiUrl: '${baseUrl}/task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End todoApi Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
