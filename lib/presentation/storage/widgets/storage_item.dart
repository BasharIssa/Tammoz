// lib/presentation/widgets/storage/storage_item.dart

import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';

class StorageItem extends StatelessWidget {
  final Storage storage;
  final VoidCallback onTap;

  const StorageItem({
    super.key,
    required this.storage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.inventory_2),
        title: Text('${storage.plantType} - ${storage.plantShape}'),
        subtitle: Text('الكمية: ${storage.quantity}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showIncreaseDialog(context),
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => _showDecreaseDialog(context),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  void _showIncreaseDialog(BuildContext context) {
    // Implementation for increase quantity dialog
  }

  void _showDecreaseDialog(BuildContext context) {
    // Implementation for decrease quantity dialog
  }
}