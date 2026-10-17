import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/delet_manager/delet_manager_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'companymanager_widget.dart' show CompanymanagerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanymanagerModel extends FlutterFlowModel<CompanymanagerWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in companymanager widget.
  List<ProfilesRow>? apiResultCompany;
  // Stores action output result for [Backend Call - API (getRecentCountByCompany)] action in companymanager widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
