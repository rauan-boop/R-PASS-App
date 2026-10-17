import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'personal_data_manager_widget.dart' show PersonalDataManagerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalDataManagerModel
    extends FlutterFlowModel<PersonalDataManagerWidget> {
  ///  Local state fields for this page.

  String? selectedCity;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  String? _surnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'фамилия is required';
    }

    return null;
  }

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'имя is required';
    }

    return null;
  }

  // State field(s) for otchestvo widget.
  FocusNode? otchestvoFocusNode;
  TextEditingController? otchestvoTextController;
  String? Function(BuildContext, String?)? otchestvoTextControllerValidator;
  String? _otchestvoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'отчество (если нет поставьте \" - \") is required';
    }

    return null;
  }

  // State field(s) for iin widget.
  FocusNode? iinFocusNode;
  TextEditingController? iinTextController;
  String? Function(BuildContext, String?)? iinTextControllerValidator;
  String? _iinTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'ИИН is required';
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formIsValid;

  @override
  void initState(BuildContext context) {
    surnameTextControllerValidator = _surnameTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
    otchestvoTextControllerValidator = _otchestvoTextControllerValidator;
    iinTextControllerValidator = _iinTextControllerValidator;
  }

  @override
  void dispose() {
    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    otchestvoFocusNode?.dispose();
    otchestvoTextController?.dispose();

    iinFocusNode?.dispose();
    iinTextController?.dispose();
  }
}
