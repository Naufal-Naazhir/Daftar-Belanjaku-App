
import 'package:belanja_praktis/data/app_database.dart';

// This is a data class that will hold the result of a query.
// Although drift can generate data classes for you, defining them manually
// can be useful for more complex queries or when you want to add custom logic.
class ShoppingListWithItemCount {
  final ShoppingList list;
  final int itemCount;

  ShoppingListWithItemCount({required this.list, required this.itemCount});
}
