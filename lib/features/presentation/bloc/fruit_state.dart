part of 'fruit_bloc.dart';

@immutable
class FruitState {
  final List<Tray> trays;
  final List<Basket> baskets;

  const FruitState({required this.trays, required this.baskets});
}
