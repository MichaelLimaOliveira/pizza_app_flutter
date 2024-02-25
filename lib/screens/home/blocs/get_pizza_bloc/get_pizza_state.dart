part of 'get_pizza_bloc.dart';

sealed class GetPizzaState extends Equatable {
  const GetPizzaState();

  @override
  List<Object> get props => [];
}

final class GetPizzaInitial extends GetPizzaState {}

final class GetPizzaFailure extends GetPizzaState {}

final class GetPizzaLoading extends GetPizzaState {}

final class GetPizzaSuccess extends GetPizzaState {
  final List<Pizza> pizzas;

  const GetPizzaSuccess(this.pizzas);

  @override
  List<Object> get props => [pizzas];
}

final class GetOnePizzaFailure extends GetPizzaState {}

final class GetOnePizzaLoading extends GetPizzaState {}

final class GetOnePizzaSuccess extends GetPizzaState {
  final Pizza pizza;

  const GetOnePizzaSuccess(this.pizza);

  @override
  List<Object> get props => [pizza];
}
