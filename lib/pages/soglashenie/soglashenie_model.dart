import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'soglashenie_widget.dart' show SoglashenieWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SoglashenieModel extends FlutterFlowModel<SoglashenieWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (getMyIPAddress)] action in Button widget.
  ApiCallResponse? ipinfoOut;
  // Stores action output result for [Custom Action - getDeviceModel] action in Button widget.
  String? deviceinfoOut;
  // Stores action output result for [Custom Action - generateAndSaveOpenSoglashenie] action in Button widget.
  String? soglasheniePDF;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
