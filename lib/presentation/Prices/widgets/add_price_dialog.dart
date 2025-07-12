// lib/presentation/prices/widgets/add_price_dialog.dart

import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/entities/price.dart';

class AddPriceDialog extends StatefulWidget {
  final List<PlantType> plantTypes;
  final List<PlantShape> plantShapes;
  final Price? initialPrice;

  const AddPriceDialog({
    super.key,
    required this.plantTypes,
    required this.plantShapes,
    this.initialPrice,
  });

  static Future<Price?> show(
      BuildContext context, {
        required List<PlantType> plantTypes,
        required List<PlantShape> plantShapes,
        Price? initialPrice,
      }) {
    return showDialog<Price>(
      context: context,
      builder: (context) => AddPriceDialog(
        plantTypes: plantTypes,
        plantShapes: plantShapes,
        initialPrice: initialPrice,
      ),
    );
  }

  @override
  State<AddPriceDialog> createState() => _AddPriceDialogState();
}

class _AddPriceDialogState extends State<AddPriceDialog> {
  PlantType? _selectedPlantType;
  PlantShape? _selectedPlantShape;
  final TextEditingController _priceController = TextEditingController();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _selectedPlantType = widget.initialPrice?.plantType ?? (widget.plantTypes.isNotEmpty ? widget.plantTypes.first : null);
    _selectedPlantShape = widget.initialPrice?.plantShape ?? (widget.plantShapes.isNotEmpty ? widget.plantShapes.first : null);
    _priceController.text = widget.initialPrice?.price.toString() ?? '';
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final priceText = _priceController.text.trim();
    final price = double.tryParse(priceText);

    if (_selectedPlantType == null) {
      setState(() {
        _errorText = 'يرجى اختيار نوع النبات';
      });
      return;
    }

    if (_selectedPlantShape == null) {
      setState(() {
        _errorText = 'يرجى اختيار شكل النبات';
      });
      return;
    }

    if (price == null || price <= 0) {
      setState(() {
        _errorText = 'يرجى إدخال سعر صالح أكبر من صفر';
      });
      return;
    }

    final newPrice = Price(
      id: widget.initialPrice?.id,
      plantType: _selectedPlantType!,
      plantShape: _selectedPlantShape!,
      price: price,
    );

    Navigator.of(context).pop(newPrice);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('إضافة سعر جديد'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<PlantType>(
              value: _selectedPlantType,
              decoration: const InputDecoration(labelText: 'نوع النبات'),
              items: widget.plantTypes
                  .map((pt) => DropdownMenuItem(
                value: pt,
                child: Text(pt.name),
              ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _selectedPlantType = val;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<PlantShape>(
              value: _selectedPlantShape,
              decoration: const InputDecoration(labelText: 'شكل النبات'),
              items: widget.plantShapes
                  .map((ps) => DropdownMenuItem(
                value: ps,
                child: Text(ps.name),
              ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _selectedPlantShape = val;
                });
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'السعر',
                prefixText: '₺ ',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _onConfirm,
          child: const Text('حفظ'),
        ),
      ],
    );
  }
}
