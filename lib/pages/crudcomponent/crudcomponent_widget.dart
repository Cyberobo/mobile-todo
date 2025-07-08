import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/edit/edit_widget.dart';
import '/pages/read/read_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crudcomponent_model.dart';
export 'crudcomponent_model.dart';

class CrudcomponentWidget extends StatefulWidget {
  const CrudcomponentWidget({
    super.key,
    required this.index,
  });

  final int? index;

  @override
  State<CrudcomponentWidget> createState() => _CrudcomponentWidgetState();
}

class _CrudcomponentWidgetState extends State<CrudcomponentWidget> {
  late CrudcomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrudcomponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 254.43,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) => FFButtonWidget(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: EditWidget(
                          index: widget.index!,
                        ),
                      );
                    },
                  );
                },
                text: 'Edit',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.poppins(
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: ReadWidget(
                            index: widget.index!,
                          ),
                        );
                      },
                    );
                  },
                  text: 'Read',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  _model.apiResulteh3 = await TodoApiGroup.deleteTaskCall.call(
                    id: widget.index,
                  );

                  if ((_model.apiResulteh3?.succeeded ?? true)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Task deleted successfully!',
                          style: GoogleFonts.poppins(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0xFF5ADA40),
                      ),
                    );
                    _model.pendingTasks =
                        await TodoApiGroup.getPendingTaskCall.call();

                    FFAppState().pendingTaskList = ((_model
                                    .pendingTasks?.jsonBody ??
                                '')
                            .toList()
                            .map<TodoModelStruct?>(TodoModelStruct.maybeFromMap)
                            .toList() as Iterable<TodoModelStruct?>)
                        .withoutNulls
                        .toList()
                        .cast<TodoModelStruct>();
                    FFAppState().update(() {});
                    FFAppState().pendingTaskCount =
                        FFAppState().pendingTaskList.length;
                    FFAppState().update(() {});
                    _model.completedTasks =
                        await TodoApiGroup.getComplatedTaskCall.call();

                    FFAppState().completedTaskList = ((_model
                                    .completedTasks?.jsonBody ??
                                '')
                            .toList()
                            .map<TodoModelStruct?>(TodoModelStruct.maybeFromMap)
                            .toList() as Iterable<TodoModelStruct?>)
                        .withoutNulls
                        .toList()
                        .cast<TodoModelStruct>();
                    FFAppState().update(() {});
                    FFAppState().completedTaskCount =
                        FFAppState().completedTaskList.length;
                    FFAppState().update(() {});
                    FFAppState().completedTaskCount =
                        FFAppState().completedTaskCount +
                            FFAppState().pendingTaskCount;
                    FFAppState().update(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Task could not be deleted!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }

                  context.safePop();

                  safeSetState(() {});
                },
                text: 'Delete',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFC92020),
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.poppins(
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
