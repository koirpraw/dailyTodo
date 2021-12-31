import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddtaskPageWidget extends StatefulWidget {
  const AddtaskPageWidget({Key key}) : super(key: key);

  @override
  _AddtaskPageWidgetState createState() => _AddtaskPageWidgetState();
}

class _AddtaskPageWidgetState extends State<AddtaskPageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Add Task',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() => FFAppState().todoList.add(textController.text));
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBarPage(initialPage: 'todoLocal'),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.tertiaryColor,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
          child: TextFormField(
            controller: textController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'to do item',
              labelStyle: FlutterFlowTheme.bodyText1,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.tertiaryColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.tertiaryColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Color(0x3B757575),
              contentPadding: EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
            ),
            style: FlutterFlowTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
