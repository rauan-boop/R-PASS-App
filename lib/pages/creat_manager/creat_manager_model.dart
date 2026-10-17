import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'creat_manager_widget.dart' show CreatManagerWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatManagerModel extends FlutterFlowModel<CreatManagerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for surname widget.
  FocusNode? surnameFocusNode1;
  TextEditingController? surnameTextController1;
  String? Function(BuildContext, String?)? surnameTextController1Validator;
  String? _surnameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'заполните поле';
    }
    return null;
  }

  // State field(s) for surname widget.
  FocusNode? surnameFocusNode2;
  TextEditingController? surnameTextController2;
  String? Function(BuildContext, String?)? surnameTextController2Validator;
  String? _surnameTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'login is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'заполните поле';
    }
    return null;
  }

  // State field(s) for number_pfone widget.
  FocusNode? numberPfoneFocusNode;
  TextEditingController? numberPfoneTextController;
  String? Function(BuildContext, String?)? numberPfoneTextControllerValidator;
  String? _numberPfoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '+7 is required';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'заполните поле';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formIsValid;
  // Stores action output result for [Backend Call - API (createNewManager)] action in Button widget.
  ApiCallResponse? managerDataOut;

  @override
  void initState(BuildContext context) {
    surnameTextController1Validator = _surnameTextController1Validator;
    surnameTextController2Validator = _surnameTextController2Validator;
    numberPfoneTextControllerValidator = _numberPfoneTextControllerValidator;
  }

  @override
  void dispose() {
    surnameFocusNode1?.dispose();
    surnameTextController1?.dispose();

    surnameFocusNode2?.dispose();
    surnameTextController2?.dispose();

    numberPfoneFocusNode?.dispose();
    numberPfoneTextController?.dispose();
  }
}
