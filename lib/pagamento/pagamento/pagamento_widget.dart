import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'pagamento_model.dart';
export 'pagamento_model.dart';

class PagamentoWidget extends StatefulWidget {
  const PagamentoWidget({super.key});

  @override
  State<PagamentoWidget> createState() => _PagamentoWidgetState();
}

class _PagamentoWidgetState extends State<PagamentoWidget>
    with TickerProviderStateMixin {
  late PagamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagamentoModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.nomeIMpressoTextController ??= TextEditingController();
    _model.nomeIMpressoFocusNode ??= FocusNode();

    _model.cpfTextController ??= TextEditingController();
    _model.cpfFocusNode ??= FocusNode();

    _model.numeroCartaoTextController ??= TextEditingController();
    _model.numeroCartaoFocusNode ??= FocusNode();

    _model.mesTextController ??= TextEditingController();
    _model.mesFocusNode ??= FocusNode();

    _model.anoTextController ??= TextEditingController();
    _model.anoFocusNode ??= FocusNode();

    _model.cvvTextController ??= TextEditingController();
    _model.cvvFocusNode ??= FocusNode();

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
        backgroundColor: const Color(0xFFEBEBEB),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Plano ${FFAppState().Planoescolhido.nomedoplano}',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total:',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              FFAppState().Planoescolhido.preco,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'R\$',
                                            ),
                                            '0',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color: const Color(0xFF00A78B),
                                                fontSize: 20.0,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1.0,
                                      color: Color(0x1F000000),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Escolha seu método de pagamento',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (FFAppState().qualEscolhiPagar ==
                                                0) {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  safeSetState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.check_circle,
                                                  color: Color(0xFF3A4545),
                                                  size: 22.0,
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .qualEscolhiPagar = 0;
                                                  FFAppState().update(() {});
                                                },
                                                child: const Icon(
                                                  Icons.circle_outlined,
                                                  color: Color(0xFF3A4545),
                                                  size: 22.0,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/logo-pix-icone-1024.png',
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'Pagar com PIX',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF424242),
                                                fontSize: 20.0,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                    if (currentUserEmail == '')
                                      FutureBuilder<List<MeusCartoesRow>>(
                                        future: MeusCartoesTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'qualClienteUUID',
                                            currentUserUid,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<MeusCartoesRow>
                                              columnMeusCartoesRowList =
                                              snapshot.data!;

                                          if (columnMeusCartoesRowList
                                              .isEmpty) {
                                            return Center(
                                              child: Image.asset(
                                                'assets/images/Design_sem_nome_(3).png',
                                                width: 50.0,
                                              ),
                                            );
                                          }

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnMeusCartoesRowList.length,
                                                (columnIndex) {
                                              final columnMeusCartoesRow =
                                                  columnMeusCartoesRowList[
                                                      columnIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (FFAppState()
                                                              .qualEscolhiPagar ==
                                                          (columnIndex + 1)) {
                                                        return const Icon(
                                                          Icons.check_circle,
                                                          color:
                                                              Color(0xFF3A4545),
                                                          size: 22.0,
                                                        );
                                                      } else {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .qualEscolhiPagar =
                                                                columnIndex + 1;
                                                            FFAppState()
                                                                    .cartaoEscolhidoID =
                                                                columnMeusCartoesRow
                                                                    .id;
                                                            safeSetState(() {});
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .circle_outlined,
                                                            color: Color(
                                                                0xFF3A4545),
                                                            size: 22.0,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      const FaIcon(
                                                        FontAwesomeIcons
                                                            .creditCard,
                                                        color:
                                                            Color(0xFF3A4545),
                                                        size: 22.0,
                                                      ),
                                                      Text(
                                                        '**** **** **** ${functions.fourLast(functions.fourLast(columnMeusCartoesRow.numeroCartao!))}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter Tight',
                                                              color: const Color(
                                                                  0xFF424242),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'Deseja remover seu cartão?'),
                                                                        content:
                                                                            const Text('Seus dados serão perdidos e não será possível recupera-los'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('Voltar'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('Apagar cartão'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            await MeusCartoesTable()
                                                                .delete(
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                columnMeusCartoesRow
                                                                    .id,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.close_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 12.0)),
                                              );
                                            }).divide(const SizedBox(height: 22.0)),
                                          );
                                        },
                                      ),
                                    if (currentUserEmail == '')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          safeSetState(() {
                                            _model.tabBarController!.animateTo(
                                              min(
                                                  _model.tabBarController!
                                                          .length -
                                                      1,
                                                  _model.tabBarController!
                                                          .index +
                                                      1),
                                              duration:
                                                  const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Icon(
                                              Icons.add_sharp,
                                              color: Color(0xFF3A4545),
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Adicionar Cartão de Crédito',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: const Color(0xFF424242),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var shouldSetState = false;
                                        if (FFAppState().qualEscolhiPagar ==
                                            0) {
                                          _model.apiResult3pnCopy23 =
                                              await PixMPCall.call(
                                            accessToken:
                                                'APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
                                            idTransacao: random_data
                                                .randomInteger(1000, 99999)
                                                .toString(),
                                            paymentMethodId: 'pix',
                                            email: currentUserEmail,
                                            identificationType: 'CPF',
                                            firstName: currentUserDisplayName,
                                            transactionAmount: FFAppState()
                                                .Planoescolhido
                                                .preco,
                                            description: 'Assinatura de plano',
                                            numberCpf: valueOrDefault(
                                                currentUserDocument?.cpf, ''),
                                          );

                                          shouldSetState = true;
                                          if ((_model.apiResult3pnCopy23
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().idPedido =
                                                PixMPCall.idPedido(
                                              (_model.apiResult3pnCopy23
                                                      ?.jsonBody ??
                                                  ''),
                                            )!;
                                            FFAppState().chavePix =
                                                PixMPCall.chavePix(
                                              (_model.apiResult3pnCopy23
                                                      ?.jsonBody ??
                                                  ''),
                                            )!;
                                            FFAppState().QRCode =
                                                PixMPCall.qrCode(
                                              (_model.apiResult3pnCopy23
                                                      ?.jsonBody ??
                                                  ''),
                                            )!;
                                            safeSetState(() {});
                                            await EsteiraDePixTable().insert({
                                              'idPix': PixMPCall.idPedido(
                                                (_model.apiResult3pnCopy23
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toString(),
                                              'order': currentUserEmail,
                                            });

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              precisaValidarPixPixID:
                                                  PixMPCall.chavePix(
                                                (_model.apiResult3pnCopy23
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              planoEscolhido:
                                                  updatePlanosStruct(
                                                FFAppState().Planoescolhido,
                                                clearUnsetFields: false,
                                              ),
                                            ));
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('Ops!'),
                                                  content: Text(
                                                      'Entre em contato com suporte e informe o seguinte erro: ${(_model.apiResult3pnCopy23?.exceptionMessage ?? '')}'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }

                                          safeSetState(() {
                                            _model.tabBarController!.animateTo(
                                              _model.tabBarController!.length -
                                                  1,
                                              duration:
                                                  const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          });

                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        } else {
                                          _model.cartaoEscolhidoPlus =
                                              await MeusCartoesTable()
                                                  .queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              FFAppState().cartaoEscolhidoID,
                                            ),
                                          );
                                          shouldSetState = true;
                                          _model.criarTokenCopy =
                                              await CriarTokenCall.call(
                                            cardNumber: functions
                                                .removeUnecessaryCaracteres(
                                                    _model
                                                        .cartaoEscolhidoPlus
                                                        ?.firstOrNull
                                                        ?.numeroCartao)
                                                .toString(),
                                            securityCode: _model
                                                .cartaoEscolhidoPlus
                                                ?.firstOrNull
                                                ?.cvv
                                                ?.toString(),
                                            identificationType: 'CPF',
                                            accessToken:
                                                'Bearer APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
                                            cardholderName: _model
                                                .cartaoEscolhidoPlus
                                                ?.firstOrNull
                                                ?.nomeImpressoCartao,
                                            cardExpirationMonth: _model
                                                .cartaoEscolhidoPlus
                                                ?.firstOrNull
                                                ?.mes
                                                ?.toString(),
                                            cardExpirationYear: _model
                                                .cartaoEscolhidoPlus
                                                ?.firstOrNull
                                                ?.ano
                                                ?.toString(),
                                            publicKey:
                                                'APP_USR-45dd5bf2-bf96-4868-ae3d-34d486873fd9',
                                            identificationNumber: functions
                                                .removeUnecessaryCaracteres(
                                                    _model.cartaoEscolhidoPlus
                                                        ?.firstOrNull?.cpf)
                                                .toString(),
                                          );

                                          shouldSetState = true;
                                          if ((_model
                                                  .criarTokenCopy?.succeeded ??
                                              true)) {
                                            _model.pagarCopy =
                                                await PagamentoCartaoMPCall
                                                    .call(
                                              zipCode: '40.290-350',
                                              federalUnit: 'BA',
                                              identificationType: 'CPF',
                                              description: 'Pagamento de plano',
                                              city: 'BA',
                                              identificationNumber: _model
                                                  .cartaoEscolhidoPlus
                                                  ?.firstOrNull
                                                  ?.cpf,
                                              token: CriarTokenCall.token(
                                                (_model.criarTokenCopy
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              email: currentUserEmail,
                                              streetNumber: '3691',
                                              firstName: currentUserDisplayName,
                                              neighborhood: 'ACUPE DE BROTAS',
                                              streetName: 'AV VASCO DA GAMA',
                                              lastName: 'Luz da vida',
                                              installments: 1,
                                              accessToken:
                                                  'Bearer APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
                                              transactionAmount: FFAppState()
                                                  .Planoescolhido
                                                  .preco,
                                            );

                                            shouldSetState = true;
                                            if ((_model.pagarCopy?.succeeded ??
                                                true)) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text('Sucesso!'),
                                                    content: const Text(
                                                        'Pagamento realizado.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              // clearCartPriceItems
                                              FFAppState().myCart = [];
                                              FFAppState().myCartSummary = [];
                                              FFAppState().update(() {});

                                              context.pushNamed('sucesso');

                                              if (shouldSetState) {
                                                safeSetState(() {});
                                              }
                                              return;
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Erro. ${(_model.pagarCopy12?.exceptionMessage ?? '')}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      const Color(0xFFD9003F),
                                                ),
                                              );
                                              if (shouldSetState) {
                                                safeSetState(() {});
                                              }
                                              return;
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Erro.  verifique as informações do seu cartão. ${(_model.criarTokenCopy?.exceptionMessage ?? '')}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    const Color(0xFFD9003F),
                                              ),
                                            );
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }
                                        }

                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                      },
                                      text: 'Confirmar',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 43.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 25.0))
                                      .addToStart(const SizedBox(height: 22.0))
                                      .addToEnd(const SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            height: 403.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      18.0, 33.0, 18.0, 18.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model
                                                .nomeIMpressoTextController,
                                            focusNode:
                                                _model.nomeIMpressoFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Nome impresso no cartão',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .inputBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .nomeIMpressoTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                                _model.cpfTextController,
                                            focusNode: _model.cpfFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'CPF',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .inputBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .cpfTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [_model.cpfMask],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model
                                                .numeroCartaoTextController,
                                            focusNode:
                                                _model.numeroCartaoFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Número do cartão',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .inputBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .numeroCartaoTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.mesTextController,
                                                  focusNode:
                                                      _model.mesFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Mês',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  validator: _model
                                                      .mesTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.mesMask
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.anoTextController,
                                                  focusNode:
                                                      _model.anoFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Ano',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  validator: _model
                                                      .anoTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.anoMask
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.cvvTextController,
                                                  focusNode:
                                                      _model.cvvFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'CVV',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  validator: _model
                                                      .cvvTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.cvvMask
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 22.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                safeSetState(() {
                                                  _model.tabBarController!
                                                      .animateTo(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                });
                                              },
                                              text: 'Salvar ',
                                              icon: const FaIcon(
                                                FontAwesomeIcons.save,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 52.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0x00FB6610),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                            ),
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var shouldSetState = false;
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  _model.criarTokenCopy237 =
                                                      await CriarTokenCall.call(
                                                    cardNumber: functions
                                                        .removeUnecessaryCaracteres(
                                                            _model
                                                                .numeroCartaoTextController
                                                                .text)
                                                        .toString(),
                                                    securityCode: _model
                                                        .cvvTextController.text,
                                                    identificationType: 'CPF',
                                                    accessToken:
                                                        'APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
                                                    cardholderName: _model
                                                        .nomeIMpressoTextController
                                                        .text,
                                                    cardExpirationMonth: _model
                                                        .mesTextController.text,
                                                    cardExpirationYear: _model
                                                        .anoTextController.text,
                                                    publicKey:
                                                        'APP_USR-45dd5bf2-bf96-4868-ae3d-34d486873fd9',
                                                    identificationNumber: functions
                                                        .removeUnecessaryCaracteres(
                                                            _model
                                                                .numeroCartaoTextController
                                                                .text)
                                                        .toString(),
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.criarTokenCopy237
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.pagarCopy12 =
                                                        await PagamentoCartaoMPCall
                                                            .call(
                                                      zipCode: '40.290-350',
                                                      federalUnit: 'BA',
                                                      identificationType: 'CPF',
                                                      description:
                                                          'Pagamento de plano',
                                                      city: 'BA',
                                                      identificationNumber:
                                                          _model
                                                              .cpfTextController
                                                              .text,
                                                      token:
                                                          CriarTokenCall.token(
                                                        (_model.criarTokenCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString(),
                                                      email: currentUserEmail,
                                                      streetNumber: '3691',
                                                      firstName:
                                                          currentUserDisplayName,
                                                      neighborhood:
                                                          'ACUPE DE BROTAS',
                                                      streetName:
                                                          'AV VASCO DA GAMA',
                                                      lastName: 'Luz da vida',
                                                      installments: 1,
                                                      accessToken:
                                                          'Bearer APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
                                                      transactionAmount:
                                                          FFAppState()
                                                              .Planoescolhido
                                                              .preco,
                                                    );

                                                    shouldSetState = true;
                                                    if ((_model.pagarCopy12
                                                            ?.succeeded ??
                                                        true)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Sucesso!'),
                                                            content: const Text(
                                                                'Pagamento realizado.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      // clearCartPriceItems
                                                      FFAppState().myCart = [];
                                                      FFAppState()
                                                          .myCartSummary = [];
                                                      FFAppState()
                                                          .update(() {});

                                                      context
                                                          .pushNamed('sucesso');

                                                      if (shouldSetState) {
                                                        safeSetState(() {});
                                                      }
                                                      return;
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Erro. ${(_model.pagarCopy12?.exceptionMessage ?? '')}',
                                                            style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              const Color(0xFFD9003F),
                                                        ),
                                                      );
                                                      if (shouldSetState) {
                                                        safeSetState(() {});
                                                      }
                                                      return;
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Erro.  verifique as informações do seu cartão. ${(_model.criarTokenCopy?.statusCode ?? 200).toString()}',
                                                          style: const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            const Color(0xFFD9003F),
                                                      ),
                                                    );
                                                    if (shouldSetState) {
                                                      safeSetState(() {});
                                                    }
                                                    return;
                                                  }

                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                },
                                                text: 'Salvar e pagar',
                                                icon: const Icon(
                                                  Icons.deblur_rounded,
                                                  size: 30.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 48.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
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
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    FFAppState().Planoescolhido.preco,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.commaDecimal,
                                    currency: 'R\$',
                                  ),
                                  '0',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: const Color(0xFF00A78B),
                                      fontSize: 20.0,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            BarcodeWidget(
                              data: FFAppState().QRCode,
                              barcode: Barcode.qrCode(),
                              width: double.infinity,
                              color: FlutterFlowTheme.of(context).primaryText,
                              backgroundColor: Colors.transparent,
                              errorBuilder: (context, error) => const SizedBox(
                                width: double.infinity,
                              ),
                              drawText: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFAppState().chavePix,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text:
                                                        FFAppState().chavePix));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Copiado com sucesso',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xFF00804C),
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.content_copy,
                                            color: Color(0xFF0C4D60),
                                            size: 33.0,
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: const LatLng(0.0, 0.0));
                                  var shouldSetState = false;
                                  _model.apiResultml2 =
                                      await StatusPixMPCall.call(
                                    idPix: FFAppState().idPedido,
                                  );

                                  shouldSetState = true;
                                  if ((_model.apiResultml2?.succeeded ??
                                      true)) {
                                    if (StatusPixMPCall.status(
                                          (_model.apiResultml2?.jsonBody ?? ''),
                                        ) ==
                                        'approved') {
                                      context.pushNamed('sucesso');

                                      await currentUserReference!.update({
                                        ...createUsersRecordData(
                                          minhaLocalizacao:
                                              currentUserLocationValue,
                                          dataDoProxPagamento: functions
                                              .daysSum(getCurrentTimestamp, () {
                                            if (FFAppState()
                                                    .Planoescolhido
                                                    .nomedoplano ==
                                                'Mensal') {
                                              return 30;
                                            } else if (FFAppState()
                                                    .Planoescolhido
                                                    .nomedoplano ==
                                                'Trimestral') {
                                              return 90;
                                            } else {
                                              return 365;
                                            }
                                          }()),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'precisaValidarPix_pixID':
                                                FieldValue.delete(),
                                          },
                                        ),
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Não recebemos seu pagamento',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFA93011),
                                        ),
                                      );
                                    }

                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          (_model.apiResultml2
                                                  ?.exceptionMessage ??
                                              ''),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor: const Color(0xFFA9111D),
                                      ),
                                    );
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (shouldSetState) safeSetState(() {});
                                },
                                text: 'Verificar status do pagamento',
                                icon: const Icon(
                                  Icons.search_rounded,
                                  size: 30.0,
                                ),
                                options: FFButtonOptions(
                                  height: 54.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 15.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Inter Tight',
                              fontSize: 1.0,
                              letterSpacing: 0.0,
                              lineHeight: 1.0,
                            ),
                    unselectedLabelStyle: const TextStyle(),
                    indicatorColor: const Color(0x00FB6610),
                    indicatorWeight: 1.0,
                    tabs: const [
                      Tab(
                        text: 'Bem vindo',
                      ),
                      Tab(
                        text: 'Cartão',
                      ),
                      Tab(
                        text: 'Pix',
                      ),
                    ],
                    controller: _model.tabBarController,
                    onTap: (i) async {
                      [() async {}, () async {}, () async {}][i]();
                    },
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
