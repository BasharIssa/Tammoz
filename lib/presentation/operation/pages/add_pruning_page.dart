import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_related_data_cubit.dart';
import 'package:local_tammoz_chat/presentation/operation/pages/base_add_operation_page.dart';

class AddPruningPage extends BaseAddOperationPage {

  final String plantTypeName;
  final String plantShapeName;
  final int maxQuantity;

  const AddPruningPage({
    super.key,
    super.preselectedOperationName,
    super.firstStorageId,
    required this.plantTypeName,
    required this.plantShapeName,
    required this.maxQuantity,
  });

  @override
  State<AddPruningPage> createState() => _AddPruningPageState();
}

class _AddPruningPageState extends BaseAddOperationPageState<AddPruningPage> {

  @override
  void initState() {
    super.initState();
    quantityController.text = widget.maxQuantity.toString();
    final cubit = context.read<OperationRelatedDataCubit>();
    cubit.loadFormData();

  }



  @override
  Widget buildAddOperationSpecificFields(OperationRelatedDataState state) {
    selectedFirstPlantType = state.plantTypes.firstWhere((item) => item.name == widget.plantTypeName);
    selectedFirstPlantShape = state.plantShapes.firstWhere((item)=> item.name == widget.plantShapeName);
    firstStorageId= widget.firstStorageId;
    return Column(
      children: [
        // نوع النبات الأول

        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'نوع النبات',
            // hintText: 'اختر نوع النبات', // غير ضروري هنا
          ),
          child: Text(
            widget.plantTypeName,
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
            widget.plantShapeName,
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
            labelText: 'الكمية العظمى ${widget.maxQuantity}، ادخل الكمية',
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
            if (intValue > widget.maxQuantity) {
              return 'لا تستطيع ادخال قيمة اكبر من الموجودة في المستودع';
            }
            return null;
          },
        ),
      ],
    );
  }
}
