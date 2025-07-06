import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_related_data_cubit.dart';
import 'package:local_tammoz_chat/presentation/operation/pages/base_add_operation_page.dart';

class AddGraftingPage extends BaseAddOperationPage {

  const AddGraftingPage({
    super.key,
  });

  @override
  State<AddGraftingPage> createState() => _AddGraftingPageState();
}

class _AddGraftingPageState extends BaseAddOperationPageState<AddGraftingPage> {

  late Storage firstStorage;
  late Storage secondStorage;
  late int maxQuantity;

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
          firstStorage = args['firstStorage'];
          secondStorage = args['secondStorage'];
          maxQuantity = min(firstStorage.quantity, secondStorage.quantity);
          quantityController.text = maxQuantity.toString();
        });
      }
    }
  }


  @override
  Widget buildAddOperationSpecificFields(OperationRelatedDataState state) {
    selectedFirstPlantType = state.plantTypes.firstWhere((item) => item.name == firstStorage.plantType);
    selectedFirstPlantShape = state.plantShapes.firstWhere((item)=> item.name == firstStorage.plantShape);
    selectedSecondPlantType = state.plantTypes.firstWhere((item) => item.name == secondStorage.plantType);
    selectedSecondPlantShape = state.plantShapes.firstWhere((item) => item.name == secondStorage.plantShape);
    firstStorageId = firstStorage.id;
    secondStorageId = secondStorage.id;
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
