import 'dart:async';

class Cart {
  final StreamController _cartController = StreamController.broadcast();
  Stream get cartItens => _cartController.stream;

  // final StreamController _coustController = StreamController.broadcast();
  // Stream get cartCoust => _coustController.stream;

  final List<Map> itensCart = [];

  totalCoust() {
    double totalCoust = 0;
    for (var value in itensCart) {
      totalCoust = totalCoust + value['price'];
    }
    return totalCoust;
  }

  void addCart(item) {
    itensCart.addAll({item});
    _cartController.sink.add(itensCart);
    totalCoust();
  }

  void removeCart(item) {
    itensCart.remove(item);
    _cartController.sink.add(itensCart);
    totalCoust();
  }

  void dispose() {
    _cartController.close();
  }
}

final bloc = Cart();
