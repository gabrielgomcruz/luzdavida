import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'menu_comprador_model.dart';
export 'menu_comprador_model.dart';

class MenuCompradorWidget extends StatefulWidget {
  const MenuCompradorWidget({
    super.key,
    int? nmenu,
  }) : nmenu = nmenu ?? 1;

  final int nmenu;

  @override
  State<MenuCompradorWidget> createState() => _MenuCompradorWidgetState();
}

class _MenuCompradorWidgetState extends State<MenuCompradorWidget> {
  late MenuCompradorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuCompradorModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Container(
          width: double.infinity,
          height: 52.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().pageNumber = 1;
                  safeSetState(() {});
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.space_dashboard_rounded,
                        color: colorFromCssString(
                          FFAppState().pageNumber == 1 ? '#FB6610' : '#313234',
                          defaultColor: const Color(0xFF313234),
                        ),
                        size: 22.0,
                      ),
                      AutoSizeText(
                        'Home',
                        minFontSize: 5.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter Tight',
                              color: colorFromCssString(
                                FFAppState().pageNumber == 1
                                    ? '#FB6610'
                                    : '#313234',
                                defaultColor: Colors.black,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().pageNumber = 2;
                  safeSetState(() {});
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.umbrellaBeach,
                        color: colorFromCssString(
                          FFAppState().pageNumber == 2 ? '#FB6610' : '#313234',
                          defaultColor: const Color(0xFF313234),
                        ),
                        size: 22.0,
                      ),
                      AutoSizeText(
                        'Vendedores',
                        minFontSize: 5.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter Tight',
                              color: colorFromCssString(
                                FFAppState().pageNumber == 2
                                    ? '#FB6610'
                                    : '#313234',
                                defaultColor: Colors.black,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().pageNumber = 3;
                  safeSetState(() {});
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.cocktail,
                        color: colorFromCssString(
                          FFAppState().pageNumber == 3 ? '#FB6610' : '#313234',
                          defaultColor: const Color(0xFF313234),
                        ),
                        size: 22.0,
                      ),
                      AutoSizeText(
                        'Pedidos',
                        minFontSize: 5.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter Tight',
                              color: colorFromCssString(
                                FFAppState().pageNumber == 3
                                    ? '#FB6610'
                                    : '#313234',
                                defaultColor: Colors.black,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed('unavailable');

                  FFAppState().pageNumber = 4;
                  safeSetState(() {});
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.face,
                        color: colorFromCssString(
                          FFAppState().pageNumber == 4 ? '#FB6610' : '#313234',
                          defaultColor: const Color(0xFF313234),
                        ),
                        size: 22.0,
                      ),
                      AutoSizeText(
                        'Perfil',
                        minFontSize: 5.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter Tight',
                              color: colorFromCssString(
                                FFAppState().pageNumber == 4
                                    ? '#FB6610'
                                    : '#313234',
                                defaultColor: const Color(0xFF313234),
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
