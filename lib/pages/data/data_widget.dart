import '/auth/supabase_auth/auth_util.dart';
import '/components/brand/brand_widgets.dart';
import '/config/app_colors.dart';
import '/config/app_config.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/update_password/update_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data_model.dart';
export 'data_model.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({super.key});

  static String routeName = 'data';
  static String routePath = '/data';

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  late DataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.updateOut = await BlUpdateTable().queryRows(
        queryFn: (q) => q,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.bg,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.85,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [AppColors.cardShadow],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder<List<ProfilesRow>>(
                        future: ProfilesTable().querySingleRow(
                          queryFn: (q) => q.eqOrNull(
                            'id',
                            currentUserUid,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: SpinKitCircle(
                                  color: AppColors.primary,
                                  size: 80.0,
                                ),
                              ),
                            );
                          }
                          List<ProfilesRow> containerProfilesRowList =
                              snapshot.data!;

                          final containerProfilesRow =
                              containerProfilesRowList.isNotEmpty
                                  ? containerProfilesRowList.first
                                  : null;

                          return Container(
                            width: double.infinity,
                            height: 503.37,
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              boxShadow: [AppColors.cardShadow],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(errorBuilder: rpassImageFallback,
                                            valueOrDefault<String>(
                                              containerProfilesRow?.pfoto,
                                              '${AppConfig.flutterFlowAssetsBaseUrl}/1z887tjlhzbz/i_(1).webp',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    containerProfilesRow?.name,
                                                    'имя',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.manrope(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  containerProfilesRow?.surname,
                                                  'фамилия',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Text(
                                                  currentUserEmail,
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.manrope(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color: FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 5.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          containerProfilesRow?.role,
                                          'роль',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().polzRoll != 'manager')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              CreatManagerWidget.routeName);
                                        },
                                        text: 'Добавить менеджера',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF8896EA),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: AppColors.border,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    FFAppState().polzRoll == 'super_admin',
                                    false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              CreateAccount1Widget.routeName);
                                        },
                                        text: 'Добавить администратора',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 30.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF8896EA),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: AppColors.border,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  if ((FFAppState().polzRoll == 'admin') &&
                                      (FFAppState().polzRoll == 'super_admin'))
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 200.0,
                                                  child: UpdatePasswordWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF57636C),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Сменить пароль',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().polzRoll == 'super_admin')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              BlackListArhiveWidget.routeName);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF57636C),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Архив клиентов',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.manrope(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().polzRoll == 'super_admin')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ArhiveCompanyWidget.routeName);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF57636C),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Архив компаний',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.manrope(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().polzRoll == 'super_admin')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ManagerArhiveWidget.routeName);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF57636C),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Архив менеджеров',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.manrope(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            containerProfilesRow!.soglasieDoc!);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF57636C),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Согласие на обработку данных',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(containerProfilesRow!
                                            .soglashenieDoc!);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF57636C),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Пользовательское соглашение',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            NotificationWidget.routeName);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF57636C),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Уведомления',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            OPrilozheniiWidget.routeName);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF57636C),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'О приложении',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            AppConfig.telegramSupportUrl);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF57636C),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Администрация',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed(SupportWidget.routeName);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF57636C),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Sapport',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: Container(
                          width: double.infinity,
                          height: 146.51,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            boxShadow: [AppColors.cardShadow],
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 0.0),
                                  child: Text(
                                    'Версия № 1.3.1',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: AppColors.ink,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 0.0),
                                  child: Text(
                                    'Правообладатель: автопрокат \n\"RONAT-Astana\"',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: AppColors.ink,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 15.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await ProfilesTable().delete(
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            currentUserUid,
                                          ),
                                        );
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            LogInWidget.routeName,
                                            context.mounted);
                                      },
                                      child: Text(
                                        'Удалить аккаунт',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFE91E23),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().polzCity = '';
                                        FFAppState().polzCompany = '';
                                        FFAppState().polzSurname = '';
                                        FFAppState().polzName = '';
                                        FFAppState().polzIIN = '';
                                        FFAppState().polzPfone = '';
                                        FFAppState().polzRoll = '';
                                        FFAppState().polzEmail = '';
                                        FFAppState().polzID = '';
                                        FFAppState().polzPersonalData = false;
                                        FFAppState().blIDcard = '';
                                        FFAppState().blPfoto = [];
                                        FFAppState().DateVydachi = null;
                                        FFAppState().idCardBL = '';
                                        FFAppState().Soglasie = false;
                                        FFAppState().polzOtchestvo = '';
                                        FFAppState().soglashenie = false;
                                        FFAppState().textSoglasie =
                                            '\"\"\"\n[DATE]\n\n      В соответствии с Законом Республики Казахстан от 21 мая 2013 года №94-V «О персональных данных и их защите» и иными законами и актами Республики Казахстан (далее – Закон),  я, [USER_SURNAME] [USER_NAME] [USER_OTCHESTVO], ИИН - [USER_IIN], пользователь мобильного приложения \"R-PASS\" (далее - Сервис) даю свое согласие ИП \"RONAT-Astana\" (далее - Оператор) на обработку моих персональных данных, не противоречащими законодательству Республики Казахстан способами, в той мере насколько это необходимо.\n\n      1. Перечень персональных данных\n    Обработка распространяется на следующие категории персональных данных:\n    Идентификационные данные: фамилия, имя, отчество, ИИН, реквизиты документа, удостоверяющего личность.\n    Контактные данные: номера телефонов, адрес электронной почты, иные контактные сведения.\n    Технические данные: IP-адрес, файлы cookie, данные о геолокации, иные автоматически собираемые сведения при использовании Сервиса.\n    Прочие сведения, необходимые для функционирования Сервиса и формирования документов в соответствии с законодательством Республики Казахстан.\n\n      2. Цели обработки персональных данных\n    обеспечение регистрации и доступа к Сервису;\n    взаимодействие с Пользователем (уведомления, запросы, техническая поддержка);\n    улучшение качества и функционала Сервиса;\n    проведение аналитических и статистических исследований на основе обезличенных данных;\n    исполнение требований законодательства Республики Казахстан.\n\n    3. Действия с персональными данными\n Оператор вправе осуществлять следующие операции:\nсбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (в т.ч. предоставление или доступ), обезличивание, блокирование, удаление и уничтожение персональных данных — с применением средств автоматизации или без них.\n\n      4. Дополнительные условия\n    Настоящее согласие предоставляется в электронной форме при регистрации на Сервисе.\n    Новая редакция Согласия вступает в силу с момента её размещения в Сервисе.\n    Пользователь обязуется самостоятельно отслеживать изменения Согласия в актуальной версии.\n    Оператор гарантирует принятие необходимых организационных и технических мер по защите персональных данных.\n\n      5. Срок дествия согласия:\n    Настоящее Согласие действует с момента его предоставления и в течение всего срока использования мною Сервиса, а также в течение  3 (трех) лет после прекращения использования Сервиса, если иное не предусмотрено законодательством РК.\n\n      6. Порядок отзыва согласия:\n    Я проинформирован(а) о том, что настоящее согласие может быть отозвано мною в любое время путем направления письменного уведомления Оператору по адресу электронной почты: ronat.astana@gmail.com. Отзыв согласия не влияет на законность обработки, основанной на согласии до его отзыва.\n\n      7. Подтверждение:\n    Нажимая кнопку «Зарегистрироваться» и/или устанавливая галочку в соответствующем поле, я подтверждаю, что:\n- я внимательно и в полном объеме ознакомился(ась) с настоящим Согласием.\n- все положения настоящего Согласия мне понятны.\n- я даю свое согласие на обработку моих персональных данных без каких-либо оговорок и ограничений.\n\n      Я, [USER_SURNAME]  [USER_NAME],  подтверждаю, что документ был представлен мне  через мобильное приложение \"R-PASS\", с документом ознакомлен и  согласен (что подтверждает наличие настоящего документа в PDF формате) \n\"\"\"';
                                        FFAppState().IDCompany = '';
                                        FFAppState().blPfotoSingl = '';
                                        FFAppState().textSoglashenie =
                                            '\"\"\"\n   Пользовательское соглашение  \n   (Публичная оферта) \n\nЭтот документ администратор компании принимает при регистрации. Он регулирует правила пользования сервисом.\n\nРеспублика Казахстан\nг. Астана\nДата последнего обновления: 08.09.2025 г.\n\n    Настоящее Пользовательское соглашение (далее – «Соглашение») является публичной офертой мобильного приложения \"R-PASS \", именуемого в дальнейшем «Платформа», в лице Администратора, действующего на основании доверенности, и адресовано любому юридическому лицу или индивидуальному предпринимателю, именуемому в дальнейшем «Пользователь», выразившему готовность воспользоваться услугами Платформы.\n     \n      1. ТЕРМИНЫ И ОПРЕДЕЛЕНИЯ \n    1.1. Платформа — мобильное приложение «R-PASS », предназначена для внутреннего обмена информацией между компаниями, осуществляющими деятельность в сфере аренды автомобилей. \nСистема используется для фиксации фактов нарушений условий аренды со стороны клиентов и предотвращения повторных нарушений.\n    1.2 Владелец Приложения (далее - Владелец) - ИП \"RONAT-Astana\".\n    1.3. Пользователь — юридическое лицо или ИП, прошедшее процедуру верификации и регистрации, в лице его уполномоченного представителя (Администратора) принявшее условия настоящего Соглашения. \n    1.4. Администратор — уполномоченный представитель Пользователя, чья личность и полномочия были подтверждены Платформой (доверенностью). \n    1.5. Контент — любая информация, включая персональные данные третьих лиц (клиентов автопроката), текстовые описания, фотографии и иные материалы, размещаемые Пользователем на Платформе. \n    1.6. Учетная запись — персональная область Пользователя на Платформе, доступ к которой осуществляется с помощью логина и пароля.\n\n      2. ПРЕДМЕТ СОГЛАШЕНИЯ \n    2.1. Платформа предоставляет Пользователю неисключительное право использования функционала Платформы на условиях бесплатной (платной) подписки. \n    2.2. Пользователь обязуется использовать Платформу в соответствии с условиями настоящего Соглашения и действующим законодательством Республики Казахстан. \n    2.3. Акцептом настоящей оферты является завершение процедуры регистрации и оплаты подписки Пользователем.\n\n      3. РЕГИСТРАЦИЯ И ВЕРИФИКАЦИЯ \n    3.1. Для регистрации на Платформе представитель Пользователя обязан предоставить Платформе документы, подтверждающие его статус и полномочия (свидетельство о регистрации ИП/ТОО, приказ о назначении и т.д.). \n    3.2. Регистрация осуществляется Платформой в ручном режиме после проверки предоставленных документов. Платформа оставляет за собой право отказать в регистрации без объяснения причин.\n    3.3. После успешной верификации Платформа предоставляет Администратору данные для  доступа к Учетной записи. \n    3.4. Пользователь самостоятельно регистрирует своих сотрудников (Менеджеров) и несет полную административную и другую ответственность за их действия на Платформе, как за свои собственные.\n\n      4. ПРАВА И ОБЯЗАННОСТИ СТОРОН \n    4.1. Пользователь обязуется: \n  4.1.1. Предоставлять достоверные сведения при регистрации. \n  4.1.2. Своевременно оплачивать подписку согласно тарифам Платформы. \n  4.1.3. Нести полную и единоличную ответственность за размещаемый им Контент, его соответствие законодательству РК, достоверность и точность. \n  4.1.4. Гарантировать Платформе, что на размещение персональных данных третьих лиц (клиентов) в Контенте им было получено соответствующее письменное согласие этих лиц, как того требует Закон РК «О персональных данных и их защите». \n  4.1.5. Не передавать данные доступа к Учетной записи третьим лицам. \n    4.2. Платформа имеет право: \n  4.2.1. Временно заблокировать доступ Пользователя к Платформе в случае нарушения условий настоящего Соглашения или несвоевременной оплаты. \n  4.2.2. Удалять Контент или блокировать Учетные записи, нарушающие законодательство РК или права третьих лиц, без предварительного уведомления. \n  4.2.3. В одностороннем порядке изменять условия настоящего Соглашения и тарифы, уведомив Пользователей путем публикации новой версии на Платформе.\n    4.2.4. Платформа вправе вносить изменения в функционал приложения, интерфейс, структуру данных и иные компоненты без предварительного уведомления Пользователей.\n\n      5. ОГРАНИЧЕНИЕ ОТВЕТСТВЕННОСТИ (КЛЮЧЕВОЙ ПУНКТ) \n    5.1. Платформа предоставляется на условиях \"КАК ЕСТЬ\" (\"AS IS\"). Платформа не несет ответственности за достоверность, точность и законность Контента, размещаемого Пользователями. \n    5.2. Платформа является лишь информационным посредником и не несет ответственности за любые убытки, ущерб (включая упущенную выгоду) или вред чести, достоинству и деловой репутации, возникшие у Пользователей или третьих лиц в результате использования или невозможности использования Платформы. \n    5.3. Вся ответственность за содержание Контента и возможные претензии со стороны клиентов или государственных органов лежит исключительно на Пользователе, разместившем данный Контент. \n    5.4. Пользователь обязуется возместить Платформе убытки и расходы (включая разумные расходы на юридическую помощь), которые Платформа может понести в результате претензий третьих лиц, связанных с Контентом, размещённым данным Пользователем, в пределах, допускаемых действующим законодательством Республики Казахстан.\n\n      6.  Ответственность сторон\n    6.1.  В случае нарушения условий настоящего Соглашения, повлекшего причинение вреда всем или одной из сторон Соглашения, виновная сторона несет ответственность в соответствии с законодательством Республики Казахстан.\n    6.2.  Администратор не несет ответственности за технические временные сбои и перерывы в работе Приложения и его компонентах, возникшие по независящим от Администратора, Владельца причинам или в случае проведения плановых или внеплановых мероприятий по обслуживанию Приложения и его компонентов.\n    6.3.  Владелец и Администратор не несут ответственности за временные сбои и перерывы в работе линий связи, иные аналогичные сбои, а также за неполадки компьютера, мобильного устройства связи, с которого Пользователь осуществляет доступ к Порталу и его компонентам.\n    6.4.  Владелец и Администратор не несут ответственности перед Пользователем за действия других Пользователей, и любых других участников Приложения и его компонентов.\n    6.5.  Владелец и Администратор не несут ответственности за любой прямой, косвенный ущерб, включая упущенную выгоду, ущерб от использования, потерю данных или какие-либо другие нематериальные потери, ущерб репутации и иной ущерб, возникающий вследствие:\n  1) пользования или невозможности пользования Приложения, и его компонентами Пользователями;\n  2) изменения условий Соглашения Владельцем и (или) Администратором;\n\n      7. ФИНАНСОВЫЕ УСЛОВИЯ \n    7.1. Стоимость подписки определяется тарифами, указанными на Платформе. \n    7.2. Оплата производится на основании выставленного счета или путем перевода на указанные реквизиты. \n    7.3. В случае отсутствия оплаты, доступ к Платформе блокируется до момента поступления средств.\n\n      8.  СРОК ДЕЙСТВИЯ И РАСТРЖЕНИЯ ПОЛЬЗОВАТЕЛЬСКОГО СОГЛАШЕНИЯ\n    8.1.  Срок действия. Данное Соглашение начинает действовать в день, когда вы его примите (как описано в преамбуле выше) и действует пока вы используете Приложение, если не будет прекращено раньше в соответствии с данным Соглашением. \n    8.2.  Несмотря на вышесказанное, вы настоящим подтверждаете и соглашаетесь, что данное соглашение вступает в силу по наступлении события, которое случится первым (a) день, когда вы впервые использовали Приложение или (b) день, когда вы приняли данное Соглашение, которое остаётся в силе пока вы используете Приложение, если не будет прекращено раньше в соответствии с данным Соглашением.\n    8.3.  Расторжение с вашей стороны. Если вы хотите расторгнуть данное Соглашение, вы можете это сделать, просто удалив Приложение со своего мобильного устройства. После удаления Соглашение будет иметь силу в течении 1 (одного) года.\n    8.4.  Последствия расторжения. Расторжение данного Соглашения требует от вас удаления Приложения и полного прекращения его использования.  Все положения данного Соглашения, которые по своему характеру должны сохраняться, остаются в силе после расторжения, включая, в частности, положения о праве собственности, отказ от гарантийных обязательств и ограничение ответственности.\n    8.5.  Данное Приложение предназначено для использования только на территории Республики Казахстан. ИП \"RONAT-Astana\" не даёт никаких заверений, что Приложение будет работать в других странах.\n    8.6. Владелец Платформы имеет право в одностороннем порядке расторгнуть настоящее Соглашение и заблокировать доступ Пользователя в случае нарушения условий Соглашения, размещения недостоверной информации, либо злоупотребления функционалом Платформы.\n\n      9.  Прочие положения\n    9.1.  Все возможные споры, вытекающие из настоящего Соглашения или связанные с ним, подлежат разрешению в соответствии с действующим законодательством Республики Казахстан.\n    9.2.  Бездействие со стороны Администратора в случае нарушения кем-либо из Пользователей положений Соглашения не лишает Владельца права предпринять позднее соответствующие действия в защиту своих интересов и защиту имущественных и неимущественных прав на охраняемые в соответствии с законодательством материалы Приложения.\n    9.3.  Никакие советы или информация, полученные устно или письменно от ИП \"RONAT-Astana\" или посредством приложения, не создают никаких гарантий.\n    9.4.  Форс-мажор. ИП \"RONAT-Astana\" не несёт ответственности за любые задержки или неисполнение, вызванные причинами, находящимися вне разумного контроля, включая, помимо прочего, стихийные бедствия, войны, терроризм, беспорядки, эмбарго, действия гражданских или военных властей, пожары, наводнения, несчастные случаи, забастовки или нехватку транспортных средств, топлива, энергии, рабочей силы или материалов.\n    9.5.  Вопросы, жалобы, претензии. Если у вас имеются какие-либо вопросы, жалобы или претензии в отношении данного Приложения, вы можете связаться с нами написав на ronat.astana@gmail.com\n    9.6.  Отказ от осуществления прав. Любой отказ или неисполнение какого-либо положения настоящего Соглашения в одном случае не будет считаться отказом от любого другого положения или такого положения в любом другом случае.\n\n      10. КОНФИДИЦИАЛЬНОСТЬ И ЗАЩИТА ДАННЫХ\n    10.1. Владелец и Платформа обрабатывают персональные данные Пользователей и их клиентов исключительно в целях функционирования Платформы, в соответствии с Законом Республики Казахстан «О персональных данных и их защите».\n    10.2. Платформа обязуется принимать все разумные меры для защиты персональных данных от несанкционированного доступа, изменения, раскрытия или уничтожения.\n     10.3. Пользователь, размещая персональные данные третьих лиц (клиентов), подтверждает получение их согласия на обработку и передачу данных в рамках использования Платформы.\n\n      11. ЗАКЛЮЧИТЕЛЬНЫЕ ПОЛОЖЕНИЯ \n    11.1. Все споры и разногласия решаются путем переговоров. В случае невозможности достижения согласия, споры передаются на рассмотрение в Специализированный межрайонный экономический суд города Астаны. \n    11.2. Во всем, что не урегулировано настоящим Соглашением, стороны руководствуются действующим законодательством Республики Казахстан.\n    11.3. Принятие условий настоящего Соглашения посредством интерфейса приложения является эквивалентом подписания бумажного экземпляра собственноручной подписью, в соответствии со статьёй 396 Гражданского кодекса Республики Казахстан.\n    \n    Данное соглашение было подписанно [USER_SURNAME] [USER_NAME] [USER_OTCHESTVO], ИИН: [USER_IIN], тел: [USER_PFONE], по средствам мобильного устройства. \n\"\"\"';
                                        FFAppState().usercompani = '';
                                        FFAppState().datePodpiski = null;
                                        safeSetState(() {});
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            LogInWidget.routeName,
                                            context.mounted);
                                      },
                                      text: 'Выйти',
                                      icon: Icon(
                                        Icons.exit_to_app,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 200.0,
                                        height: 30.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFEF393C),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Text(
              'Данные \nпользователя',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: AppColors.ink,
                    fontSize: 25.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.settings_rounded,
                  color: AppColors.ink,
                  size: 30.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          toolbarHeight: 70.0,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bg,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: FutureBuilder<List<ProfilesRow>>(
                        future: ProfilesTable().querySingleRow(
                          queryFn: (q) => q.eqOrNull(
                            'id',
                            currentUserUid,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: SpinKitCircle(
                                  color: AppColors.primary,
                                  size: 80.0,
                                ),
                              ),
                            );
                          }
                          List<ProfilesRow> columnProfilesRowList =
                              snapshot.data!;

                          final columnProfilesRow =
                              columnProfilesRowList.isNotEmpty
                                  ? columnProfilesRowList.first
                                  : null;

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetSignedUrlCall.call(
                                      authToken: 'documents',
                                      userId: 'blacklist/docs',
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 80.0,
                                            height: 80.0,
                                            child: SpinKitCircle(
                                              color: AppColors.primary,
                                              size: 80.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final circleImageGetSignedUrlResponse =
                                          snapshot.data!;

                                      return Container(
                                        width: 200.0,
                                        height: 200.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(errorBuilder: rpassImageFallback,
                                          valueOrDefault<String>(
                                            columnProfilesRow?.pfoto,
                                            '${AppConfig.flutterFlowAssetsBaseUrl}/1z887tjlhzbz/i_(1).webp',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          storageFolderPath: 'blacklist/docs',
                                          imageQuality: 70,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataA7o =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: 'documents',
                                              selectedFiles: selectedMedia,
                                            );
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading_uploadDataA7o =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataA7o =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_uploadDataA7o =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            safeSetState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }

                                        await ProfilesTable().update(
                                          data: {
                                            'pfoto': _model
                                                .uploadedFileUrl_uploadDataA7o,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            currentUserUid,
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: AppColors.ink,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 10.0, 5.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Visibility(
                                      visible: _model
                                              .updateOut?.firstOrNull?.acteve ==
                                          true,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Доступно обновление',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.manrope(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Версия 1.0.2',
                                            options: FFButtonOptions(
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFEFBC39),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.manrope(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        columnProfilesRow?.name,
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        columnProfilesRow?.surname,
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        columnProfilesRow?.email,
                                        'email',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: AppColors.border,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Город',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          columnProfilesRow?.cityName,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Компания',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          columnProfilesRow?.companyName,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Роль',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          columnProfilesRow?.role,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ИИН',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          columnProfilesRow?.iin,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: AppColors.border,
                                ),
                                if (FFAppState().polzRoll != 'manager')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Менеджеры:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (FFAppState().polzRoll != 'manager')
                                  Container(
                                    width: double.infinity,
                                    height: 358.3,
                                    decoration: BoxDecoration(
                                      color: AppColors.surface,
                                      boxShadow: [AppColors.cardShadow],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: FutureBuilder<List<ProfilesRow>>(
                                      future: ProfilesTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'company_id',
                                              FFAppState().IDCompany,
                                            )
                                            .eqOrNull(
                                              'role',
                                              'manager',
                                            )
                                            .eqOrNull(
                                              'active',
                                              true,
                                            )
                                            .order('created_at'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 80.0,
                                              height: 80.0,
                                              child: SpinKitCircle(
                                                color: AppColors.primary,
                                                size: 80.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ProfilesRow>
                                            listViewProfilesRowList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewProfilesRowList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewProfilesRow =
                                                listViewProfilesRowList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().idManager =
                                                      listViewProfilesRow.id;
                                                  FFAppState().idCardBL =
                                                      listViewProfilesRow
                                                          .companyId!;
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                      CompanymanagerWidget
                                                          .routeName);
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: AppColors.border,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(errorBuilder: rpassImageFallback,
                                                            valueOrDefault<
                                                                String>(
                                                              listViewProfilesRow
                                                                  .pfoto,
                                                              '${AppConfig.flutterFlowAssetsBaseUrl}/1z887tjlhzbz/i_(1).webp',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          3.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewProfilesRow
                                                                            .surname,
                                                                        'фамилия',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: AppColors.ink,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewProfilesRow
                                                                            .name,
                                                                        'имя',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: AppColors.ink,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            3.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewProfilesRow
                                                                              .cityName,
                                                                          'город',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.manrope(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: AppColors.ink,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          3.0,
                                                                          5.0,
                                                                          3.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'тел.:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: AppColors.ink,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewProfilesRow
                                                                            .phone,
                                                                        'тел',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: AppColors.ink,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: AppColors.bg,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(GlavnayaWidget.routeName);
                      },
                      child: Icon(
                        Icons.dashboard_outlined,
                        color: AppColors.ink,
                        size: 30.0,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(BlackListWidget.routeName);
                      },
                      child: Icon(
                        Icons.checklist_sharp,
                        color: AppColors.ink,
                        size: 30.0,
                      ),
                    ),
                    Icon(
                      Icons.manage_accounts,
                      color: AppColors.primaryDark,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
