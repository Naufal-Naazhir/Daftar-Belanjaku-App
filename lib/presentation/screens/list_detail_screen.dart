import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:belanja_praktis/data/repositories/shopping_list_repository.dart';
import 'package:belanja_praktis/presentation/bloc/list_detail_bloc.dart';
import 'package:belanja_praktis/presentation/bloc/list_detail_event.dart';
import 'package:belanja_praktis/presentation/bloc/list_detail_state.dart';

class ListDetailScreen extends StatelessWidget {
  final int listId;

  const ListDetailScreen({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListDetailBloc(
        repository: context.read<ShoppingListRepository>(),
        listId: listId,
      )..add(ListDetailStarted(listId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Daftar Belanja'),
          actions: [
            BlocBuilder<ListDetailBloc, ListDetailState>(
              builder: (context, state) {
                if (state is ListDetailLoaded) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Total: Rp \${state.total.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: BlocBuilder<ListDetailBloc, ListDetailState>(
          builder: (context, state) {
            if (state is ListDetailLoading || state is ListDetailInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ListDetailLoaded) {
              if (state.items.isEmpty) {
                return const Center(child: Text('Belum ada item di daftar ini. Tekan + untuk menambah.'));
              }
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ListTile(
                    leading: Checkbox(
                      value: item.isBought,
                      onChanged: (bool? value) {
                        context.read<ListDetailBloc>().add(ItemToggledBought(item));
                      },
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(
                        decoration: item.isBought ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      '${item.quantity?.toString() ?? '-'} ${item.unit ?? ''} @ Rp ${item.price?.toStringAsFixed(2) ?? '-'}',
                      style: TextStyle(
                        decoration: item.isBought ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<ListDetailBloc>().add(ItemDeleted(item.id));
                      },
                    ),
                  );
                },
              );
            } else if (state is ListDetailError) {
              return Center(child: Text('Error: \${state.message}'));
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddItemDialog(context, listId),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, int listId) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController unitController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Tambah Item Baru'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'Nama Item'),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Harga (opsional)'),
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Kuantitas (opsional)'),
                ),
                TextField(
                  controller: unitController,
                  decoration: const InputDecoration(hintText: 'Satuan (opsional, cth: kg, pcs)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  context.read<ListDetailBloc>().add(
                        ItemAdded(
                          name: nameController.text,
                          price: double.tryParse(priceController.text),
                          quantity: double.tryParse(quantityController.text),
                          unit: unitController.text.isNotEmpty ? unitController.text : null,
                        ),
                      );
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
