part of 'fruit_bloc.dart';

@immutable
abstract class FruitEvent {}

class MoveEvent extends FruitEvent {
  final int sourceIndex;
  final int destinationIndex;
  final FruitType fruitType;
  final bool fromBasket;
  final bool toBasket;

  MoveEvent({
    required this.sourceIndex,
    required this.destinationIndex,
    required this.fruitType,
    this.fromBasket = false,
    this.toBasket = false,
  });
}
