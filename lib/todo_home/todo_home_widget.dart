import '../components/bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoHomeWidget extends StatefulWidget {
  const TodoHomeWidget({Key key}) : super(key: key);

  @override
  _TodoHomeWidgetState createState() => _TodoHomeWidgetState();
}

class _TodoHomeWidgetState extends State<TodoHomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Todo: Task manager',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: 40,
                  child: BottomSheetWidget(),
                ),
              );
            },
          );
          setState(() => FFAppState()
              .taskName
              .add(FFAppState().taskName.length.toString()));
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.tertiaryColor,
          size: 36,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Builder(
            builder: (context) {
              final todoList = FFAppState().taskName?.toList() ?? [];
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: todoList.length,
                itemBuilder: (context, todoListIndex) {
                  final todoListItem = todoList[todoListIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: ListTile(
                      title: Text(
                        'Lorem ipsum dolor...',
                        style: FlutterFlowTheme.title3,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
