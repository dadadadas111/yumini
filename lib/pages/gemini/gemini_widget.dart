import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_api_key/add_api_key_widget.dart';
import '/components/chat_bubble/chat_bubble_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/side/side_widget.dart';
import '/components/top_header/top_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'gemini_model.dart';
export 'gemini_model.dart';

class GeminiWidget extends StatefulWidget {
  const GeminiWidget({super.key});

  static String routeName = 'Gemini';
  static String routePath = '/yumini';

  @override
  State<GeminiWidget> createState() => _GeminiWidgetState();
}

class _GeminiWidgetState extends State<GeminiWidget> {
  late GeminiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeminiModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Gemini'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GEMINI_PAGE_Gemini_ON_INIT_STATE');
      if (FFAppState().geminiApiKey == 'NOT_SET') {
        logFirebaseEvent('Gemini_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: AddApiKeyWidget(),
              ),
            );
          },
        );
      }
      logFirebaseEvent('Gemini_update_app_state');
      FFAppState().DailinEmote = 1;
      FFAppState().isBotSelected = false;
      FFAppState().selectedBot = '';
      FFAppState().selectedBotName = '';
      safeSetState(() {});
      logFirebaseEvent('Gemini_wait__delay');
      await Future.delayed(const Duration(milliseconds: 200));
      logFirebaseEvent('Gemini_update_app_state');
      FFAppState().DailinEmote = 2;
      safeSetState(() {});
      logFirebaseEvent('Gemini_wait__delay');
      await Future.delayed(const Duration(milliseconds: 200));
      logFirebaseEvent('Gemini_update_app_state');
      FFAppState().DailinEmote = 4;
      safeSetState(() {});
      logFirebaseEvent('Gemini_wait__delay');
      await Future.delayed(const Duration(milliseconds: 200));
      logFirebaseEvent('Gemini_update_app_state');
      FFAppState().DailinEmote = 5;
      safeSetState(() {});
      logFirebaseEvent('Gemini_wait__delay');
      await Future.delayed(const Duration(milliseconds: 200));
      logFirebaseEvent('Gemini_update_app_state');
      FFAppState().DailinEmote = 6;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Builder(
      builder: (context) => Title(
          title: 'Yumini',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.sideModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SideWidget(
                        email: currentUserEmail,
                        displayName: currentUserDisplayName,
                        photoUrl: currentUserPhoto,
                        onNavChange: () async {},
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 1.0,
                    thickness: 0.5,
                    color: FlutterFlowTheme.of(context).divider,
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Stack(
                          children: [
                            if (valueOrDefault<bool>(
                              (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) &&
                                      FFAppState().isNavOpen
                                  ? false
                                  : true,
                              true,
                            ))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  wrapWithModel(
                                    model: _model.topHeaderModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TopHeaderWidget(),
                                  ),
                                  if (FFAppState().isBotSelected)
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final message =
                                                            FFAppState()
                                                                .chat
                                                                .toList();
                                                        if (message.isEmpty) {
                                                          return Center(
                                                            child: Container(
                                                              width: 150.0,
                                                              height: 150.0,
                                                              child:
                                                                  EmptyStateWidget(),
                                                            ),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            0,
                                                            0,
                                                            valueOrDefault<
                                                                double>(
                                                              MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall
                                                                  ? 105.0
                                                                  : 150.0,
                                                              150.0,
                                                            ),
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              message.length,
                                                          itemBuilder: (context,
                                                              messageIndex) {
                                                            final messageItem =
                                                                message[
                                                                    messageIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  ChatBubbleWidget(
                                                                key: Key(
                                                                    'Keyr3n_${messageIndex}_of_${message.length}'),
                                                                message:
                                                                    messageItem,
                                                              ),
                                                            );
                                                          },
                                                          controller: _model
                                                              .chatListviewScrollable,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                          sigmaX: 3.0,
                                                          sigmaY: 3.0,
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .backgroundAlpha,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        850.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: 222.0,
                                                                                child: TextFormField(
                                                                                  controller: _model.textController,
                                                                                  focusNode: _model.textFieldFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.textController',
                                                                                    Duration(milliseconds: 100),
                                                                                    () async {
                                                                                      logFirebaseEvent('GEMINI_TextField_pmpubpd8_ON_TEXTFIELD_C');
                                                                                      logFirebaseEvent('TextField_update_app_state');

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                  ),
                                                                                  onFieldSubmitted: (_) async {
                                                                                    logFirebaseEvent('GEMINI_TextField_pmpubpd8_ON_TEXTFIELD_S');
                                                                                    logFirebaseEvent('TextField_update_app_state');
                                                                                    FFAppState().prompt = _model.textController.text;
                                                                                    FFAppState().addToChat(MessageStruct(
                                                                                      text: _model.textController.text,
                                                                                      role: 'user',
                                                                                    ));
                                                                                    FFAppState().DailinEmote = 1;
                                                                                    FFAppState().isChatting = true;
                                                                                    safeSetState(() {});
                                                                                    logFirebaseEvent('TextField_clear_text_fields_pin_codes');
                                                                                    safeSetState(() {
                                                                                      _model.textController?.clear();
                                                                                    });
                                                                                    logFirebaseEvent('TextField_wait__delay');
                                                                                    await Future.delayed(const Duration(milliseconds: 500));
                                                                                    logFirebaseEvent('TextField_scroll_to');
                                                                                    await _model.chatListviewScrollable?.animateTo(
                                                                                      _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                      duration: Duration(milliseconds: 300),
                                                                                      curve: Curves.ease,
                                                                                    );
                                                                                    logFirebaseEvent('TextField_update_app_state');
                                                                                    FFAppState().addToChat(MessageStruct(
                                                                                      text: '',
                                                                                      role: 'model',
                                                                                    ));
                                                                                    FFAppState().DailinEmote = 5;
                                                                                    safeSetState(() {});
                                                                                    logFirebaseEvent('TextField_backend_call');
                                                                                    _model.response = await GeminiCall.call(
                                                                                      messagesJson: functions.formatMessages(FFAppState().chat.toList()),
                                                                                      systemMessage: FFAppState().systemMessage,
                                                                                      apiKey: FFAppState().geminiApiKey,
                                                                                    );
                                                                                    if (_model.response?.succeeded ?? true) {
                                                                                      _model.response?.streamedResponse?.stream.transform(utf8.decoder).transform(const LineSplitter()).transform(ServerSentEventLineTransformer()).map((m) => ResponseStreamMessage(message: m)).listen(
                                                                                        (onMessageInput) async {
                                                                                          logFirebaseEvent('_update_app_state');
                                                                                          FFAppState().updateChatAtIndex(
                                                                                            FFAppState().chat.length - 1,
                                                                                            (e) => e
                                                                                              ..text = '${FFAppState().chat.elementAtOrNull(FFAppState().chat.length - 1)?.text}${GeminiCall.segment(
                                                                                                onMessageInput.serverSentEvent.jsonData,
                                                                                              )}',
                                                                                          );
                                                                                          safeSetState(() {});
                                                                                          logFirebaseEvent('_scroll_to');
                                                                                          unawaited(
                                                                                            () async {
                                                                                              await _model.chatListviewScrollable?.animateTo(
                                                                                                _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                                duration: Duration(milliseconds: 150),
                                                                                                curve: Curves.ease,
                                                                                              );
                                                                                            }(),
                                                                                          );
                                                                                        },
                                                                                        onError: (onErrorInput) async {
                                                                                          logFirebaseEvent('_update_app_state');
                                                                                          FFAppState().addToChat(MessageStruct(
                                                                                            text: 'Oops, sorry that didn\'t go through. Try again or refresh!',
                                                                                            role: 'model',
                                                                                          ));
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        onDone: () async {
                                                                                          logFirebaseEvent('_scroll_to');
                                                                                          await _model.chatListviewScrollable?.animateTo(
                                                                                            _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                            duration: Duration(milliseconds: 300),
                                                                                            curve: Curves.ease,
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }

                                                                                    logFirebaseEvent('TextField_wait__delay');
                                                                                    await Future.delayed(const Duration(milliseconds: 300));
                                                                                    logFirebaseEvent('TextField_scroll_to');
                                                                                    await _model.chatListviewScrollable?.animateTo(
                                                                                      _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                      duration: Duration(milliseconds: 300),
                                                                                      curve: Curves.ease,
                                                                                    );
                                                                                    logFirebaseEvent('TextField_update_app_state');
                                                                                    FFAppState().isChatting = false;
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  autofocus: false,
                                                                                  textInputAction: TextInputAction.send,
                                                                                  readOnly: FFAppState().isChatting,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    hintText: 'Write your prompt here...',
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    suffixIcon: _model.textController!.text.isNotEmpty
                                                                                        ? InkWell(
                                                                                            onTap: () async {
                                                                                              _model.textController?.clear();
                                                                                              logFirebaseEvent('GEMINI_TextField_pmpubpd8_ON_TEXTFIELD_C');
                                                                                              logFirebaseEvent('TextField_update_app_state');

                                                                                              safeSetState(() {});
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.clear,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 22,
                                                                                            ),
                                                                                          )
                                                                                        : null,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                  validator: _model.textControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (_model.textController.text != '')
                                                                              FlutterFlowIconButton(
                                                                                borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: 6.0,
                                                                                buttonSize: 50.0,
                                                                                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                hoverColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                hoverIconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                icon: Icon(
                                                                                  Icons.send_sharp,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 30.0,
                                                                                ),
                                                                                showLoadingIndicator: true,
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('GEMINI_PAGE_send_sharp_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_update_app_state');
                                                                                  FFAppState().prompt = _model.textController.text;
                                                                                  FFAppState().addToChat(MessageStruct(
                                                                                    text: _model.textController.text,
                                                                                    role: 'user',
                                                                                  ));
                                                                                  FFAppState().DailinEmote = 1;
                                                                                  safeSetState(() {});
                                                                                  logFirebaseEvent('IconButton_clear_text_fields_pin_codes');
                                                                                  safeSetState(() {
                                                                                    _model.textController?.clear();
                                                                                  });
                                                                                  logFirebaseEvent('IconButton_wait__delay');
                                                                                  await Future.delayed(const Duration(milliseconds: 500));
                                                                                  logFirebaseEvent('IconButton_scroll_to');
                                                                                  await _model.chatListviewScrollable?.animateTo(
                                                                                    _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                    duration: Duration(milliseconds: 300),
                                                                                    curve: Curves.ease,
                                                                                  );
                                                                                  logFirebaseEvent('IconButton_update_app_state');
                                                                                  FFAppState().addToChat(MessageStruct(
                                                                                    text: '',
                                                                                    role: 'model',
                                                                                  ));
                                                                                  FFAppState().DailinEmote = 5;
                                                                                  safeSetState(() {});
                                                                                  logFirebaseEvent('IconButton_backend_call');
                                                                                  _model.responseCopy = await GeminiCall.call(
                                                                                    messagesJson: functions.formatMessages(FFAppState().chat.toList()),
                                                                                    systemMessage: FFAppState().systemMessage,
                                                                                    apiKey: FFAppState().geminiApiKey,
                                                                                  );
                                                                                  if (_model.responseCopy?.succeeded ?? true) {
                                                                                    _model.responseCopy?.streamedResponse?.stream.transform(utf8.decoder).transform(const LineSplitter()).transform(ServerSentEventLineTransformer()).map((m) => ResponseStreamMessage(message: m)).listen(
                                                                                      (onMessageInput) async {
                                                                                        logFirebaseEvent('_update_app_state');
                                                                                        FFAppState().updateChatAtIndex(
                                                                                          FFAppState().chat.length - 1,
                                                                                          (e) => e
                                                                                            ..text = '${FFAppState().chat.elementAtOrNull(FFAppState().chat.length - 1)?.text}${GeminiCall.segment(
                                                                                              onMessageInput.serverSentEvent.jsonData,
                                                                                            )}',
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                        logFirebaseEvent('_scroll_to');
                                                                                        unawaited(
                                                                                          () async {
                                                                                            await _model.chatListviewScrollable?.animateTo(
                                                                                              _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                              duration: Duration(milliseconds: 150),
                                                                                              curve: Curves.ease,
                                                                                            );
                                                                                          }(),
                                                                                        );
                                                                                      },
                                                                                      onError: (onErrorInput) async {
                                                                                        logFirebaseEvent('_update_app_state');
                                                                                        FFAppState().addToChat(MessageStruct(
                                                                                          text: 'Oops, sorry that didn\'t go through. Try again or refresh!',
                                                                                          role: 'model',
                                                                                        ));
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      onDone: () async {
                                                                                        logFirebaseEvent('_scroll_to');
                                                                                        await _model.chatListviewScrollable?.animateTo(
                                                                                          _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                          duration: Duration(milliseconds: 300),
                                                                                          curve: Curves.ease,
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }

                                                                                  logFirebaseEvent('IconButton_wait__delay');
                                                                                  await Future.delayed(const Duration(milliseconds: 300));
                                                                                  logFirebaseEvent('IconButton_scroll_to');
                                                                                  await _model.chatListviewScrollable?.animateTo(
                                                                                    _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                    duration: Duration(milliseconds: 300),
                                                                                    curve: Curves.ease,
                                                                                  );

                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ].addToEnd(SizedBox(
                                                                height: 20.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (FFAppState().isLoading)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                          sigmaX: 2.0,
                                                          sigmaY: 2.0,
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/Double_Ring@1x-1.0s-200px-200px_(1).gif',
                                                              width: 70.0,
                                                              height: 70.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (!FFAppState().isBotSelected)
                                    Expanded(
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.robot,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 100.0,
                                            ),
                                            Text(
                                              'Please choose 1 Yumini version to start',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 30.0)),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            if (!FFAppState().isNavOpen)
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'GEMINI_PAGE_arrow_forward_ios_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().isNavOpen = true;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            if (FFAppState().isNavOpen)
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'GEMINI_arrow_back_ios_sharp_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().isNavOpen = false;
                                    safeSetState(() {});
                                  },
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
          )),
    );
  }
}
