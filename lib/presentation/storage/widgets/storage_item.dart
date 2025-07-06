// lib/presentation/widgets/storage/storage_item.dart

import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/constants.dart';
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
        title: Text('${storage.plantType} - ${storage.plantShape} -${storage.parentOperationDate.toIso8601String()}'),
        subtitle: Text('الكمية: ${storage.quantity}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.cut_sharp),
              onPressed: () => _showAddPruningPage(context),
            ),
            IconButton(
              icon: const Icon(Icons.merge_sharp),
              onPressed: () => _showNextStoragePage(context),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  void _showAddPruningPage(BuildContext context) {
    //.pop(context); // لإغلاق الـ Drawer أو Dialog إذا كنت تستخدمه

    Navigator.pushNamed(
      context,
      PagesRoutesConstants.addPruning,
      arguments: {
          'preselectedOperationName': OperationTypesConstants.pruning,
          'selectedStorage': storage
        },

    );
  }

  void _showNextStoragePage( BuildContext context ) {
    Navigator.pushNamed(
        context,
        PagesRoutesConstants.selectSecondStorage,
        arguments: {
          'preselectedOperationName': OperationTypesConstants.grafting,
          'firstStorage': storage,
        }
    );
  }
}