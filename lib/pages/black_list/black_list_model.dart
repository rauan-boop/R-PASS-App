import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'black_list_widget.dart' show BlackListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlackListModel extends FlutterFlowModel<BlackListWidget> {
  ///  Local state fields for this page.

  List<BlBlacklistRow> searchresultats = [];
  void addToSearchresultats(BlBlacklistRow item) => searchresultats.add(item);
  void removeFromSearchresultats(BlBlacklistRow item) =>
      searchresultats.remove(item);
  void removeAtIndexFromSearchresultats(int index) =>
      searchresultats.removeAt(index);
  void insertAtIndexInSearchresultats(int index, BlBlacklistRow item) =>
      searchresultats.insert(index, item);
  void updateSearchresultatsAtIndex(
          int index, Function(BlBlacklistRow) updateFn) =>
      searchresultats[index] = updateFn(searchresultats[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField2 widget.
  FocusNode? searchField2FocusNode;
  TextEditingController? searchField2TextController;
  String? Function(BuildContext, String?)? searchField2TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchField2FocusNode?.dispose();
    searchField2TextController?.dispose();
  }
}
