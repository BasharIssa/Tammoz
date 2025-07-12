// lib/presentation/storage/widgets/storage_details_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/presentation/storage/bloc/storage_bloc.dart';
import 'package:local_tammoz_chat/presentation/storage/widgets/quantity_manager.dart';
import 'package:local_tammoz_chat/presentation/storage/widgets/storage_edit_dialog.dart';

class StorageDetailsDialog extends StatelessWidget {
  final Storage storage;

  const StorageDetailsDialog({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('تفاصيل العنصر'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetailRow('نوع النبات', storage.plantType),
            _buildDetailRow('شكل النبات', storage.plantShape),
            _buildDetailRow('الكمية', storage.quantity.toString()),
            _buildDetailRow('العملية الأم', storage.parentOperationName),
            _buildDetailRow(
              'تاريخ العملية',
              storage.parentOperationDate.toLocal().toString(),
            ),
            if (storage.notes?.isNotEmpty ?? false)
              _buildDetailRow('ملاحظات', storage.notes!),
            const SizedBox(height: 20),
            QuantityManager(
              storageId: storage.id!,
              currentQuantity: storage.quantity,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إغلاق'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => StorageEditDialog(storage: storage),
            );
          },
          child: const Text('تعديل'),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _confirmDelete(context),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف العنصر'),
        content: const Text('هل أنت متأكد من رغبتك في حذف هذا العنصر؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              context.read<StorageBloc>().add(DeleteStorage(storage.id!));
              Navigator.of(context)
                ..pop()
                ..pop();
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}