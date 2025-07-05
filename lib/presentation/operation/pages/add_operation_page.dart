import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/constants.dart';
import 'package:local_tammoz_chat/domain/entities/operation.dart';
import 'package:local_tammoz_chat/domain/entities/operation_type.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_bloc.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_related_data_cubit.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_states.dart';

class AddOperationPage extends StatefulWidget {

  final String? preselectedOperationName;
  final String? plantType;
  final String? plantShape;
  final int? quantity;

  const AddOperationPage({
  super.key,
  this.preselectedOperationName,
  this.plantType,
  this.plantShape,
  this.quantity,
  });

  @override
  AddOperationPageState createState() => AddOperationPageState();
}

class AddOperationPageState extends State<AddOperationPage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _costController = TextEditingController();
  OperationType? _selectedOperationType;
  PlantType? _selectedPlantType;
  final TextEditingController _newPlantTypeController = TextEditingController();
  PlantShape? _selectedPlantShape;

  // الحقول الإضافية للتطعيم
  PlantType? _selectedSecondPlantType;
  PlantShape? _selectedSecondPlantShape;

  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<OperationRelatedDataCubit>();
    cubit.loadFormData();
  }

  @override
  void dispose() {
    _newPlantTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final isGrafting = widget.preselectedOperationName?.toLowerCase() ==
        OperationTypesConstants.grafting; // أو الاسم المناسب للتطعيم في بياناتك
    return Scaffold(

      appBar: AppBar(title:
        Text(
          widget.preselectedOperationName != null
              ? 'إضافة عملية جديدة ($widget.preselectedOperationName)'
              : 'إضافة عملية جديدة',
        ),
      ),
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            BlocConsumer<OperationRelatedDataCubit, OperationRelatedDataState>(
          listener: (context, state) {
            if (!state.isLoading &&
                _selectedOperationType == null &&
                widget.preselectedOperationName != null) {
              final found = context
                  .read<OperationRelatedDataCubit>()
                  .findOperationTypeByName(widget.preselectedOperationName!);
              if (found != null) {
                setState(() {
                  _selectedOperationType = found;
                });
              }
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.error != null) {
              return Center(child: Text('حدث خطأ: ${state.error}'));
            }

            return BlocListener<PlantTypeBloc, PlantTypeState>(
              listener: (context, plantTypeState) {
                // if (state is PlantTypeLoaded) {
                //   setState(() {
                //     _plantTypes = state.plantTypes;
                //     // فقط إذا لم يكن هناك نوع محدد مسبقاً
                //     if (_selectedTypeId == null && _plantTypes.isNotEmpty) {
                //       _selectedTypeId = _plantTypes.first.id;
                //       _selectedTypeName = _plantTypes.first.name;
                //     }
                //   });
                // } else if (state is PlantTypeEmpty) {
                //   setState(() {
                //     _plantTypes = [];
                //     _selectedTypeId = null;
                //     _selectedTypeName = null;
                //   });
                // } else
                if (plantTypeState is PlantTypeAdded) {
                  setState(() {
                    // إضافة النوع الجديد للقائمة
                    state.plantTypes.add(plantTypeState.plantType);
                    // تحديد النوع المضاف حديثاً كاختيار افتراضي
                    _selectedPlantType = plantTypeState.plantType;
                  });
                }
              },
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    // نوع النبات الأول
                    Row(
                      children: [
                        Expanded(
                          // إضافة Expanded لتحسين التخطيط

                          child: DropdownButtonFormField<PlantType>(
                            value: _selectedPlantType,
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
                                setState(() => _selectedPlantType = value),
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
                      value: _selectedPlantShape,
                      hint: const Text('اختر شكل النبات'),
                      items: state.plantShapes
                          .map((ps) =>
                              DropdownMenuItem(value: ps, child: Text(ps.name)))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _selectedPlantShape = value),
                      validator: (value) =>
                          value == null ? 'الرجاء اختيار شكل النبات' : null,
                    ),
                    const SizedBox(height: 20),

                    // ** الحقول الإضافية تظهر فقط عند التطعيم **
                    if (isGrafting) ...[
                      DropdownButtonFormField<PlantType>(
                        value: _selectedSecondPlantType,
                        hint: const Text('اختر نوع النبات الثاني'),
                        items: state.plantTypes
                            .map((pt) => DropdownMenuItem(
                                value: pt, child: Text(pt.name)))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _selectedSecondPlantType = value),
                        validator: (value) {
                          if (isGrafting && value == null) {
                            return 'الرجاء اختيار نوع النبات الثاني';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<PlantShape>(
                        value: _selectedSecondPlantShape,
                        hint: const Text('اختر شكل النبات الثاني'),
                        items: state.plantShapes
                            .map((ps) => DropdownMenuItem(
                                value: ps, child: Text(ps.name)))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _selectedSecondPlantShape = value),
                        validator: (value) {
                          if (isGrafting && value == null) {
                            return 'الرجاء اختيار شكل النبات الثاني';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                    ],

                    //الكلفة
                    TextFormField(
                      controller: _costController,
                      decoration: const InputDecoration(
                        labelText: 'التكلفة',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال التكلفة';
                        }
                        if (double.tryParse(value) == null) {
                          return 'يرجى إدخال رقم صالح';
                        }
                        return null;
                      },
                    ),

                    // الكمية
                    TextFormField(
                      controller: _quantityController,
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
                    const SizedBox(height: 20),


                    // التاريخ
                    Row(
                      children: [
                        Text(
                            'التاريخ: ${_selectedDate.toLocal().toString().split(' ')[0]}'),
                        TextButton(
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime(2025),
                              lastDate: DateTime(2050),
                            );
                            if (picked != null && picked != _selectedDate) {
                              setState(() => _selectedDate = picked);
                            }
                          },
                          child: const Text('تغيير التاريخ'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // زر الإضافة مع BlocConsumer
                    BlocConsumer<OperationBloc, OperationState>(
                      listener: (context, state) {
                        if (state is OperationAddSuccess) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('تمت إضافة العملية بنجاح')),
                          );
                        } else if (state is OperationAddFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('حدث خطأ: ${state.message}')),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is OperationsLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _submitForm();
                            }
                          },
                          child: const Text('إضافة العملية'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
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

  void _submitForm() {
    final isGrafting = _selectedOperationType?.name.toLowerCase() == 'grafting';

    final newOperation = Operation(
      operationType: _selectedOperationType!,
      date: _selectedDate,
      firstType: _selectedPlantType!,
      firstShape: _selectedPlantShape!,
      quantity: int.parse(_quantityController.text),
      cost: double.parse(_costController.text),

      // إذا كانت العملية تطعيم، نمرر النوع والشكل الثانيين
      secondType: isGrafting ? _selectedSecondPlantType! : null,
      secondShape: isGrafting ? _selectedSecondPlantShape! : null,
    );

    context.read<OperationBloc>().add(AddOperationEvent(newOperation));
  }
}
