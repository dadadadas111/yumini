import '/auth/firebase_auth/auth_util.dart';
import '/components/add_api_key/add_api_key_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top_header_model.dart';
export 'top_header_model.dart';

class TopHeaderWidget extends StatefulWidget {
  const TopHeaderWidget({super.key});

  @override
  State<TopHeaderWidget> createState() => _TopHeaderWidgetState();
}

class _TopHeaderWidgetState extends State<TopHeaderWidget> {
  late TopHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopHeaderModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < kBreakpointSmall
                    ? 16.0
                    : 22.0,
                22.0,
              ),
              14.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < kBreakpointSmall
                    ? 16.0
                    : 22.0,
                22.0,
              ),
              12.0),
          child: Container(
            width: double.infinity,
            height: 36.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Yu Assistant',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (FFAppState().geminiApiKey == '')
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 6.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 4.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                hoverColor:
                                    FlutterFlowTheme.of(context).slate50,
                                hoverIconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                icon: Icon(
                                  Icons.key,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'TOP_HEADER_COMP_key_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: AddApiKeyWidget(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 4.0,
                            buttonSize: 48.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            hoverColor: FlutterFlowTheme.of(context).slate50,
                            hoverIconColor:
                                FlutterFlowTheme.of(context).primaryText,
                            icon: Icon(
                              Icons.sunny_snowing,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TOP_HEADER_COMP_sunny_snowing_ICN_ON_TAP');
                              if (Theme.of(context).brightness ==
                                  Brightness.dark) {
                                logFirebaseEvent(
                                    'IconButton_set_dark_mode_settings');
                                setDarkModeSetting(context, ThemeMode.light);
                                return;
                              } else {
                                logFirebaseEvent(
                                    'IconButton_set_dark_mode_settings');
                                setDarkModeSetting(context, ThemeMode.dark);
                                return;
                              }
                            },
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 4.0,
                          buttonSize: 48.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          hoverColor: FlutterFlowTheme.of(context).slate50,
                          hoverIconColor:
                              FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            Icons.refresh_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'TOP_HEADER_refresh_outlined_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_update_app_state');
                            FFAppState().prompt = '';
                            FFAppState().chat = [];
                            FFAppState().update(() {});
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 4.0,
                          buttonSize: 48.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          hoverColor: FlutterFlowTheme.of(context).slate50,
                          hoverIconColor:
                              FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            Icons.logout,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'TOP_HEADER_COMP_logout_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                                AuthenWidget.routeName, context.mounted);
                          },
                        ),
                      ],
                    ),
                    onEnter: ((event) async {
                      safeSetState(() => _model.mouseRegionHovered = true);
                      logFirebaseEvent(
                          'TOP_HEADER_MouseRegion_4f0ykt03_ON_TOGGL');
                      logFirebaseEvent('MouseRegion_update_app_state');
                      FFAppState().DailinEmote = 2;
                      _model.updatePage(() {});
                    }),
                    onExit: ((event) async {
                      safeSetState(() => _model.mouseRegionHovered = false);
                      logFirebaseEvent(
                          'TOP_HEADER_MouseRegion_4f0ykt03_ON_TOGGL');
                      logFirebaseEvent('MouseRegion_update_app_state');
                      FFAppState().DailinEmote = 4;
                      _model.updatePage(() {});
                    }),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
        Divider(
          height: 1.0,
          thickness: 0.5,
          color: FlutterFlowTheme.of(context).divider,
        ),
      ],
    );
  }
}
