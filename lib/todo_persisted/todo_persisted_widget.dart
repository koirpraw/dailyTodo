import '../addtask_page/addtask_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoPersistedWidget extends StatefulWidget {
  const TodoPersistedWidget({Key key}) : super(key: key);

  @override
  _TodoPersistedWidgetState createState() => _TodoPersistedWidgetState();
}

class _TodoPersistedWidgetState extends State<TodoPersistedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Todo: Persisted',
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
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddtaskPageWidget(),
            ),
          );
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
              final persistedTodoList =
                  FFAppState().persistedTodo?.toList() ?? [];
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: persistedTodoList.length,
                itemBuilder: (context, persistedTodoListIndex) {
                  final persistedTodoListItem =
                      persistedTodoList[persistedTodoListIndex];
                  return Slidable(
                    actionPane: const SlidableScrollActionPane(),
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'delete',
                        color: Colors.blue,
                        icon: Icons.delete,
                        onTap: () {
                          print('SlidableActionWidget pressed ...');
                        },
                      ),
                    ],
                    child: ListTile(
                      title: Text(
                        persistedTodoListItem,
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
