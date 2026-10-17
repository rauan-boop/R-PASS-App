import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'glavnaya_widget.dart' show GlavnayaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GlavnayaModel extends FlutterFlowModel<GlavnayaWidget> {
  ///  Local state fields for this page.

  int? recordsCount;

  int? companiesCount;

  int? recentCount;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in glavnaya widget.
  List<ProfilesRow>? profilOut;
  // Stores action output result for [Backend Call - API (getBlacklistCount)] action in glavnaya widget.
  ApiCallResponse? apiResultCount;
  // Stores action output result for [Backend Call - API (getCompaniesCount)] action in glavnaya widget.
  ApiCallResponse? apiResultCompanies;
  // Stores action output result for [Backend Call - API (getRecentBlacklistCount)] action in glavnaya widget.
  ApiCallResponse? apiResultRecentCount;
  // Stores action output result for [Backend Call - Query Rows] action in glavnaya widget.
  List<UserAndCompanyDetailsRow>? companyDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
