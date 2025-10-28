import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:belanja_praktis/presentation/bloc/shopping_list_bloc.dart';
import 'package:belanja_praktis/presentation/bloc/shopping_list_event.dart';
import 'package:belanja_praktis/presentation/bloc/shopping_list_state.dart';
import 'package:go_router/go_router.dart';

class ShoppingListsScreen extends StatelessWidget {
  const ShoppingListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanja'),
      ),
      body: BlocBuilder<ShoppingListBloc, ShoppingListState>(
        builder: (context, state) {
          if (state is ShoppingListLoading || state is ShoppingListInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ShoppingListLoaded) {
            if (state.lists.isEmpty) {
              return const Center(child: Text('Belum ada daftar belanja. Tekan + untuk menambah.'));
            }
            return ListView.builder(
              itemCount: state.lists.length,
              itemBuilder: (context, index) {
                final list = state.lists[index];
                return ListTile(
                  title: Text(list.name),
                  subtitle: Text('Dibuat pada: ${DateTime.fromMillisecondsSinceEpoch(list.createdAt)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<ShoppingListBloc>().add(ShoppingListDeleted(list.id));
                    },
                  ),
                  onTap: () {
                    context.go('/list/\${list.id}');
                  },
                );
              },
            );
          } else if (state is ShoppingListError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddListDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddListDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Buat Daftar Belanja Baru'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Nama daftar belanja'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  context.read<ShoppingListBloc>().add(ShoppingListAdded(controller.text));
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }
}
