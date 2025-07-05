import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_related_data_cubit.dart';
import 'package:local_tammoz_chat/presentation/operation/pages/base_add_operation_page.dart';

class AddGraftingPage extends BaseAddOperationPage {
  final Storage firstStorage;
  final Storage secondStorage;
  const AddGraftingPage({
    super.key,
    super.preselectedOperationName,
    required this.firstStorage,
    required this.secondStorage,
  });

  @override
  State<AddGraftingPage> createState() => _AddGraftingPageState();
}

class _AddGraftingPageState extends BaseAddOperationPageState<AddGraftingPage> {

  late int maxQuantity;
  @override
  void initState() {
    maxQuantity = min(widget.firstStorage.quantity, widget.secondStorage.quantity);
    super.initState();
    quantityController.text = maxQuantity.toString();
    final cubit = context.read<OperationRelatedDataCubit>();
    cubit.loadFormData();

  }



  @override
  Widget buildAddOperationSpecificFields(OperationRelatedDataState state) {
    selectedFirstPlantType = state.plantTypes.firstWhere((item) => item.name == widget.firstStorage.plantType);
    selectedFirstPlantShape = state.plantShapes.firstWhere((item)=> item.name == widget.firstStorage.plantShape);
    selectedSecondPlantType = state.plantTypes.firstWhere((item) => item.name == widget.secondStorage.plantType);
    selectedSecondPlantShape = state.plantShapes.firstWhere((item) => item.name == widget.secondStorage.plantShape);
    firstStorageId = widget.firstStorage.id;
    secondStorageId = widget.secondStorage.id;
    return Column(
      children: [
        // نوع النبات الأول

        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'نوع النبات',
            // hintText: 'اختر نوع النبات', // غير ضروري هنا
          ),
          child: Text(
            selectedFirstPlantType!.name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // شكل النبات الأول
        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'شكل النبات',
            // hintText: 'اختر نوع النبات', // غير ضروري هنا
          ),
          child: Text(
            selectedFirstPlantShape!.name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 20),

// نوع النبات الثاني

        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'نوع النبات',
            // hintText: 'اختر نوع النبات', // غير ضروري هنا
          ),
          child: Text(
            selectedSecondPlantType!.name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // شكل النبات الثاني
        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'شكل النبات',
            // hintText: 'اختر نوع النبات', // غير ضروري هنا
          ),
          child: Text(
            selectedSecondPlantShape!.name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 20),
// الكمية
        TextFormField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration:  InputDecoration(
            labelText: 'الكمية العظمى $maxQuantity، ادخل الكمية',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال الكمية';
            }

            final intValue = int.tryParse(value);
            if (intValue == null) {
              return 'الرجاء إدخال رقم صحيح';
            }
            if (intValue > maxQuantity) {
              return 'لا تستطيع ادخال قيمة اكبر من الموجودة في المستودع';
            }
            return null;
          },
        ),
      ],
    );
  }
}
