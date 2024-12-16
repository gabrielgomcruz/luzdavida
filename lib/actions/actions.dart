import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future pixValidation(BuildContext context) async {
  ApiCallResponse? apiResult12x;
  LatLng currentUserLocationValue =
      await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));

  if (valueOrDefault(currentUserDocument?.precisaValidarPixPixID, '') != '') {
    apiResult12x = await StatusPixMPCall.call(
      idPix: functions.stringToInteger(
          valueOrDefault(currentUserDocument?.precisaValidarPixPixID, '')),
    );

    if (StatusPixMPCall.status(
          (apiResult12x.jsonBody ?? ''),
        ) ==
        'approved') {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Sucesso!'),
            content: const Text('Pagamento realizado.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      // clearCartPriceItems
      FFAppState().QRCode = '';
      FFAppState().chavePix = '';
      FFAppState().idPedido = 0;
      FFAppState().qualEscolhiPagar = 0;
      FFAppState().myCart = [];
      FFAppState().myCartSummary = [];
      FFAppState().update(() {});

      await currentUserReference!.update({
        ...createUsersRecordData(
          minhaLocalizacao: currentUserLocationValue,
          dataDoProxPagamento: functions.daysSum(getCurrentTimestamp, () {
            if (FFAppState().Planoescolhido.nomedoplano == 'Mensal') {
              return 30;
            } else if (FFAppState().Planoescolhido.nomedoplano ==
                'Trimestral') {
              return 90;
            } else {
              return 365;
            }
          }()),
        ),
        ...mapToFirestore(
          {
            'precisaValidarPix_pixID': FieldValue.delete(),
          },
        ),
      });
      return;
    } else {
      return;
    }
  } else {
    return;
  }
}
