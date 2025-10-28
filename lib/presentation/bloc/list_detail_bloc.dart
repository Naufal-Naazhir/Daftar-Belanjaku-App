import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:belanja_praktis/data/app_database.dart';
import 'package:belanja_praktis/data/repositories/shopping_list_repository.dart';
import 'package:drift/drift.dart'; // NEW IMPORT
import './list_detail_event.dart';
import './list_detail_state.dart';

class ListDetailBloc extends Bloc<ListDetailEvent, ListDetailState> {
  final ShoppingListRepository _repository;
  final int _listId;

  ListDetailBloc({required ShoppingListRepository repository, required int listId})
      : _repository = repository,
        _listId = listId,
        super(ListDetailInitial()) {
    on<ListDetailStarted>(_onStarted);
    on<ItemAdded>(_onItemAdded);
    on<ItemToggledBought>(_onItemToggledBought);
    on<ItemDeleted>(_onItemDeleted);
  }

  void _onStarted(ListDetailStarted event, Emitter<ListDetailState> emit) async {
    emit(ListDetailLoading());
    try {
      await emit.forEach(
        _repository.watchItems(_listId),
        onData: (items) {
          final total = items.fold<double>(0.0, (sum, item) {
            if (item.isBought && item.price != null && item.quantity != null) {
              return sum + (item.price! * item.quantity!); // Only sum bought items with price and quantity
            }
            return sum;
          });
          return ListDetailLoaded(items: items, total: total);
        },
        onError: (error, stackTrace) => ListDetailError(error.toString()),
      );
    } catch (e) {
      emit(ListDetailError(e.toString()));
    }
  }

  void _onItemAdded(ItemAdded event, Emitter<ListDetailState> emit) async {
    try {
      await _repository.addItem(
        ShoppingItemsCompanion.insert(
          listId: _listId,
          name: event.name,
          price: Value(event.price),
          quantity: Value(event.quantity),
          unit: Value(event.unit),
          isBought: Value(false), // FIXED
        ),
      );
    } catch (e) {
      // Optionally, emit an error state to the UI
    }
  }

  void _onItemToggledBought(ItemToggledBought event, Emitter<ListDetailState> emit) async {
    try {
      await _repository.updateItem(
        event.item.copyWith(isBought: !event.item.isBought),
      );
    } catch (e) {
      // Optionally, emit an error state to the UI
    }
  }

  void _onItemDeleted(ItemDeleted event, Emitter<ListDetailState> emit) async {
    try {
      await _repository.deleteItem(event.itemId);
    } catch (e) {
      // Optionally, emit an error state to the UI
    }
  }
}
