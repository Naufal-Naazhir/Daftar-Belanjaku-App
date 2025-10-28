import 'package:belanja_praktis/data/app_database.dart';
import 'package:equatable/equatable.dart';

abstract class ShoppingListState extends Equatable {
  const ShoppingListState();

  @override
  List<Object> get props => [];
}

class ShoppingListInitial extends ShoppingListState {}

class ShoppingListLoading extends ShoppingListState {}

class ShoppingListLoaded extends ShoppingListState {
  final List<ShoppingList> lists;

  const ShoppingListLoaded(this.lists);

  @override
  List<Object> get props => [lists];
}

class ShoppingListError extends ShoppingListState {
  final String message;

  const ShoppingListError(this.message);

  @override
  List<Object> get props => [message];
}
