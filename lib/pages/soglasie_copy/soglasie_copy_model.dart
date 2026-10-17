import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'soglasie_copy_widget.dart' show SoglasieCopyWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SoglasieCopyModel extends FlutterFlowModel<SoglasieCopyWidget> {
  ///  Local state fields for this page.

  String? signatureOutput;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (getMyIPAddress)] action in Button widget.
  ApiCallResponse? ipout;
  // Stores action output result for [Custom Action - getDeviceModel] action in Button widget.
  String? modelOut;
  // Stores action output result for [Custom Action - generateAndSaveOpenPdfCopy] action in Button widget.
  bool? pdfPath;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future signature(BuildContext context) async {
    FFAppState().searshFIO = signatureOutput!;
  }
}
