
import 'package:flutter/material.dart';

class AddNewPlantTypeDialog extends StatefulWidget{
  const AddNewPlantTypeDialog({super.key});

  @override
  State<StatefulWidget> createState()  =>_AddNewPlantTypeDialogState();

  // دالة ثابتة لسهولة الاستدعاء
  static Future<String?> show(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) => AddNewPlantTypeDialog(),
    );
  }
}


class _AddNewPlantTypeDialogState extends State<AddNewPlantTypeDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('إضافة نوع نبات جديد'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'اسم النوع'),
        autofocus: true,
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            Navigator.of(context).pop(value.trim());
          }
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            final newTypeName = _controller.text.trim();
            if (newTypeName.isNotEmpty) {
              Navigator.of(context).pop(newTypeName);
            }
          },
          child: const Text('إضافة'),
        ),
      ],
    );
  }
}
