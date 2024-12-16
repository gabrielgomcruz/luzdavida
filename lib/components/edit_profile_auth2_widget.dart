import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_profile_auth2_model.dart';
export 'edit_profile_auth2_model.dart';

class EditProfileAuth2Widget extends StatefulWidget {
  const EditProfileAuth2Widget({
    super.key,
    String? title,
    String? confirmButtonText,
    required this.navigateAction,
    required this.usr,
  })  : title = title ?? 'Edit Profile',
        confirmButtonText = confirmButtonText ?? 'Save Changes';

  final String title;
  final String confirmButtonText;
  final Future Function()? navigateAction;
  final DocumentReference? usr;

  @override
  State<EditProfileAuth2Widget> createState() => _EditProfileAuth2WidgetState();
}

class _EditProfileAuth2WidgetState extends State<EditProfileAuth2Widget> {
  late EditProfileAuth2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileAuth2Model());

    _model.nomeCompletoTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nomeCompletoFocusNode ??= FocusNode();

    _model.cpfTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.cpf, ''));
    _model.cpfFocusNode ??= FocusNode();

    _model.dataNascimentoTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.dataNascimento, ''));
    _model.dataNascimentoFocusNode ??= FocusNode();

    _model.celularTextController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.celularFocusNode ??= FocusNode();

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

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
            child: Text(
              widget.title,
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 200),
                                  fadeOutDuration: const Duration(milliseconds: 200),
                                  imageUrl: valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/luz-da-vida-iym9jw/assets/p49dmi4023ud/ballon.png',
                                  ),
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        imageQuality: 83,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading1 = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Enviando arquivo...',
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading1 = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile1 =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl1 = downloadUrls.first;
                          });
                          showUploadMessage(context, 'Sucesso!');
                        } else {
                          safeSetState(() {});
                          showUploadMessage(context, 'Falha ao enviar dados.');
                          return;
                        }
                      }

                      await currentUserReference!.update(createUsersRecordData(
                        photoUrl: _model.uploadedFileUrl1,
                      ));
                    },
                    text: 'Trocar foto',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).inputBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter Tight',
                                letterSpacing: 0.0,
                              ),
                      elevation: 1.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.nomeCompletoTextController,
                          focusNode: _model.nomeCompletoFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nome completo',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.nomeCompletoTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.cpfTextController,
                          focusNode: _model.cpfFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.cpfTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.cpfMask],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.dataNascimentoTextController,
                          focusNode: _model.dataNascimentoFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Sua data de nascimento',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model
                              .dataNascimentoTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.dataNascimentoMask],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.celularTextController,
                          focusNode: _model.celularFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Celular',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.celularTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.celularMask],
                        ),
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) =>
                        FutureBuilder<List<CidadesDisponveisRow>>(
                      future: CidadesDisponveisTable().queryRows(
                        queryFn: (q) => q,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<CidadesDisponveisRow>
                            dropDownCidadesDisponveisRowList = snapshot.data!;

                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= valueOrDefault(
                                currentUserDocument?.minhaCidade, ''),
                          ),
                          options: dropDownCidadesDisponveisRowList
                              .map((e) => e.titulo)
                              .withoutNulls
                              .toList(),
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Escolha sua cidade',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 4.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowDropDown<String>(
                        controller: _model.dropDownCursoValueController ??=
                            FormFieldController<String>(
                          _model.dropDownCursoValue ??= valueOrDefault(
                              currentUserDocument?.possuiCUrso, ''),
                        ),
                        options: const ['Sim', 'Não'],
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownCursoValue = val);
                          if (_model.dropDownCursoValue == 'Não') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Sentimos muito!'),
                                  content: const Text(
                                      'Atualmente estamos trabalhando somente com cuidadores que possuem curso.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        width: double.infinity,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Possui curso de cuidador?',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 4.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Text(
                            'Insira suas informações de plantão',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Plantão de 8 horas (R\$)',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => SizedBox(
                                  width: double.infinity,
                                  height: 55.0,
                                  child: custom_widgets.PriceField(
                                    width: double.infinity,
                                    height: 55.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 4.0,
                                    initialValue: valueOrDefault<String>(
                                      valueOrDefault(
                                              currentUserDocument?.oitoHoras,
                                              0.0)
                                          .toString(),
                                      '0',
                                    ),
                                    fontSize: 14.0,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 5.0)),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Plantão de 12 horas (R\$)',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => SizedBox(
                                  width: double.infinity,
                                  height: 55.0,
                                  child: custom_widgets.PriceField2(
                                    width: double.infinity,
                                    height: 55.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 4.0,
                                    initialValue: valueOrDefault<String>(
                                      valueOrDefault(
                                              currentUserDocument?.dozeHoras,
                                              0.0)
                                          .toString(),
                                      '0',
                                    ),
                                    fontSize: 14.0,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 5.0)),
                          ),
                        ),
                      ].divide(const SizedBox(width: 15.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plantão de 24 horas (R\$)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => SizedBox(
                                width: double.infinity,
                                height: 55.0,
                                child: custom_widgets.PriceField3(
                                  width: double.infinity,
                                  height: 55.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 4.0,
                                  initialValue: valueOrDefault<String>(
                                    valueOrDefault(
                                            currentUserDocument
                                                ?.vintequatroHoras,
                                            0.0)
                                        .toString(),
                                    '0',
                                  ),
                                  fontSize: 14.0,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hora adicional (R\$)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => SizedBox(
                                width: double.infinity,
                                height: 55.0,
                                child: custom_widgets.HoraAdicional(
                                  width: double.infinity,
                                  height: 55.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 4.0,
                                  initialValue: valueOrDefault<String>(
                                    valueOrDefault(
                                            currentUserDocument?.horaAdicional,
                                            0.0)
                                        .toString(),
                                    '0',
                                  ),
                                  fontSize: 14.0,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ),
                    ].divide(const SizedBox(width: 15.0)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Text(
                            'Iremos verificar a informação. Por segurança nós solicitamos seus antecedentes criminais. ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ),
                  StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(currentUserReference!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }

                      final containerUsersRecord = snapshot.data!;

                      return Container(
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: containerUsersRecord.arquivo != '',
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL(valueOrDefault(
                                        currentUserDocument?.arquivo, ''));
                                  },
                                  child: Text(
                                    'antecedentes.pdf',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Tem certeza?'),
                                                content: const Text(
                                                    'Você removerá seu arquivo de antecedentes criminais, tem certeza?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: const Text('Voltar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: const Text('Excluir'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'arquivo': FieldValue.delete(),
                                        },
                                      ),
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.close_outlined,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final selectedFiles = await selectFiles(
                          multiFile: false,
                        );
                        if (selectedFiles != null) {
                          safeSetState(() => _model.isDataUploading2 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            showUploadMessage(
                              context,
                              'Enviando arquivo...',
                              showLoading: true,
                            );
                            selectedUploadedFiles = selectedFiles
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                    ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedFiles.map(
                                (f) async =>
                                    await uploadData(f.storagePath, f.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading2 = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedFiles.length &&
                              downloadUrls.length == selectedFiles.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile2 =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl2 = downloadUrls.first;
                            });
                            showUploadMessage(
                              context,
                              'Sucesso!',
                            );
                          } else {
                            safeSetState(() {});
                            showUploadMessage(
                              context,
                              'Falha ao enviar dados.',
                            );
                            return;
                          }
                        }

                        await currentUserReference!
                            .update(createUsersRecordData(
                          arquivo: _model.uploadedFileUrl2,
                        ));
                        safeSetState(() => _model.requestCompleter = null);
                        await _model.waitForRequestCompleted();
                      },
                      text: 'Antecedentes criminais',
                      icon: const Icon(
                        Icons.file_download_outlined,
                        size: 25.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 54.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Figtree',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.hail,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Text(
                            'Selecione quais serviços você oferece',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) =>
                        FutureBuilder<List<ServiosQueOfereoRow>>(
                      future: (_model.requestCompleter ??=
                              Completer<List<ServiosQueOfereoRow>>()
                                ..complete(ServiosQueOfereoTable().queryRows(
                                  queryFn: (q) => q,
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ServiosQueOfereoRow>
                            checkboxGroupServiosQueOfereoRowList =
                            snapshot.data!;

                        return FlutterFlowCheckboxGroup(
                          options: checkboxGroupServiosQueOfereoRowList
                              .map((e) => e.titulo)
                              .withoutNulls
                              .toList(),
                          onChanged: (val) => safeSetState(
                              () => _model.checkboxGroupValues = val),
                          controller: _model.checkboxGroupValueController ??=
                              FormFieldController<List<String>>(
                            List.from(
                                (currentUserDocument?.meusServicos.toList() ??
                                        []) ??
                                    []),
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          checkboxBorderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          itemPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          checkboxBorderRadius: BorderRadius.circular(4.0),
                          initialized: _model.checkboxGroupValues != null,
                        );
                      },
                    ),
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Color(0xB3989898),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
              child: FFButtonWidget(
                onPressed: (_model.dropDownCursoValue == 'Não')
                    ? null
                    : () async {
                        if ((valueOrDefault(
                                        currentUserDocument?.arquivo, '') !=
                                    '') &&
                            (currentUserPhoto != '')) {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (_model.dropDownValue == null) {
                            return;
                          }
                          if (_model.dropDownCursoValue == null) {
                            return;
                          }
                          // updateUserInfo

                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              displayName:
                                  _model.nomeCompletoTextController.text,
                              phoneNumber: _model.celularTextController.text,
                              oitoHoras: FFAppState().propPrice,
                              dozeHoras: FFAppState().propPrice2,
                              vintequatroHoras: FFAppState().propPrice3,
                              horaAdicional: FFAppState().propPrice4,
                              minhaCidade: _model.dropDownValue,
                              arquivo: _model.uploadedFileUrl2,
                              cpf: _model.cpfTextController.text,
                              dataNascimento:
                                  _model.dataNascimentoTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'meusServicos': _model.checkboxGroupValues,
                              },
                            ),
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Perfil atualizado com sucesso!',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                          );
                          await widget.navigateAction?.call();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não deixe informações vazias.',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }
                      },
                text: widget.confirmButtonText,
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 49.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
