import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _myCart =
          prefs.getStringList('ff_myCart')?.map((path) => path.ref).toList() ??
              _myCart;
    });
    _safeInit(() {
      _myCartSummary =
          prefs.getStringList('ff_myCartSummary')?.map(double.parse).toList() ??
              _myCartSummary;
    });
    _safeInit(() {
      _Planos = prefs
              .getStringList('ff_Planos')
              ?.map((x) {
                try {
                  return PlanosStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Planos;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Planoescolhido')) {
        try {
          final serializedData = prefs.getString('ff_Planoescolhido') ?? '{}';
          _Planoescolhido =
              PlanosStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _cartaoEscolhidoID =
          prefs.getInt('ff_cartaoEscolhidoID') ?? _cartaoEscolhidoID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _myCart = [];
  List<DocumentReference> get myCart => _myCart;
  set myCart(List<DocumentReference> value) {
    _myCart = value;
    prefs.setStringList('ff_myCart', value.map((x) => x.path).toList());
  }

  void addToMyCart(DocumentReference value) {
    myCart.add(value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void removeFromMyCart(DocumentReference value) {
    myCart.remove(value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void removeAtIndexFromMyCart(int index) {
    myCart.removeAt(index);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void updateMyCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myCart[index] = updateFn(_myCart[index]);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void insertAtIndexInMyCart(int index, DocumentReference value) {
    myCart.insert(index, value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  List<double> _myCartSummary = [];
  List<double> get myCartSummary => _myCartSummary;
  set myCartSummary(List<double> value) {
    _myCartSummary = value;
    prefs.setStringList(
        'ff_myCartSummary', value.map((x) => x.toString()).toList());
  }

  void addToMyCartSummary(double value) {
    myCartSummary.add(value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void removeFromMyCartSummary(double value) {
    myCartSummary.remove(value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromMyCartSummary(int index) {
    myCartSummary.removeAt(index);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void updateMyCartSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    myCartSummary[index] = updateFn(_myCartSummary[index]);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void insertAtIndexInMyCartSummary(int index, double value) {
    myCartSummary.insert(index, value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;
  set pageNumber(int value) {
    _pageNumber = value;
  }

  LatLng? _minhaLocalizacao = const LatLng(-24.0030665, -46.4178533);
  LatLng? get minhaLocalizacao => _minhaLocalizacao;
  set minhaLocalizacao(LatLng? value) {
    _minhaLocalizacao = value;
  }

  List<DocumentReference> _produtosAdicionadosStatisstics = [];
  List<DocumentReference> get produtosAdicionadosStatisstics =>
      _produtosAdicionadosStatisstics;
  set produtosAdicionadosStatisstics(List<DocumentReference> value) {
    _produtosAdicionadosStatisstics = value;
  }

  void addToProdutosAdicionadosStatisstics(DocumentReference value) {
    produtosAdicionadosStatisstics.add(value);
  }

  void removeFromProdutosAdicionadosStatisstics(DocumentReference value) {
    produtosAdicionadosStatisstics.remove(value);
  }

  void removeAtIndexFromProdutosAdicionadosStatisstics(int index) {
    produtosAdicionadosStatisstics.removeAt(index);
  }

  void updateProdutosAdicionadosStatissticsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    produtosAdicionadosStatisstics[index] =
        updateFn(_produtosAdicionadosStatisstics[index]);
  }

  void insertAtIndexInProdutosAdicionadosStatisstics(
      int index, DocumentReference value) {
    produtosAdicionadosStatisstics.insert(index, value);
  }

  double _propPrice = 0.0;
  double get propPrice => _propPrice;
  set propPrice(double value) {
    _propPrice = value;
  }

  double _propPrice2 = 0.0;
  double get propPrice2 => _propPrice2;
  set propPrice2(double value) {
    _propPrice2 = value;
  }

  double _propPrice3 = 0.0;
  double get propPrice3 => _propPrice3;
  set propPrice3(double value) {
    _propPrice3 = value;
  }

  double _propPrice4 = 0.0;
  double get propPrice4 => _propPrice4;
  set propPrice4(double value) {
    _propPrice4 = value;
  }

  List<PlanosStruct> _Planos = [];
  List<PlanosStruct> get Planos => _Planos;
  set Planos(List<PlanosStruct> value) {
    _Planos = value;
    prefs.setStringList('ff_Planos', value.map((x) => x.serialize()).toList());
  }

  void addToPlanos(PlanosStruct value) {
    Planos.add(value);
    prefs.setStringList(
        'ff_Planos', _Planos.map((x) => x.serialize()).toList());
  }

  void removeFromPlanos(PlanosStruct value) {
    Planos.remove(value);
    prefs.setStringList(
        'ff_Planos', _Planos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPlanos(int index) {
    Planos.removeAt(index);
    prefs.setStringList(
        'ff_Planos', _Planos.map((x) => x.serialize()).toList());
  }

  void updatePlanosAtIndex(
    int index,
    PlanosStruct Function(PlanosStruct) updateFn,
  ) {
    Planos[index] = updateFn(_Planos[index]);
    prefs.setStringList(
        'ff_Planos', _Planos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPlanos(int index, PlanosStruct value) {
    Planos.insert(index, value);
    prefs.setStringList(
        'ff_Planos', _Planos.map((x) => x.serialize()).toList());
  }

  PlanosStruct _Planoescolhido = PlanosStruct.fromSerializableMap(jsonDecode(
      '{\"Nomedoplano\":\"Mensal\",\"Preco\":\"100\",\"installments\":\"1\"}'));
  PlanosStruct get Planoescolhido => _Planoescolhido;
  set Planoescolhido(PlanosStruct value) {
    _Planoescolhido = value;
    prefs.setString('ff_Planoescolhido', value.serialize());
  }

  void updatePlanoescolhidoStruct(Function(PlanosStruct) updateFn) {
    updateFn(_Planoescolhido);
    prefs.setString('ff_Planoescolhido', _Planoescolhido.serialize());
  }

  String _QRCode = '';
  String get QRCode => _QRCode;
  set QRCode(String value) {
    _QRCode = value;
  }

  String _chavePix = '';
  String get chavePix => _chavePix;
  set chavePix(String value) {
    _chavePix = value;
  }

  int _idPedido = 0;
  int get idPedido => _idPedido;
  set idPedido(int value) {
    _idPedido = value;
  }

  int _qualEscolhiPagar = 0;
  int get qualEscolhiPagar => _qualEscolhiPagar;
  set qualEscolhiPagar(int value) {
    _qualEscolhiPagar = value;
  }

  int _cartaoEscolhidoID = 0;
  int get cartaoEscolhidoID => _cartaoEscolhidoID;
  set cartaoEscolhidoID(int value) {
    _cartaoEscolhidoID = value;
    prefs.setInt('ff_cartaoEscolhidoID', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
