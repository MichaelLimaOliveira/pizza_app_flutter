import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/pizza_repository.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  @override
  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection.get().then((value) => value.docs
          .map((e) => Pizza.fromEntity(PizzaEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Pizza?> getPizza(String pizzaId) async {
    try {
      var pizzaDocument = await pizzaCollection.doc(pizzaId).get();

      if (pizzaDocument.exists) {
        return Pizza.fromEntity(
          PizzaEntity.fromDocument(pizzaDocument.data()!),
        );
      } else {
        // Retorna null se a pizza com o ID fornecido não for encontrada
        return null;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
