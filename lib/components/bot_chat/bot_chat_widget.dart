import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bot_chat_model.dart';
export 'bot_chat_model.dart';

class BotChatWidget extends StatefulWidget {
  const BotChatWidget({
    super.key,
    this.name,
    required this.id,
    required this.description,
    required this.image,
    required this.displayName,
  });

  final String? name;
  final String? id;
  final String? description;
  final String? image;
  final String? displayName;

  @override
  State<BotChatWidget> createState() => _BotChatWidgetState();
}

class _BotChatWidgetState extends State<BotChatWidget> {
  late BotChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('BOT_CHAT_COMP_contentView_1_ON_TAP');
          if (!FFAppState().isChatting) {
            logFirebaseEvent('contentView_1_update_app_state');
            FFAppState().isLoading = true;
            FFAppState().DailinEmote = 5;
            FFAppState().isChatting = true;
            FFAppState().update(() {});
            if (FFAppState().isBotSelected) {
              logFirebaseEvent('contentView_1_update_app_state');
              FFAppState().oldBot = FFAppState().selectedBot;
              safeSetState(() {});
              logFirebaseEvent('contentView_1_update_app_state');
              FFAppState().isBotSelected = true;
              FFAppState().selectedBot = widget.id!;
              FFAppState().systemMessage = widget.description!;
              FFAppState().selectedBotName = widget.name!;
              FFAppState().selectedBotPhoto = widget.image!;
              _model.updatePage(() {});
              logFirebaseEvent('contentView_1_firestore_query');
              _model.chatQuery = await queryMessagesRecordOnce(
                queryBuilder: (messagesRecord) => messagesRecord
                    .where(
                      'userId',
                      isEqualTo: currentUserUid,
                    )
                    .where(
                      'botId',
                      isEqualTo: FFAppState().oldBot,
                    ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (_model.chatQuery?.reference != null) {
                logFirebaseEvent('contentView_1_backend_call');

                await _model.chatQuery!.reference.update({
                  ...mapToFirestore(
                    {
                      'chat': getMessageListFirestoreData(
                        FFAppState().chat,
                      ),
                    },
                  ),
                });
              } else {
                logFirebaseEvent('contentView_1_backend_call');

                await MessagesRecord.collection.doc().set({
                  ...createMessagesRecordData(
                    userId: currentUserUid,
                    botId: FFAppState().selectedBot,
                  ),
                  ...mapToFirestore(
                    {
                      'chat': getMessageListFirestoreData(
                        FFAppState().chat,
                      ),
                    },
                  ),
                });
              }
            }
            logFirebaseEvent('contentView_1_update_app_state');
            FFAppState().isBotSelected = true;
            FFAppState().selectedBot = widget.id!;
            FFAppState().systemMessage = widget.description!;
            FFAppState().selectedBotName = widget.name!;
            FFAppState().selectedBotPhoto = widget.image!;
            _model.updatePage(() {});
            logFirebaseEvent('contentView_1_firestore_query');
            _model.selectedChat = await queryMessagesRecordOnce(
              queryBuilder: (messagesRecord) => messagesRecord
                  .where(
                    'userId',
                    isEqualTo: currentUserUid,
                  )
                  .where(
                    'botId',
                    isEqualTo: widget.id,
                  ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            if (_model.selectedChat?.reference != null) {
              logFirebaseEvent('contentView_1_update_app_state');
              FFAppState().chat =
                  _model.selectedChat!.chat.toList().cast<MessageStruct>();
              safeSetState(() {});
            } else {
              logFirebaseEvent('contentView_1_update_app_state');
              FFAppState().chat = [];
              safeSetState(() {});
              logFirebaseEvent('contentView_1_backend_call');

              await MessagesRecord.collection
                  .doc()
                  .set(createMessagesRecordData(
                    userId: currentUserUid,
                    botId: widget.id,
                  ));
            }

            logFirebaseEvent('contentView_1_update_app_state');
            FFAppState().isLoading = false;
            safeSetState(() {});
            logFirebaseEvent('contentView_1_update_app_state');
            FFAppState().isChatting = false;
            FFAppState().update(() {});
          }

          safeSetState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          width: double.infinity,
          height: 55.0,
          decoration: BoxDecoration(
            color: () {
              if (FFAppState().selectedBot == widget.id) {
                return FlutterFlowTheme.of(context).primary;
              } else if (_model.isHovered) {
                return _model.hoverColor;
              } else {
                return FlutterFlowTheme.of(context).accent1;
              }
            }(),
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent1,
              width: 1.0,
            ),
          ),
          child: MouseRegion(
            opaque: false,
            cursor: MouseCursor.defer ?? MouseCursor.defer,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 12.0),
                    child: Container(
                      width: 4.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        widget.image!,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.displayName!,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            color: (FFAppState().selectedBot == widget.id) &&
                                    (FFAppState().oldBot != widget.id)
                                ? Colors.white
                                : FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            onEnter: ((event) async {
              safeSetState(() => _model.mouseRegionHovered = true);
              logFirebaseEvent('BOT_CHAT_MouseRegion_t94gdcae_ON_TOGGLE_');
              logFirebaseEvent('MouseRegion_update_component_state');
              _model.isHovered = true;
              _model.updatePage(() {});
            }),
            onExit: ((event) async {
              safeSetState(() => _model.mouseRegionHovered = false);
              logFirebaseEvent('BOT_CHAT_MouseRegion_t94gdcae_ON_TOGGLE_');
              logFirebaseEvent('MouseRegion_update_component_state');
              _model.isHovered = false;
              _model.updatePage(() {});
            }),
          ),
        ),
      ),
    );
  }
}
