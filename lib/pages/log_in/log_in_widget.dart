import '/auth/supabase_auth/auth_util.dart';
import '/config/app_config.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_in_model.dart';
export 'log_in_model.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  static String routeName = 'log_in';
  static String routePath = '/logIn';

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  late LogInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogInModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
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
                      color: Color(0xFF5D5C62),
                      size: 80.0,
                    ),
                  ),
                );
              }
              List<ProfilesRow> columnProfilesRowList = snapshot.data!;

              final columnProfilesRow = columnProfilesRowList.isNotEmpty
                  ? columnProfilesRowList.first
                  : null;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          '${AppConfig.flutterFlowAssetsBaseUrl}/od6nnixh2ykb/Gemini_Generated_Image_jrkqbpjrkqbpjrkq_%D0%BA%D0%BE%D0%BF%D0%B8%D1%8F.png',
                          width: 309.67,
                          height: 259.2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 50.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              '${AppConfig.flutterFlowAssetsBaseUrl}/dao9njjrrcy8/%D0%BD%D0%B0%D0%B4%D0%BF%D0%B8%D1%81%D1%8C.png',
                              width: 262.5,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 30.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.emailTextController,
                          focusNode: _model.emailFocusNode,
                          autofocus: true,
                          autofillHints: [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFA5A5A5),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFA5A2A2),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).info,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFB0615),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFB0615),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFF434343),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.passwordTextController,
                          focusNode: _model.passwordFocusNode,
                          autofocus: true,
                          autofillHints: [AutofillHints.password],
                          obscureText: !_model.passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFA5A5A5),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFA5A2A2),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF0EFF2),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF40615),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF40615),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFF434343),
                            suffixIcon: InkWell(
                              onTap: () => safeSetState(
                                () => _model.passwordVisibility =
                                    !_model.passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF57636C),
                                size: 24.0,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          validator: _model.passwordTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        _model.loginSuccess = await actions.loginWithUsername(
                          _model.emailTextController.text,
                          _model.passwordTextController.text,
                        );
                        if (_model.loginSuccess!) {
                          _model.dataOut = await ProfilesTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              currentUserUid,
                            ),
                          );
                          if (columnProfilesRow?.personalData == true) {
                            FFAppState().polzCity = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .cityName!;
                            FFAppState().polzCompany = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .companyName!;
                            FFAppState().polzSurname = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .surname!;
                            FFAppState().polzName = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .name!;
                            FFAppState().polzIIN = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .iin!;
                            FFAppState().polzPfone = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .phone!;
                            FFAppState().polzRoll = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .role!;
                            FFAppState().polzID = currentUserUid;
                            FFAppState().polzEmail = currentUserEmail;
                            FFAppState().polzOtchestvo = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .otchestvo!;
                            FFAppState().IDCompany = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .companyId!;
                            FFAppState().soglasieOUT = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .soglasieDoc!;
                            FFAppState().soglashenieOUT = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .soglashenieDoc!;
                            FFAppState().CityID = _model.dataOut!
                                .where((e) => e.id == currentUserUid)
                                .toList()
                                .firstOrNull!
                                .cityId!;
                            safeSetState(() {});

                            context.pushNamed(GlavnayaWidget.routeName);
                          } else {
                            if (columnProfilesRow?.role == 'admin') {
                              FFAppState().polzCompany = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .companyName!;
                              FFAppState().IDCompany = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .companyId!;
                              FFAppState().polzPfone = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .phone!;
                              FFAppState().cityZapis = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .cityName!;
                              FFAppState().CityID = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .cityId!;
                              safeSetState(() {});

                              context.pushNamed(PersonalDataWidget.routeName);
                            } else if (columnProfilesRow?.role == 'manager') {
                              FFAppState().IDCompany = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .companyId!;
                              FFAppState().polzCompany = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .companyName!;
                              FFAppState().polzPfone = _model.dataOut!
                                  .where((e) => e.id == currentUserUid)
                                  .toList()
                                  .firstOrNull!
                                  .phone!;
                              safeSetState(() {});

                              context.pushNamed(
                                  PersonalDataManagerWidget.routeName);
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Данные не верные, проверьте Логин или пароль',
                                style: TextStyle(
                                  color: Color(0xFFF40505),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Войти',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
