import '/flutter_flow/flutter_flow_util.dart';
import 'avalie_experiencia_widget.dart' show AvalieExperienciaWidget;
import 'package:flutter/material.dart';

class AvalieExperienciaModel extends FlutterFlowModel<AvalieExperienciaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode;
  TextEditingController? shortBioTextController;
  String? Function(BuildContext, String?)? shortBioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    shortBioFocusNode?.dispose();
    shortBioTextController?.dispose();
  }
}
