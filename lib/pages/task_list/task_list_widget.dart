import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/crudcomponent/crudcomponent_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_list_model.dart';
export 'task_list_model.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  static String routeName = 'TaskList';
  static String routePath = '/taskList';

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget>
    with TickerProviderStateMixin {
  late TaskListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primary,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).primaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  unselectedLabelStyle: FlutterFlowTheme.of(context)
                      .titleMedium
                      .override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  tabs: [
                    Tab(
                      text: 'Complated',
                      icon: Icon(
                        Icons.task_alt_sharp,
                      ),
                    ),
                    Tab(
                      text: 'Pending',
                      icon: Icon(
                        Icons.timelapse,
                      ),
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [
                      () async {
                        _model.aaaa =
                            await TodoApiGroup.getComplatedTaskCall.call();

                        FFAppState().completedTaskList =
                            ((_model.aaaa?.jsonBody ?? '')
                                    .toList()
                                    .map<TodoModelStruct?>(
                                        TodoModelStruct.maybeFromMap)
                                    .toList() as Iterable<TodoModelStruct?>)
                                .withoutNulls
                                .toList()
                                .cast<TodoModelStruct>();
                        safeSetState(() {});

                        safeSetState(() {});
                      },
                      () async {
                        _model.bbbbb =
                            await TodoApiGroup.getPendingTaskCall.call();

                        FFAppState().pendingTaskList =
                            ((_model.bbbbb?.jsonBody ?? '')
                                    .toList()
                                    .map<TodoModelStruct?>(
                                        TodoModelStruct.maybeFromMap)
                                    .toList() as Iterable<TodoModelStruct?>)
                                .withoutNulls
                                .toList()
                                .cast<TodoModelStruct>();
                        safeSetState(() {});

                        safeSetState(() {});
                      }
                    ][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final completedTask = functions
                                      .sortById(functions
                                          .sortById(FFAppState()
                                              .completedTaskList
                                              .toList())
                                          ?.toList())
                                      ?.toList() ??
                                  [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: completedTask.length,
                                itemBuilder: (context, completedTaskIndex) {
                                  final completedTaskItem =
                                      completedTask[completedTaskIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            width: 390.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Colors.white,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                                  .checkboxValueMap1[
                                                              completedTaskItem] ??=
                                                          functions.getCurrentState(
                                                              completedTaskItem),
                                                      onChanged: !_model.isOff
                                                          ? null
                                                          : (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.checkboxValueMap1[
                                                                          completedTaskItem] =
                                                                      newValue!);

                                                              if (!newValue!) {
                                                                _model.isOff =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                _model.checkbox =
                                                                    await TodoApiGroup
                                                                        .updateTaskStateCall
                                                                        .call(
                                                                  id: functions
                                                                      .getCurrentId(
                                                                          completedTaskItem)
                                                                      .toString(),
                                                                  isCompleted:
                                                                      false,
                                                                );

                                                                _model.pendingTasks =
                                                                    await TodoApiGroup
                                                                        .getPendingTaskCall
                                                                        .call();

                                                                _model.completedTasksList =
                                                                    await TodoApiGroup
                                                                        .getComplatedTaskCall
                                                                        .call();

                                                                FFAppState()
                                                                    .pendingTaskList = ((_model.pendingTasks?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<TodoModelStruct?>(
                                                                            TodoModelStruct.maybeFromMap)
                                                                        .toList() as Iterable<TodoModelStruct?>)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .cast<TodoModelStruct>();
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .completedTaskList = ((_model.completedTasksList?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<TodoModelStruct?>(
                                                                            TodoModelStruct.maybeFromMap)
                                                                        .toList() as Iterable<TodoModelStruct?>)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .cast<TodoModelStruct>();
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .pendingTaskCount =
                                                                    FFAppState()
                                                                        .pendingTaskList
                                                                        .length;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .completedTaskCount =
                                                                    FFAppState()
                                                                        .completedTaskList
                                                                        .length;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .totalTaskCount = FFAppState()
                                                                        .completedTaskCount +
                                                                    FFAppState()
                                                                        .pendingTaskCount;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                _model.isOff =
                                                                    true;
                                                                safeSetState(
                                                                    () {});

                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                      side: (Colors.white !=
                                                              null)
                                                          ? BorderSide(
                                                              width: 2,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : null,
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor: !_model.isOff
                                                          ? null
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              completedTaskItem
                                                                  .title,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.textCharacterCountControl(
                                                                    completedTaskItem
                                                                        .description),
                                                                'null',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  enableDrag: false,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            CrudcomponentWidget(
                                                          index: functions
                                                              .getCurrentId(
                                                                  completedTaskItem),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Icon(
                                                Icons.keyboard_control,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final pendingTask = functions
                                      .sortById(functions
                                          .sortById(FFAppState()
                                              .pendingTaskList
                                              .toList())
                                          ?.toList())
                                      ?.toList() ??
                                  [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: pendingTask.length,
                                itemBuilder: (context, pendingTaskIndex) {
                                  final pendingTaskItem =
                                      pendingTask[pendingTaskIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            width: 390.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          Colors.white,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                                  .checkboxValueMap2[
                                                              pendingTaskItem] ??=
                                                          functions
                                                              .getCurrentState(
                                                                  pendingTaskItem),
                                                      onChanged: !_model.isOn
                                                          ? null
                                                          : (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.checkboxValueMap2[
                                                                          pendingTaskItem] =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                _model.isOn =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                _model.apiResultrll =
                                                                    await TodoApiGroup
                                                                        .updateTaskStateCall
                                                                        .call(
                                                                  id: functions
                                                                      .getCurrentId(
                                                                          pendingTaskItem)
                                                                      .toString(),
                                                                  isCompleted:
                                                                      true,
                                                                );

                                                                _model.pendingTaskList =
                                                                    await TodoApiGroup
                                                                        .getPendingTaskCall
                                                                        .call();

                                                                _model.completedTasks =
                                                                    await TodoApiGroup
                                                                        .getComplatedTaskCall
                                                                        .call();

                                                                FFAppState()
                                                                    .pendingTaskList = ((_model.pendingTaskList?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<TodoModelStruct?>(
                                                                            TodoModelStruct.maybeFromMap)
                                                                        .toList() as Iterable<TodoModelStruct?>)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .cast<TodoModelStruct>();
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .completedTaskList = ((_model.completedTasks?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<TodoModelStruct?>(
                                                                            TodoModelStruct.maybeFromMap)
                                                                        .toList() as Iterable<TodoModelStruct?>)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .cast<TodoModelStruct>();
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .completedTaskCount =
                                                                    FFAppState()
                                                                        .completedTaskList
                                                                        .length;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .pendingTaskCount =
                                                                    FFAppState()
                                                                        .pendingTaskList
                                                                        .length;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .totalTaskCount = FFAppState()
                                                                        .completedTaskCount +
                                                                    FFAppState()
                                                                        .pendingTaskCount;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                _model.isOn =
                                                                    true;
                                                                safeSetState(
                                                                    () {});

                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                      side: (Colors.white !=
                                                              null)
                                                          ? BorderSide(
                                                              width: 2,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : null,
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor: !_model.isOn
                                                          ? null
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              pendingTaskItem
                                                                  .title,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.textCharacterCountControl(
                                                                    pendingTaskItem
                                                                        .description),
                                                                'null',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    enableDrag: false,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              CrudcomponentWidget(
                                                            index: functions
                                                                .getCurrentId(
                                                                    pendingTaskItem),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Icon(
                                                  Icons.keyboard_control,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
