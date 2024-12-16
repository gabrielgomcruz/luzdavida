import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pagamento_widget.dart' show PagamentoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PagamentoModel extends FlutterFlowModel<PagamentoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (Pix MP)] action in Button widget.
  ApiCallResponse? apiResult3pnCopy23;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MeusCartoesRow>? cartaoEscolhidoPlus;
  // Stores action output result for [Backend Call - API (Criar Token)] action in Button widget.
  ApiCallResponse? criarTokenCopy;
  // Stores action output result for [Backend Call - API (Pagamento Cartao MP)] action in Button widget.
  ApiCallResponse? pagarCopy;
  // State field(s) for nomeIMpresso widget.
  FocusNode? nomeIMpressoFocusNode;
  TextEditingController? nomeIMpressoTextController;
  String? Function(BuildContext, String?)? nomeIMpressoTextControllerValidator;
  String? _nomeIMpressoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    if (val.length < 11) {
      return 'Seu CPF não está completo';
    }

    return null;
  }

  // State field(s) for numeroCartao widget.
  FocusNode? numeroCartaoFocusNode;
  TextEditingController? numeroCartaoTextController;
  String? Function(BuildContext, String?)? numeroCartaoTextControllerValidator;
  String? _numeroCartaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    return null;
  }

  // State field(s) for Mes widget.
  FocusNode? mesFocusNode;
  TextEditingController? mesTextController;
  final mesMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? mesTextControllerValidator;
  String? _mesTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    if (val.length < 2) {
      return 'mínimo de 2 números';
    }
    if (val.length > 2) {
      return '2 números';
    }

    return null;
  }

  // State field(s) for Ano widget.
  FocusNode? anoFocusNode;
  TextEditingController? anoTextController;
  final anoMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? anoTextControllerValidator;
  String? _anoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório ano inteiro 20..';
    }

    if (val.length < 4) {
      return 'mínimo de 2 números';
    }
    if (val.length > 4) {
      return '4 números apenas';
    }

    return null;
  }

  // State field(s) for CVV widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvTextController;
  final cvvMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cvvTextControllerValidator;
  String? _cvvTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Criar Token)] action in Button widget.
  ApiCallResponse? criarTokenCopy237;
  // Stores action output result for [Backend Call - API (Pagamento Cartao MP)] action in Button widget.
  ApiCallResponse? pagarCopy12;
  // Stores action output result for [Backend Call - API (Status Pix MP)] action in Button widget.
  ApiCallResponse? apiResultml2;

  @override
  void initState(BuildContext context) {
    nomeIMpressoTextControllerValidator = _nomeIMpressoTextControllerValidator;
    cpfTextControllerValidator = _cpfTextControllerValidator;
    numeroCartaoTextControllerValidator = _numeroCartaoTextControllerValidator;
    mesTextControllerValidator = _mesTextControllerValidator;
    anoTextControllerValidator = _anoTextControllerValidator;
    cvvTextControllerValidator = _cvvTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeIMpressoFocusNode?.dispose();
    nomeIMpressoTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    numeroCartaoFocusNode?.dispose();
    numeroCartaoTextController?.dispose();

    mesFocusNode?.dispose();
    mesTextController?.dispose();

    anoFocusNode?.dispose();
    anoTextController?.dispose();

    cvvFocusNode?.dispose();
    cvvTextController?.dispose();
  }
}
