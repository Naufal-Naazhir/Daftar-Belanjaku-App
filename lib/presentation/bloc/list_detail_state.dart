import 'package:equatable/equatable.dart';
import 'package:belanja_praktis/data/app_database.dart';

abstract class ListDetailState extends Equatable {
  const ListDetailState();

  @override
  List<Object> get props => [];
}

class ListDetailInitial extends ListDetailState {}

class ListDetailLoading extends ListDetailState {}

class ListDetailLoaded extends ListDetailState {
  final List<ShoppingItem> items;
  final double total;

  const ListDetailLoaded({required this.items, required this.total});

  @override
  List<Object> get props => [items, total];
}

class ListDetailError extends ListDetailState {
  final String message;

  const ListDetailError(this.message);

  @override
  List<Object> get props => [message];
}
