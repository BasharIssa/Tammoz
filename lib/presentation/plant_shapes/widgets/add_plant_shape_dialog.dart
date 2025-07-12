// lib/presentation/plant_shapes/widgets/add_plant_shape_dialog.dart

import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';

class AddPlantShapeDialog extends StatefulWidget {
  final String? initialName;
  final int? initialNurseryPeriod;

  const AddPlantShapeDialog({
    super.key,
    this.initialName,
    this.initialNurseryPeriod,
  });

  @override
  State<AddPlantShapeDialog> createState() => _AddPlantShapeDialogState();

  // دالة ثابتة لسهولة الاستدعاء
  static Future<PlantShape?> show(BuildContext context,
      {String? initialName, int? initialNurseryPeriod}) {
    return showDialog<PlantShape>(
      context: context,
      builder: (context) => AddPlantShapeDialog(
        initialName: initialName,
        initialNurseryPeriod: initialNurseryPeriod,
      ),
    );
  }
}

class _AddPlantShapeDialogState extends State<AddPlantShapeDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _nurseryPeriodController;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _nurseryPeriodController = TextEditingController(
        text: widget.initialNurseryPeriod?.toString() ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nurseryPeriodController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final name = _nameController.text.trim();
    final periodStr = _nurseryPeriodController.text.trim();
    final period = int.tryParse(periodStr);

    if (name.isEmpty || period == null || period <= 0) {
      setState(() {
        _errorText = 'يرجى إدخال اسم صحيح وفترة حضانة رقمية موجبة';
      });
      return;
    }

    Navigator.of(context).pop(
      PlantShape(name: name, nurseryPeriod: period),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('إضافة شكل نبات جديد'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'اسم الشكل'),
            autofocus: true,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nurseryPeriodController,
            decoration: const InputDecoration(labelText: 'فترة الحضانة (بالأيام)'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _onConfirm(),
          ),
          if (_errorText != null) ...[
            const SizedBox(height: 8),
            Text(
              _errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _onConfirm,
          child: const Text('إضافة'),
        ),
      ],
    );
  }
}
