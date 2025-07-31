import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_related_data_cubit.dart';
import 'package:local_tammoz_chat/presentation/operation/pages/base_add_operation_page.dart';

class AddPruningPage extends BaseAddOperationPage {



  const AddPruningPage({
    super.key,
  });

  @override
  State<AddPruningPage> createState() => _AddPruningPageState();
}

class _AddPruningPageState extends BaseAddOperationPageState<AddPruningPage> {

  late Storage storage ;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (currentArgs == null) {
      final args= ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, dynamic>?;
      if (args != null) {
        currentArgs = args;
        // استخدم setState إذا تريد تحديث الواجهة بناءً على البيانات
        setState(() {
          operationTypeName = args['preselectedOperationName'];
          storage = args['selectedStorage'];
          quantityController.text = storage.quantity.toString();

        });
      }
    }
  }

  @override
  Widget buildAddOperationSpecificFields(OperationRelatedDataState state) {
    selectedFirstPlantType = state.plantTypes.firstWhere((item) => item.name == storage.plantType.name);
    selectedFirstPlantShape = state.plantShapes.firstWhere((item)=> item.name == storage.plantShape.name);
    firstStorageId= storage.id;
    return Column(
      children: [
        // نوع النبات الأول

        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'نوع النبات',
            // hintText: 'اختر نوع النبات', // غير ضروري هنا
          ),
          child: Text(
            storage.plantType.name,
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
            storage.plantShape.name,
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
            labelText: 'الكمية العظمى ${storage.quantity}، ادخل الكمية',
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
            if (intValue > storage.quantity) {
              return 'لا تستطيع ادخال قيمة اكبر من الموجودة في المستودع';
            }
            return null;
          },
        ),
      ],
    );
  }
}
