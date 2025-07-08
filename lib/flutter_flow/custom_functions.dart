import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<TodoModelStruct>? sortById(List<TodoModelStruct>? list) {
  if (list == null) return [];

  list.sort((a, b) {
    int idA = int.tryParse(a.id) ?? 0;
    int idB = int.tryParse(b.id) ?? 0;
    return idB.compareTo(idA);
  });

  return list;
}

int getCurrentId(TodoModelStruct list) {
  return int.parse(list.id);
}

String? textCharacterCountControl(String? description) {
  if (description == null) return "";

  if (description.length > 100) {
    return description.substring(0, 100) + '...';
  }

  return description;
}

bool getCurrentState(TodoModelStruct model) {
  return model.isCompleted;
}
