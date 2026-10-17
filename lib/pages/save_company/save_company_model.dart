import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'save_company_widget.dart' show SaveCompanyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SaveCompanyModel extends FlutterFlowModel<SaveCompanyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for login widget.
  FocusNode? loginFocusNode;
  TextEditingController? loginTextController;
  String? Function(BuildContext, String?)? loginTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for company_name widget.
  FocusNode? companyNameFocusNode1;
  TextEditingController? companyNameTextController1;
  String? Function(BuildContext, String?)? companyNameTextController1Validator;
  // State field(s) for company_name widget.
  FocusNode? companyNameFocusNode2;
  TextEditingController? companyNameTextController2;
  String? Function(BuildContext, String?)? companyNameTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    loginFocusNode?.dispose();
    loginTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    companyNameFocusNode1?.dispose();
    companyNameTextController1?.dispose();

    companyNameFocusNode2?.dispose();
    companyNameTextController2?.dispose();
  }
}
