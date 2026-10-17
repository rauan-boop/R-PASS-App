import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'po_udostovereniu_widget.dart' show PoUdostovereniuWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PoUdostovereniuModel extends FlutterFlowModel<PoUdostovereniuWidget> {
  ///  Local state fields for this page.

  List<String> uploadedPhotos = [];
  void addToUploadedPhotos(String item) => uploadedPhotos.add(item);
  void removeFromUploadedPhotos(String item) => uploadedPhotos.remove(item);
  void removeAtIndexFromUploadedPhotos(int index) =>
      uploadedPhotos.removeAt(index);
  void insertAtIndexInUploadedPhotos(int index, String item) =>
      uploadedPhotos.insert(index, item);
  void updateUploadedPhotosAtIndex(int index, Function(String) updateFn) =>
      uploadedPhotos[index] = updateFn(uploadedPhotos[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  String? _surnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for otchestvo widget.
  FocusNode? otchestvoFocusNode;
  TextEditingController? otchestvoTextController;
  String? Function(BuildContext, String?)? otchestvoTextControllerValidator;
  String? _otchestvoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for IIN widget.
  FocusNode? iinFocusNode;
  TextEditingController? iinTextController;
  String? Function(BuildContext, String?)? iinTextControllerValidator;
  String? _iinTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }

    return null;
  }

  // State field(s) for numberphone widget.
  FocusNode? numberphoneFocusNode;
  TextEditingController? numberphoneTextController;
  String? Function(BuildContext, String?)? numberphoneTextControllerValidator;
  String? _numberphoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '+7... is required';
    }

    return null;
  }

  // State field(s) for summa widget.
  FocusNode? summaFocusNode;
  TextEditingController? summaTextController;
  String? Function(BuildContext, String?)? summaTextControllerValidator;
  String? _summaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for opisanie widget.
  FocusNode? opisanieFocusNode;
  TextEditingController? opisanieTextController;
  String? Function(BuildContext, String?)? opisanieTextControllerValidator;
  String? _opisanieTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading_uploadDataK0p = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataK0p = [];
  List<String> uploadedFileUrls_uploadDataK0p = [];

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formIsValid;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BlBlacklistRow? newRecord;
  // Stores action output result for [Custom Action - convertListToJsonString] action in Button widget.
  dynamic? photoUrlsAsJsonString;

  @override
  void initState(BuildContext context) {
    surnameTextControllerValidator = _surnameTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
    otchestvoTextControllerValidator = _otchestvoTextControllerValidator;
    iinTextControllerValidator = _iinTextControllerValidator;
    numberphoneTextControllerValidator = _numberphoneTextControllerValidator;
    summaTextControllerValidator = _summaTextControllerValidator;
    opisanieTextControllerValidator = _opisanieTextControllerValidator;
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

    numberphoneFocusNode?.dispose();
    numberphoneTextController?.dispose();

    summaFocusNode?.dispose();
    summaTextController?.dispose();

    opisanieFocusNode?.dispose();
    opisanieTextController?.dispose();
  }
}
