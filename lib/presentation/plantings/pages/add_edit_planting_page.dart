import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/planting.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_states.dart';
import '../bloc/planting_bloc.dart';
import '../bloc/planting_events.dart';

class AddEditPlantingPage extends StatefulWidget {
  final Planting? planting;

  // 1. تحسين تعريف الـ constructor
  const AddEditPlantingPage({
    super.key, // 2. استخدام super.key بدلاً من Key? key
    this.planting,
  });

  @override
  State<AddEditPlantingPage> createState() => _AddEditPlantingPageState();
}

class _AddEditPlantingPageState extends State<AddEditPlantingPage> {
  final _formKey = GlobalKey<FormState>();

  int? _selectedTypeId;
  String? _selectedTypeName;
  int _quantity = 1;
  DateTime _date = DateTime.now();
  double? _initialCost;

  List<PlantType> _plantTypes = [];

  final TextEditingController _newTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final planting = widget.planting;

    if (planting != null) {
      _selectedTypeId = planting.typeId;
      _selectedTypeName = planting.typeName;
      _quantity = planting.quantity;
      _date = planting.date;
      _initialCost = planting.initialCost;
    }

    // تحميل أنواع النباتات
    context.read<PlantTypeBloc>().add(LoadPlantTypes());
  }

  @override
  void dispose() {
    _newTypeController.dispose();
    super.dispose();
  }

  Future<void> _showAddTypeDialog() async {
    _newTypeController.clear();
    // نستخدم context مباشرة مع التحقق من mounted للـ State
    if (!mounted) return;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة نوع نبات جديد'),
        content: TextField(
          controller: _newTypeController,
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
              final newTypeName = _newTypeController.text.trim();
              if (newTypeName.isNotEmpty) {
                Navigator.of(context).pop(true);
              }
            },
            child: const Text('إضافة'),
          ),
        ],
      ),
    );

    if (result == true ) {
      if (!mounted) return; // تحقق مجدداً قبل استخدام context
      final newTypeName = _newTypeController.text.trim();

      // إرسال الحدث لإضافة النوع الجديد
      context.read<PlantTypeBloc>().add(
        AddPlantType(PlantType(name: newTypeName)),
      );
    }
  }
  void _submit() {
    if (_formKey.currentState!.validate() && _selectedTypeId != null && _selectedTypeName != null) {
      _formKey.currentState!.save();

      final planting = Planting(
        id: widget.planting?.id,
        typeId: _selectedTypeId!,
        typeName: _selectedTypeName!,
        quantity: _quantity,
        date: _date,
        initialCost: _initialCost,
      );

      final plantingBloc = context.read<PlantingBloc>();

      if (widget.planting == null) {
        plantingBloc.add(AddPlanting(planting));
      } else {
        plantingBloc.add(UpdatePlanting(planting));
      }

      Navigator.of(context).pop();
    } else if (_selectedTypeId == null) {
      // رسالة تنبيه إذا لم يتم اختيار نوع نبات
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إضافة نوع نبات أولاً')),
      );
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlantTypeBloc, PlantTypeState>(
        listener: (context, state) {
          if (state is PlantTypeLoaded) {
            setState(() {
              _plantTypes = state.plantTypes;
              // فقط إذا لم يكن هناك نوع محدد مسبقاً
              if (_selectedTypeId == null && _plantTypes.isNotEmpty) {
                _selectedTypeId = _plantTypes.first.id;
                _selectedTypeName = _plantTypes.first.name;
              }
            });
          } else if (state is PlantTypeEmpty) {
            setState(() {
              _plantTypes = [];
              _selectedTypeId = null;
              _selectedTypeName = null;
            });
          } else if (state is PlantTypeAdded) {
            setState(() {
              // إضافة النوع الجديد للقائمة
              _plantTypes.add(state.plantType);
              // تحديد النوع المضاف حديثاً كاختيار افتراضي
              _selectedTypeId = state.plantType.id;
              _selectedTypeName = state.plantType.name;
            });
          }
        },

      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.planting == null ? 'إضافة نبات' : 'تعديل نبات'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<PlantTypeBloc, PlantTypeState>(
            builder: (context, state) {
              if (state is PlantTypeLoading ) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PlantTypeEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('لا توجد أنواع نباتات. الرجاء إضافة نوع جديد.'),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('إضافة نوع نبات جديد'),
                        onPressed: _showAddTypeDialog,
                      ),
                    ],
                  ),
                );
              } else if (state is PlantTypeLoaded || state is PlantTypeAdded) {
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<int>(
                              value: _selectedTypeId,
                              decoration: const InputDecoration(labelText: 'نوع النبات'),
                              items: _plantTypes
                                  .map((type) => DropdownMenuItem(
                                value: type.id,
                                child: Text(type.name),
                              ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedTypeId = val;
                                  _selectedTypeName = _plantTypes.firstWhere((t) => t.id == val).name;
                                });
                              },
                              validator: (value) => value == null ? 'الرجاء اختيار نوع النبات' : null,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            tooltip: 'إضافة نوع جديد',
                            onPressed: _showAddTypeDialog,
                          ),
                        ],
                      ),
                      TextFormField(
                        initialValue: _quantity.toString(),
                        decoration: const InputDecoration(labelText: 'الكمية'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'الرجاء إدخال الكمية';
                          final n = int.tryParse(value);
                          if (n == null || n <= 0) return 'الكمية يجب أن تكون رقمًا موجبًا';
                          return null;
                        },
                        onSaved: (value) => _quantity = int.parse(value!),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text('التاريخ: ${_date.toLocal().toString().split(' ')[0]}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: _pickDate,
                        ),
                      ),
                      TextFormField(
                        initialValue: _initialCost?.toString() ?? '',
                        decoration: const InputDecoration(labelText: 'التكلفة الأولية (اختياري)'),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) return null;
                          final d = double.tryParse(value);
                          if (d == null || d < 0) return 'يجب أن تكون التكلفة رقمًا غير سالب';
                          return null;
                        },
                        onSaved: (value) => _initialCost = value == null || value.isEmpty ? null : double.parse(value),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text(widget.planting == null ? 'إضافة' : 'تعديل'),
                      ),
                    ],
                  ),
                );
              } else if (state is PlantTypeError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
