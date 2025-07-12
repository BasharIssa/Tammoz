
import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';

class SecondStorageItem extends StatelessWidget {
  final Storage storage;
  final VoidCallback onLongPress;

  const SecondStorageItem({
    super.key,
    required this.storage,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.inventory_2),
        title: Text('${storage.plantType} - ${storage.plantShape} -${storage.parentOperationDate.toIso8601String()}'),
        subtitle: Text('الكمية: ${storage.quantity}'),
        onLongPress: onLongPress,

      ),
    );
  }

}