import 'models/models.dart';

abstract class PizzaRepo {
  Future<List<Pizza>> getPizzas();
  Future<Pizza?> getPizza(String pizzaId);
}
