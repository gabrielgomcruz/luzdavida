import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'menu_vendedor_model.dart';
export 'menu_vendedor_model.dart';

class MenuVendedorWidget extends StatefulWidget {
  const MenuVendedorWidget({
    super.key,
    int? nmenu,
  }) : nmenu = nmenu ?? 1;

  final int nmenu;

  @override
  State<MenuVendedorWidget> createState() => _MenuVendedorWidgetState();
}

class _MenuVendedorWidgetState extends State<MenuVendedorWidget> {
  late MenuVendedorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuVendedorModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
      child: Material(
        color: Colors.transparent,
        elevation: 11.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Container(
          width: double.infinity,
          height: 52.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(4.0),
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
                  context.pushNamed('ProfileVendedor');

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
                          FFAppState().pageNumber == 1 ? '#303825' : '#313234',
                          defaultColor: const Color(0xFF313234),
                        ),
                        size: 22.0,
                      ),
                      AutoSizeText(
                        'Painel',
                        minFontSize: 5.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter Tight',
                              color: colorFromCssString(
                                FFAppState().pageNumber == 1
                                    ? '#303825'
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

                  context.pushNamed('plano');
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.moneyBill,
                        color: colorFromCssString(
                          FFAppState().pageNumber == 2 ? '#303825' : '#313234',
                          defaultColor: FlutterFlowTheme.of(context).primary,
                        ),
                        size: 22.0,
                      ),
                      AutoSizeText(
                        'Assinatura',
                        minFontSize: 5.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter Tight',
                              color: colorFromCssString(
                                FFAppState().pageNumber == 2
                                    ? '#303825'
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
                  context.pushNamed('auth_2_EditProfile');

                  FFAppState().pageNumber = 3;
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
                          FFAppState().pageNumber == 3 ? '#303825' : '#313234',
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
                                FFAppState().pageNumber == 3
                                    ? '#303825'
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
