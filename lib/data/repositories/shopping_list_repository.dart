import 'package:belanja_praktis/data/app_database.dart';

abstract class ShoppingListRepository {
  // Shopping List operations
  Stream<List<ShoppingList>> watchLists();
  Future<int> addList(String name);
  Future<bool> updateList(ShoppingListsCompanion list);
  Future<int> deleteList(int id);

  // Shopping Item operations
  Stream<List<ShoppingItem>> watchItems(int listId);
  Future<int> addItem(ShoppingItemsCompanion item);
  Future<bool> updateItem(ShoppingItem item);
  Future<int> deleteItem(int id);
}

class ShoppingListRepositoryImpl implements ShoppingListRepository {
  final ShoppingListsDao _listDao;
  final ShoppingItemsDao _itemDao;

  ShoppingListRepositoryImpl(this._listDao, this._itemDao);

  @override
  Stream<List<ShoppingList>> watchLists() {
    return _listDao.watchAllLists();
  }

  @override
  Future<int> addList(String name) {
    return _listDao.createList(name);
  }

  @override
  Future<bool> updateList(ShoppingListsCompanion list) {
    return _listDao.updateList(list);
  }

  @override
  Future<int> deleteList(int id) {
    return _listDao.deleteList(id);
  }

  @override
  Stream<List<ShoppingItem>> watchItems(int listId) {
    return _itemDao.watchItemsInList(listId);
  }

  @override
  Future<int> addItem(ShoppingItemsCompanion item) {
    return _itemDao.addItem(item);
  }

  @override
  Future<bool> updateItem(ShoppingItem item) {
    return _itemDao.updateItem(item);
  }

  @override
  Future<int> deleteItem(int id) {
    return _itemDao.deleteItem(id);
  }
}
