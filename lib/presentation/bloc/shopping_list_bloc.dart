import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:belanja_praktis/data/repositories/shopping_list_repository.dart';
import './shopping_list_event.dart';
import './shopping_list_state.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  final ShoppingListRepository _repository;

  ShoppingListBloc(this._repository) : super(ShoppingListInitial()) {
    on<ShoppingListStarted>(_onStarted);
    on<ShoppingListAdded>(_onListAdded);
    on<ShoppingListDeleted>(_onListDeleted);
  }

  void _onStarted(ShoppingListStarted event, Emitter<ShoppingListState> emit) async {
    emit(ShoppingListLoading());
    try {
      await emit.forEach(
        _repository.watchLists(),
        onData: (lists) => ShoppingListLoaded(lists),
        onError: (error, stackTrace) => ShoppingListError(error.toString()),
      );
    } catch (e) {
      emit(ShoppingListError(e.toString()));
    }
  }

  void _onListAdded(ShoppingListAdded event, Emitter<ShoppingListState> emit) async {
    try {
      await _repository.addList(event.name);
      // The stream from watchLists will automatically emit the updated list
    } catch (e) {
      // Optionally, emit an error state to the UI
    }
  }

  void _onListDeleted(ShoppingListDeleted event, Emitter<ShoppingListState> emit) async {
    try {
      await _repository.deleteList(event.id);
      // The stream from watchLists will automatically emit the updated list
    } catch (e) {
      // Optionally, emit an error state to the UI
    }
  }
}
