import '/auth/supabase_auth/auth_util.dart';
import '/config/app_colors.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'soglashenie_model.dart';
export 'soglashenie_model.dart';

class SoglashenieWidget extends StatefulWidget {
  const SoglashenieWidget({super.key});

  static String routeName = 'soglashenie';
  static String routePath = '/soglashenie';

  @override
  State<SoglashenieWidget> createState() => _SoglashenieWidgetState();
}

class _SoglashenieWidgetState extends State<SoglashenieWidget> {
  late SoglashenieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoglashenieModel());

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
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.ink,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          'Пользовательское соглашение \n(Публичная оферта) ',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Этот документ администратор компании принимает при регистрации. Он регулирует правила пользования сервисом.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FontStyle.italic,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'г. Астана, Республика Казахстан Дата последнего обновления: 08.09.2025 г.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Настоящее Пользовательское соглашение (далее – «Соглашение») является публичной офертой мобильного приложения \"R-PASS\", именуемого в дальнейшем «Платформа», в лице Администратора, действующего нf основании доверенности ИП \"RONAT-Astana\", и адресовано любому юридическому лицу или индивидуальному предпринимателю, именуемому в дальнейшем «Пользователь», выразившему готовность воспользоваться услугами Платформы.\n',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '1. ТЕРМИНЫ И ОПРЕДЕЛЕНИЯ \n1.1. Платформа — мобильное приложение «R-PASS», предназначено для внутреннего обмена информацией между компаниями, осуществляющими деятельность в сфере аренды автомобилей. \nСистема используется для фиксации фактов нарушений условий аренды со стороны клиентов и предотвращения повторных нарушений.\n1.2 Владелец Приложения (далее - Владелец) ИП \"RONAT-Astana\".\n1.3. Пользователь — юридическое лицо или ИП, прошедшее процедуру верификации и регистрации, в лице его уполномоченного представителя (Администратора) принявшее условия настоящего Соглашения. \n1.4. Администратор — уполномоченный представитель Пользователя, чья личность и полномочия были подтверждены Платформой (доверенностью). \n1.5. Контент — любая информация, включая персональные данные третьих лиц (клиентов автопроката), текстовые описания, фотографии и иные материалы, размещаемые Пользователем на Платформе. \n1.6. Учетная запись — персональная область Пользователя на Платформе, доступ к которой осуществляется с помощью логина и пароля.\n\n2. ПРЕДМЕТ СОГЛАШЕНИЯ \n2.1. Платформа предоставляет Пользователю неисключительное право использования функционала Платформы на условиях бесплатной (платной) подписки. \n2.2. Пользователь обязуется использовать Платформу в соответствии с условиями настоящего Соглашения и действующим законодательством Республики Казахстан. \n2.3. Акцептом настоящей оферты является завершение процедуры регистрации и оплаты подписки Пользователем.\n\n3. РЕГИСТРАЦИЯ И ВЕРИФИКАЦИЯ \n3.1. Для регистрации на Платформе представитель Пользователя обязан предоставить Платформе документы, подтверждающие его статус и полномочия (свидетельство о регистрации ИП/ТОО, приказ о назначении и т.д.). \n3.2. Регистрация осуществляется Платформой в ручном режиме после проверки предоставленных документов. Платформа оставляет за собой право отказать в регистрации без объяснения причин.\n3.3. После успешной верификации Платформа предоставляет Администратору данные для доступа к Учетной записи. \n3.4. Пользователь самостоятельно регистрирует своих сотрудников (Менеджеров) и несет полную административную и другую ответственность за их действия на Платформе, как за свои собственные.\n\n4. ПРАВА И ОБЯЗАННОСТИ СТОРОН \n4.1. Пользователь обязуется: \n4.1.1. Предоставлять достоверные сведения при регистрации. \n4.1.2. Своевременно оплачивать подписку согласно тарифам Платформы. \n4.1.3. Нести полную и единоличную ответственность за размещаемый им Контент, его соответствие законодательству РК, достоверность и точность. \n4.1.4. Гарантировать Платформе, что на размещение персональных данных третьих лиц (клиентов) в Контенте им было получено соответствующее письменное согласие этих лиц, как того требует Закон РК «О персональных данных и их защите». \n4.1.5. Не передавать данные доступа к Учетной записи третьим лицам. \n4.2. Платформа имеет право: \n4.2.1. Временно заблокировать доступ Пользователя к Платформе в случае нарушения условий настоящего Соглашения или несвоевременной оплаты. \n4.2.2. Удалять Контент или блокировать Учетные записи, нарушающие законодательство РК или права третьих лиц, без предварительного уведомления. \n4.2.3. В одностороннем порядке изменять условия настоящего Соглашения и тарифы, уведомив Пользователей путем публикации новой версии на Платформе.\n\n5. ОГРАНИЧЕНИЕ ОТВЕТСТВЕННОСТИ (КЛЮЧЕВОЙ ПУНКТ) \n5.1. Платформа предоставляется на условиях \"КАК ЕСТЬ\" (\"AS IS\"). Платформа не несет ответственности за достоверность, точность и законность Контента, размещаемого Пользователями. \n5.2. Платформа является лишь информационным посредником и не несет ответственности за любые убытки, ущерб (включая упущенную выгоду) или вред чести, достоинству и деловой репутации, возникшие у Пользователей или третьих лиц в результате использования или невозможности использования Платформы. \n5.3. Вся ответственность за содержание Контента и возможные претензии со стороны клиентов или государственных органов лежит исключительно на Пользователе, разместившем данный Контент. \n5.4. Пользователь обязуется возместить Платформе все убытки, расходы (включая расходы на юридическую помощь), которые Платформа может понести в результате претензий третьих лиц, связанных с Контентом, размещенным данным Пользователем.\n\n6.  Ответственность сторон\n6.1.  В случае нарушения условий настоящего Соглашения, повлекшего причинение вреда всем или одной из сторон Соглашения, виновная сторона несет ответственность в соответствии с законодательством Республики Казахстан.\n6.2.  Администратор не несет ответственности за технические временные сбои и перерывы в работе Приложения и его компонентах, возникшие по независящим от Администратора, Владельца причинам или в случае проведения плановых или внеплановых мероприятий по обслуживанию Приложения и его компонентов.\n6.3.  Владелец и Администратор не несут ответственности за временные сбои и перерывы в работе линий связи, иные аналогичные сбои, а также за неполадки компьютера, мобильного устройства связи, с которого Пользователь осуществляет доступ к Порталу и его компонентам.\n6.4.  Владелец и Администратор не несут ответственности перед Пользователем за действия других Пользователей, и любых других участников Приложения и его компонентов.\n6.5.  Владелец и Администратор не несут ответственности за любой прямой, косвенный ущерб, включая упущенную выгоду, ущерб от использования, потерю данных или какие-либо другие нематериальные потери, ущерб репутации и иной ущерб, возникающий вследствие:\n1) пользования или невозможности пользования Приложения, и его компонентами Пользователями;\n2) изменения условий Соглашения Владельцем и (или) Администратором;\n\n7. ФИНАНСОВЫЕ УСЛОВИЯ \n7.1. Стоимость подписки определяется тарифами, указанными на Платформе. \n7.2. Оплата производится на основании выставленного счета или путем перевода на указанные реквизиты. \n7.3. В случае отсутствия оплаты, доступ к Платформе блокируется до момента поступления средств.\n\n8.  Срок действия и расторжение пользовательского соглашения\n8.1.  Срок действия. Данное Соглашение начинает действовать в день, когда вы его примите (как описано в преамбуле выше) и действует пока вы используете Приложение, если не будет прекращено раньше в соответствии с данным Соглашением. \n8.2.  Несмотря на вышесказанное, вы настоящим подтверждаете и соглашаетесь, что данное соглашение вступает в силу по наступлении события, которое случится первым (a) день, когда вы впервые использовали Приложение или (b) день, когда вы приняли данное Соглашение, которое остаётся в силе пока вы используете Приложение, если не будет прекращено раньше в соответствии с данным Соглашением.\n8.3.  Расторжение с вашей стороны. Если вы хотите расторгнуть данное Соглашение, вы можете это сделать, просто удалив Приложение со своего мобильного устройства. После удаления Соглашение будет иметь силу в течении 1 (одного) года.\n8.4.  Последствия расторжения. Расторжение данного Соглашения требует от вас удаления Приложения и полного прекращения его использования.  Все положения данного Соглашения, которые по своему характеру должны сохраняться, остаются в силе после расторжения, включая, в частности, положения о праве собственности, отказ от гарантийных обязательств и ограничение ответственности.\n8.5.  Данное Приложение предназначено для использования только на территории Республики Казахстан. ИП \"RONAT-Astana\" не даёт никаких заверений, что Приложение будет работать в других странах.\n\n9.  Прочие положения\n9.1.  Все возможные споры, вытекающие из настоящего Соглашения или связанные с ним, подлежат разрешению в соответствии с действующим законодательством Республики Казахстан.\n9.2.  Бездействие со стороны Администратора в случае нарушения кем-либо из Пользователей положений Соглашения не лишает Владельца права предпринять позднее соответствующие действия в защиту своих интересов и защиту имущественных и неимущественных прав на охраняемые в соответствии с законодательством материалы Приложения.\n9.3.  Никакие советы или информация, полученные устно или письменно от ИП \"RONAT-Astana\" или посредством приложения, не создают никаких гарантий.\n9.4.  Форс-мажор. ИП \"RONAT-Astana\" не несёт ответственности за любые задержки или неисполнение, вызванные причинами, находящимися вне разумного контроля, включая, помимо прочего, стихийные бедствия, войны, терроризм, беспорядки, эмбарго, действия гражданских или военных властей, пожары, наводнения, несчастные случаи, забастовки или нехватку транспортных средств, топлива, энергии, рабочей силы или материалов.\n9.5.  Вопросы, жалобы, претензии. Если у вас имеются какие-либо вопросы, жалобы или претензии в отношении данного Приложения, вы можете связаться с нами написав на ronat.astana@gmail.com\n9.6.  Отказ от осуществления прав. Любой отказ или неисполнение какого-либо положения настоящего Соглашения в одном случае не будет считаться отказом от любого другого положения или такого положения в любом другом случае.\n\n10. ЗАКЛЮЧИТЕЛЬНЫЕ ПОЛОЖЕНИЯ \n10.1. Все споры и разногласия решаются путем переговоров. В случае невозможности достижения согласия, споры передаются на рассмотрение в Специализированный межрайонный экономический суд города Астаны. \n10.2. Во всем, что не урегулировано настоящим Соглашением, стороны руководствуются действующим законодательством Республики Казахстан.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue ??=
                                    FFAppState().soglashenie,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue = newValue!);
                                  if (newValue!) {
                                    FFAppState().soglashenie =
                                        !(FFAppState().soglashenie ?? true);
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().soglashenie =
                                        !(FFAppState().soglashenie ?? true);
                                    safeSetState(() {});
                                  }
                                },
                                side: (FlutterFlowTheme.of(context).alternate !=
                                        null)
                                    ? BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate!,
                                      )
                                    : null,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Подтверждаю факт ознакомления и\nбезоговорочного принятия условий\nпользовательского соглашения',
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
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (FFAppState().soglashenie == true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.ipinfoOut =
                                  await GetMyIPAddressCall.call();

                              _model.deviceinfoOut =
                                  await actions.getDeviceModel();
                              _model.soglasheniePDF =
                                  await actions.generateAndSaveOpenSoglashenie(
                                FFAppState().textSoglashenie,
                                FFAppState().polzSurname,
                                FFAppState().polzName,
                                FFAppState().polzOtchestvo,
                                FFAppState().polzIIN,
                                'Polzovatelscoe_soglashenie_${currentUserEmail}',
                                FFAppState().polzPfone,
                                (_model.ipinfoOut?.jsonBody ?? '').toString(),
                                _model.deviceinfoOut!,
                              );
                              await ProfilesTable().update(
                                data: {
                                  'soglashenie_doc': _model.soglasheniePDF,
                                  'soglashenie': true,
                                },
                                matchingRows: (rows) => rows.eqOrNull(
                                  'id',
                                  currentUserUid,
                                ),
                              );
                              context.safePop();

                              safeSetState(() {});
                            },
                            text: 'Подтвердить',
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                      if (FFAppState().soglashenie == false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: FFButtonWidget(
                            onPressed: (_model.checkboxValue == true)
                                ? null
                                : () {
                                    print('Button pressed ...');
                                  },
                            text: 'Подтвердить',
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: AppColors.primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(14.0),
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
      ),
    );
  }
}
