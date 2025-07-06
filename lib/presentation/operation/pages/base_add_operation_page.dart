

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
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_states.dart';

abstract class BaseAddOperationPage extends StatefulWidget{
  const BaseAddOperationPage({
    super.key,
  });
}

abstract class BaseAddOperationPageState<T extends BaseAddOperationPage> extends State<T>{
  final formKey = GlobalKey<FormState>();
  final quantityController = TextEditingController();
  final costController = TextEditingController(text: '0');
  String? operationTypeName ;
  OperationType? selectedOperationType;
  int? firstStorageId;
  PlantType? selectedFirstPlantType;
  PlantShape? selectedFirstPlantShape;
  int? secondStorageId;
  PlantType? selectedSecondPlantType;
  PlantShape? selectedSecondPlantShape;
  DateTime selectedDate = DateTime.now();
  late Operation operationToAdd;

  Map<String, dynamic>? currentArgs;

  @override
  void initState() {

    super.initState();
    final cubit = context.read<OperationRelatedDataCubit>();
    cubit.loadFormData();
  }

  @override
  void dispose(){
    super.dispose();
    quantityController.dispose();
    costController.dispose();
  }

  void _submitForm() {
    operationToAdd= Operation(
      operationType: selectedOperationType!,
      date: selectedDate,
      firstType: selectedFirstPlantType!,
      firstShape: selectedFirstPlantShape!,
      secondType: selectedSecondPlantType,
      secondShape: selectedSecondPlantShape,
      quantity: int.parse(quantityController.text),
      cost: double.parse(costController.text),
    );

    context.read<OperationBloc>().add(AddOperationEvent(
      operationToAdd,
      firstStorageId: firstStorageId,
      secondStorageId: secondStorageId
    ));
  }


  // هذه الدالة ستملأها الصفحات الوريثة
  Widget buildAddOperationSpecificFields( OperationRelatedDataState state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Text(
        operationTypeName != null
            ? 'إضافة عملية جديدة ($operationTypeName)'
            : 'إضافة عملية جديدة',
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            //get operationType object by its name
        BlocConsumer<OperationRelatedDataCubit, OperationRelatedDataState>(
          listener: (context, state) {
            if (!state.isLoading &&
                selectedOperationType == null &&
                operationTypeName != null) {
              final found = context
                  .read<OperationRelatedDataCubit>()
                  .findOperationTypeByName(operationTypeName!);
              if (found != null) {
                setState(() {
                  selectedOperationType = found;
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

            //tider30_6: this blocListener for addPlantingPage only
            // bad code: need to refactor and eliminate it in pruning and grafting
            return BlocListener<PlantTypeBloc, PlantTypeState>(
              listener: (context, plantTypeState) {
                if (plantTypeState is PlantTypeAdded) {
                  setState(() {
                    // إضافة النوع الجديد للقائمة
                    state.plantTypes.add(plantTypeState.plantType);
                    // تحديد النوع المضاف حديثاً كاختيار افتراضي
                    selectedFirstPlantType = plantTypeState.plantType;
                  });
                }
              },
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    buildAddOperationSpecificFields(state),
                    const SizedBox(height: 20),
                        TextFormField(
                          controller: costController,
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
                              value='0';
                            }
                            if (double.tryParse(value) == null) {
                              return 'يرجى إدخال رقم صالح';
                            }
                            return null;
                          },
                        ),


                    const SizedBox(height: 20),


                        // التاريخ
                        Row(
                          children: [
                            Text(
                                'التاريخ: ${selectedDate.toLocal().toString().split(' ')[0]}'),
                            TextButton(
                              onPressed: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2025),
                                  lastDate: DateTime(2050),
                                );
                                if (picked != null && picked != selectedDate) {
                                  setState(() => selectedDate = picked);
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
                            if (state is GraftingAddSuccess) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('تمت إضافة عملية التطعيم بنجاح')),
                              );
                            }else if (state is OperationAddSuccess) {
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
                                if (formKey.currentState!.validate()) {
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



}