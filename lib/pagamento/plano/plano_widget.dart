import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/toast04_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'plano_model.dart';
export 'plano_model.dart';

class PlanoWidget extends StatefulWidget {
  const PlanoWidget({super.key});

  @override
  State<PlanoWidget> createState() => _PlanoWidgetState();
}

class _PlanoWidgetState extends State<PlanoWidget> {
  late PlanoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.pixValidation(context);
      safeSetState(() {});
      FFAppState().Planos = [];
      FFAppState().addToPlanos(PlanosStruct(
        nomedoplano: 'Mensal',
        preco: 100.0,
        installments: 1,
      ));
      FFAppState().addToPlanos(PlanosStruct(
        nomedoplano: 'Anual',
        preco: 1100.0,
        installments: 12,
      ));
      FFAppState().update(() {});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (currentUserDocument!.dataDoProxPagamento! <=
                    getCurrentTimestamp)
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.toast04Model,
                        updateCallback: () => safeSetState(() {}),
                        child: const Toast04Widget(),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 22.0, 0.0, 10.0),
                  child: Text(
                    'Planos',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      'Seu plano vence em: ${valueOrDefault<String>(
                        dateTimeFormat(
                          "d/M/y",
                          currentUserDocument?.dataDoProxPagamento,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        'Plano vencido',
                      )}',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    final planos =
                        FFAppState().Planos.unique((e) => e).toList();

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(planos.length, (planosIndex) {
                        final planosItem = planos[planosIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().Planoescolhido = planosItem;
                              FFAppState().update(() {});
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color: Color(0x34111417),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                planosItem.nomedoplano,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '${planosItem.installments.toString()}x de ${formatNumber(
                                                  planosItem.preco,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'R\$',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (FFAppState()
                                                      .Planoescolhido
                                                      .nomedoplano ==
                                                  planosItem.nomedoplano) {
                                                return Icon(
                                                  Icons.check_circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                );
                                              } else {
                                                return Icon(
                                                  Icons.circle_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: ((FFAppState().Planoescolhido == null) &&
                              (currentUserDocument?.planoEscolhido == null))
                          ? null
                          : () async {
                              context.pushNamed('Pagamento');
                            },
                      text: 'Escolher forma de pagamento',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 1.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor: const Color(0x36303825),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
