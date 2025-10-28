import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:belanja_praktis/data/app_database.dart';
import 'package:belanja_praktis/data/repositories/shopping_list_repository.dart';
import 'package:belanja_praktis/config/app_router.dart';

void main() {
  // Initialize dependencies
  final AppDatabase database = AppDatabase();
  final ShoppingListRepository repository = ShoppingListRepositoryImpl(database.shoppingListsDao, database.shoppingItemsDao);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ShoppingListRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: MaterialApp.router(
        title: 'Belanja Praktis',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}