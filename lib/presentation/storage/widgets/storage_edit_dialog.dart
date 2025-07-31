// lib/presentation/storage/widgets/storage_edit_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/presentation/storage/bloc/storage_bloc.dart';

class StorageEditDialog extends StatefulWidget {
  final Storage? storage;

  const StorageEditDialog({super.key, this.storage});

  @override
  State<StorageEditDialog> createState() => _StorageEditDialogState();
}

class _StorageEditDialogState extends State<StorageEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _plantTypeController;
  late TextEditingController _plantShapeController;
  late TextEditingController _quantityController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _plantTypeController = TextEditingController(
        text: widget.storage?.plantType.name ?? '');
    _plantShapeController = TextEditingController(
        text: widget.storage?.plantShape.name ?? '');
    _quantityController = TextEditingController(
        text: widget.storage?.quantity.toString() ?? '1');
    _notesController = TextEditingController(
        text: widget.storage?.notes ?? '');
  }

  @override
  void dispose() {
    _plantTypeController.dispose();
    _plantShapeController.dispose();
    _quantityController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.storage == null ? 'إضافة عنصر جديد' : 'تعديل العنصر'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _plantTypeController,
                decoration: const InputDecoration(
                  labelText: 'نوع النبات',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value?.isEmpty ?? true ? 'هذا الحقل مطلوب' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _plantShapeController,
                decoration: const InputDecoration(
                  labelText: 'شكل النبات',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value?.isEmpty ?? true ? 'هذا الحقل مطلوب' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(
                  labelText: 'الكمية',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'هذا الحقل مطلوب';
                  final quantity = int.tryParse(value!);
                  if (quantity == null || quantity <= 0) {
                    return 'يجب أن تكون الكمية رقمًا موجبًا';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'ملاحظات',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        // ElevatedButton(
        //   onPressed: _submitForm,
        //   child: const Text('حفظ'),
        // ),
      ],
    );
  }

  void _submitForm() {
    throw UnimplementedError;
    // if (_formKey.currentState?.validate() ?? false) {
    //   final storage = Storage(
    //     id: widget.storage?.id,
    //     plantType: _plantTypeController.text,
    //     plantShape: _plantShapeController.text,
    //     quantity: int.parse(_quantityController.text),
    //     notes: _notesController.text,
    //     parentOperationId: widget.storage!.parentOperationId,
    //     parentOperationDate: widget.storage!.parentOperationDate,
    //     parentOperationName: widget.storage!.parentOperationName,
    //     isScheduled: widget.storage!.isScheduled,
    //   );
    //
    //   if (widget.storage == null) {
    //     context.read<StorageBloc>().add(AddStorage(storage));
    //   } else {
    //     context.read<StorageBloc>().add(UpdateStorage(storage));
    //   }
    //
    //   Navigator.of(context).pop();
    // }
  }
}