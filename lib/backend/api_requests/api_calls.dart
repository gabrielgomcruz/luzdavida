import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PixMPCall {
  static Future<ApiCallResponse> call({
    double? transactionAmount = 23.93,
    String? description = 'teste de validacao',
    String? firstName = 'Gabriel Gomes',
    String? identificationType = 'CPF',
    String? numberCpf = '33236309806',
    String? email = 'abramshvilli.gab@gmail.com',
    String? paymentMethodId = 'pix',
    String? idTransacao = '234523',
    String? accessToken =
        'APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
  }) async {
    final ffApiRequestBody = '''
{
  "description": "$description",
  "transaction_amount": $transactionAmount,
  "payment_method_id": "$paymentMethodId",
  "payer": {
    "email": "$email",
    "first_name": "$firstName",
    "identification": {
      "type": "CPF",
      "number": "$numberCpf"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pix MP',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
        'X-Idempotency-Key': '$idTransacao',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? idPedido(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? chavePix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code''',
      ));
  static String? qrCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code_base64''',
      ));
  static String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CriarTokenCall {
  static Future<ApiCallResponse> call({
    String? cardNumber = '',
    String? cardholderName = '',
    String? cardExpirationMonth = '',
    String? cardExpirationYear = '',
    String? securityCode = '',
    String? identificationType = '',
    String? accessToken = '',
    String? publicKey = '',
    String? identificationNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "card_number": "$cardNumber",
  "cardholder": {
    "name": "$cardholderName",
    "identification": {
      "type": "$identificationType",
      "number": "$identificationNumber"
    }
  },
  "security_code": "$securityCode",
  "expiration_month": "$cardExpirationMonth",
  "expiration_year": "$cardExpirationYear"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Token',
      apiUrl:
          'https://api.mercadopago.com/v1/card_tokens?public_key=$publicKey',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class PagamentoCartaoMPCall {
  static Future<ApiCallResponse> call({
    double? transactionAmount,
    String? token = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? zipCode = '',
    String? streetName = '',
    String? neighborhood = '',
    String? city = '',
    String? federalUnit = '',
    String? description = '',
    String? accessToken = '',
    int? installments,
    String? streetNumber = '',
    String? idTransacao = '',
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": $transactionAmount,
  "token": "$token",
  "installments": $installments,
  "payer": {
    "first_name": "$firstName",
    "last_name": "$lastName",
    "email": "$email",
    "type": "customer",
    "identification": {
      "type": "$identificationType",
      "number": "$identificationNumber"
    },
    "address": {
      "zip_code": "$zipCode",
      "street_name": "$streetName",
      "street_number": "$streetNumber",
      "neighborhood": "$neighborhood",
      "city": "$city",
      "federal_unit": "$federalUnit"
    }
  },
  "description": "$description"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pagamento Cartao MP',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4068040856371180-042421-f433eb87c4d587d439a85cb81edb4906-1785822096',
        'Content-Type': 'application/json',
        'X-Idempotency-Key': '$idTransacao',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StatusPixMPCall {
  static Future<ApiCallResponse> call({
    int? idPix,
    String? accessToken =
        'APP_USR-5372105489171284-050814-445e2a5d707a1e484ddd92c87025ec7e-1799757303',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Status Pix MP',
      apiUrl: 'https://api.mercadopago.com/v1/payments/$idPix',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
