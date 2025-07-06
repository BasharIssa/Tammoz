import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_related_data_cubit.dart';
import 'package:local_tammoz_chat/presentation/operation/pages/base_add_operation_page.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';

class AddPlantingPage extends BaseAddOperationPage {
  const AddPlantingPage({
    super.key,
  });

  @override
  State<AddPlantingPage> createState() => _AddPlantingPageState();
}

class _AddPlantingPageState extends BaseAddOperationPageState<AddPlantingPage> {

  late TextEditingController _newPlantTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _newPlantTypeController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (currentArgs == null) {
      final args = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, dynamic>?;
      if (args != null) {
        currentArgs = args;
        // استخدم setState إذا تريد تحديث الواجهة بناءً على البيانات
        setState(() {
          operationTypeName = args['preselectedOperationName'];

        });
      }
    }
  }


  @override
  void dispose() {
    _newPlantTypeController.dispose();
    super.dispose();
  }


  @override
  Widget buildAddOperationSpecificFields(OperationRelatedDataState state) {
    return
      Column(
        children:
        [
          // نوع النبات الأول
          Row(
            children: [
              Expanded(
                // إضافة Expanded لتحسين التخطيط

                child: DropdownButtonFormField<PlantType>(
                  value: selectedFirstPlantType,
                  decoration: InputDecoration(
                    // تحسين المظهر
                    border: OutlineInputBorder(),
                    labelText: 'نوع النبات',
                    hintText: 'اختر نوع النبات',
                  ),
                  items: state.plantTypes
                      .map((pt) => DropdownMenuItem(
                    value: pt,
                    child: Text(
                      pt.name,
                      overflow: TextOverflow
                          .ellipsis, // تجنب تجاوز النص
                    ),
                  ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => selectedFirstPlantType = value),
                  validator: (value) => value == null
                      ? 'الرجاء اختيار نوع النبات'
                      : null,
                ),
              ),
              SizedBox(width: 8), // مسافة بين العناصر
              IconButton(
                icon: Icon(Icons.add, size: 28),
                // حجم أكبر للأيقونة
                onPressed: _showAddPlantTypeDialog,
                tooltip: 'إضافة نوع جديد', // نص توضيحي عند التمرير
              ),
            ],
          ),
          const SizedBox(height: 20),

          // شكل النبات الأول
          DropdownButtonFormField<PlantShape>(
            value: selectedFirstPlantShape,
            hint: const Text('اختر شكل النبات'),
            items: state.plantShapes
                .map((ps) =>
                DropdownMenuItem(value: ps, child: Text(ps.name)))
                .toList(),
            onChanged: (value) =>
                setState(() => selectedFirstPlantShape = value),
            validator: (value) =>
            value == null ? 'الرجاء اختيار شكل النبات' : null,
          ),
          const SizedBox(height: 20),
          // الكمية
          TextFormField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'الكمية',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال الكمية';
              }
              if (int.tryParse(value) == null) {
                return 'الرجاء إدخال رقم صحيح';
              }
              return null;
            },
          ),
        ],
      );
  }
  Future<void> _showAddPlantTypeDialog() async {
    _newPlantTypeController.clear();
    // نستخدم context مباشرة مع التحقق من mounted للـ State
    if (!mounted) return;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة نوع نبات جديد'),
        content: TextField(
          controller: _newPlantTypeController,
          decoration: const InputDecoration(labelText: 'اسم النوع'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              final newTypeName = _newPlantTypeController.text.trim();
              if (newTypeName.isNotEmpty) {
                Navigator.of(context).pop(true);
              }
            },
            child: const Text('إضافة'),
          ),
        ],
      ),
    );

    if (result == true) {
      if (!mounted) return; // تحقق مجدداً قبل استخدام context
      final newTypeName = _newPlantTypeController.text.trim();

      // إرسال الحدث لإضافة النوع الجديد
      context.read<PlantTypeBloc>().add(
        AddPlantType(PlantType(name: newTypeName)),
      );
    }
  }



}
