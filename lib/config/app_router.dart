import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja_praktis/data/repositories/shopping_list_repository.dart';
import 'package:belanja_praktis/presentation/bloc/shopping_list_bloc.dart';
import 'package:belanja_praktis/presentation/bloc/shopping_list_event.dart';
import 'package:belanja_praktis/presentation/screens/shopping_lists_screen.dart';
import 'package:belanja_praktis/presentation/screens/list_detail_screen.dart'; // New import

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => ShoppingListBloc(
              context.read<ShoppingListRepository>(),
            )..add(ShoppingListStarted()),
            child: const ShoppingListsScreen(),
          );
        },
        routes: <RouteBase>[
          // The route for the detail screen
          GoRoute(
            path: 'list/:id',
            builder: (BuildContext context, GoRouterState state) {
              final listId = int.parse(state.pathParameters['id']!);
              return ListDetailScreen(listId: listId);
            },
          ),
        ],
      ),
    ],
  );
}
