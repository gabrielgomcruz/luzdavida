import '/components/toast04_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plano_widget.dart' show PlanoWidget;
import 'package:flutter/material.dart';

class PlanoModel extends FlutterFlowModel<PlanoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Toast04 component.
  late Toast04Model toast04Model;

  @override
  void initState(BuildContext context) {
    toast04Model = createModel(context, () => Toast04Model());
  }

  @override
  void dispose() {
    toast04Model.dispose();
  }
}
