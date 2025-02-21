import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bot_chat_widget.dart' show BotChatWidget;
import 'package:flutter/material.dart';

class BotChatModel extends FlutterFlowModel<BotChatWidget> {
  ///  Local state fields for this component.

  Color? hoverColor = Color(511182268);

  bool isHovered = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in contentView_1 widget.
  MessagesRecord? chatQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in contentView_1 widget.
  MessagesRecord? selectedChat;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
