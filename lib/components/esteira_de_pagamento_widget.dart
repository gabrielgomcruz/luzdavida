import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'esteira_de_pagamento_model.dart';
export 'esteira_de_pagamento_model.dart';

class EsteiraDePagamentoWidget extends StatefulWidget {
  const EsteiraDePagamentoWidget({super.key});

  @override
  State<EsteiraDePagamentoWidget> createState() =>
      _EsteiraDePagamentoWidgetState();
}

class _EsteiraDePagamentoWidgetState extends State<EsteiraDePagamentoWidget> {
  late EsteiraDePagamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EsteiraDePagamentoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
