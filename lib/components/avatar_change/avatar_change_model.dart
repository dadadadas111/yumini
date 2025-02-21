import '/flutter_flow/flutter_flow_util.dart';
import 'avatar_change_widget.dart' show AvatarChangeWidget;
import 'package:flutter/material.dart';

class AvatarChangeModel extends FlutterFlowModel<AvatarChangeWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
