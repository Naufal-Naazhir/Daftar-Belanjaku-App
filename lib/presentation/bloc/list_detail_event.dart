import 'package:equatable/equatable.dart';
import 'package:belanja_praktis/data/app_database.dart';

abstract class ListDetailEvent extends Equatable {
  const ListDetailEvent();

  @override
  List<Object> get props => [];
}

class ListDetailStarted extends ListDetailEvent {
  final int listId;

  const ListDetailStarted(this.listId);

  @override
  List<Object> get props => [listId];
}

class ItemAdded extends ListDetailEvent {
  final String name;
  final double? price;
  final double? quantity;
  final String? unit;

  const ItemAdded({
    required this.name,
    this.price,
    this.quantity,
    this.unit,
  });

  @override
  List<Object> get props => [name, price ?? 0, quantity ?? 0, unit ?? ''];
}

class ItemToggledBought extends ListDetailEvent {
  final ShoppingItem item;

  const ItemToggledBought(this.item);

  @override
  List<Object> get props => [item];
}

class ItemDeleted extends ListDetailEvent {
  final int itemId;

  const ItemDeleted(this.itemId);

  @override
  List<Object> get props => [itemId];
}
