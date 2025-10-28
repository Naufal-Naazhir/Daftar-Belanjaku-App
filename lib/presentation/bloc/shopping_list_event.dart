import 'package:equatable/equatable.dart';

abstract class ShoppingListEvent extends Equatable {
  const ShoppingListEvent();

  @override
  List<Object> get props => [];
}

class ShoppingListStarted extends ShoppingListEvent {}

class ShoppingListAdded extends ShoppingListEvent {
  final String name;

  const ShoppingListAdded(this.name);

  @override
  List<Object> get props => [name];
}

class ShoppingListDeleted extends ShoppingListEvent {
  final int id;

  const ShoppingListDeleted(this.id);

  @override
  List<Object> get props => [id];
}
