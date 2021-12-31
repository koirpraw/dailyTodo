import '../addtask_page/addtask_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoLocalWidget extends StatefulWidget {
  const TodoLocalWidget({Key key}) : super(key: key);

  @override
  _TodoLocalWidgetState createState() => _TodoLocalWidgetState();
}

class _TodoLocalWidgetState extends State<TodoLocalWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Todo: local state',
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
              final todoList = FFAppState().todoList?.toList() ?? [];
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: todoList.length,
                itemBuilder: (context, todoListIndex) {
                  final todoListItem = todoList[todoListIndex];
                  return Slidable(
                    actionPane: const SlidableScrollActionPane(),
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'delete',
                        color: Colors.blue,
                        icon: Icons.delete,
                        onTap: () async {
                          setState(
                              () => FFAppState().todoList.remove(todoListItem));
                        },
                      ),
                    ],
                    child: ListTile(
                      title: Text(
                        todoListItem,
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
