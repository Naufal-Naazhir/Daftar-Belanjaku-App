import 'package:flutter_test/flutter_test.dart';
import 'package:belanja_praktis/data/app_database.dart';
import 'package:belanja_praktis/data/repositories/shopping_list_repository.dart';
import 'package:belanja_praktis/main.dart';

// 1. Create a mock/fake version of the repository
class MockShoppingListRepository implements ShoppingListRepository {
  @override
  Future<int> addList(String name) async => 1;

  @override
  Future<int> deleteList(int id) async => 1;

  @override
  Future<bool> updateList(ShoppingListsCompanion list) async => true;

  @override
  Stream<List<ShoppingList>> watchLists() => Stream.value([]); // Return an empty stream

  // New methods for ShoppingItem
  @override
  Future<int> addItem(ShoppingItemsCompanion item) async => 1;

  @override
  Future<int> deleteItem(int id) async => 1;

  @override
  Future<bool> updateItem(ShoppingItem item) async => true;

  @override
  Stream<List<ShoppingItem>> watchItems(int listId) => Stream.value([]);
}

void main() {
  testWidgets('App builds and shows AppBar title', (WidgetTester tester) async {
    // 2. Provide the mock repository to the app
    final mockRepository = MockShoppingListRepository();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(repository: mockRepository));

    // 3. Verify that the app shows the correct title.
    // This is a simple but valid test for the new app.
    expect(find.text('Daftar Belanja'), findsOneWidget);
  });
}