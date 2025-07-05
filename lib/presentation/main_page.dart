import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/constants.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_bloc.dart';
import 'package:local_tammoz_chat/presentation/operation/widgets/OperationsList.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void _openAddOperationPage(
      BuildContext context, String operationName,{String? plantTypeName,
      String? plantShapeName, String? quantity}
      ) {
    Navigator.pushNamed(
      context,
      '/addOperation',
      arguments: {
        'preselectedOperationName': operationName, // أو اسم عملية القص حسب الثابت لديك
        'plantType': plantTypeName,        // نص اسم النبات
        'plantShape': plantShapeName,      // نص اسم الشكل
        'quantity': quantity,          // العدد الحالي
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تموز'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.grass),
                  label: const Text('زراعة'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () =>
                      _openAddOperationPage(context, OperationTypesConstants.planting),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.content_cut),
                  label: const Text('قص'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () =>
                      _openAddOperationPage(context, OperationTypesConstants.pruning),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.merge_type),
                  label: const Text('تطعيم'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () =>
                      Navigator.pushNamed(
                        context,
                        PagesRoutesConstants.addPlanting,
                        arguments: 'زراعة', // أو أي اسم تريد تمريره
                      )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<OperationBloc, OperationState>(
                builder: (context, state) {
                  if (state is OperationsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is OperationsLoaded) {
                    if (state.operations.isEmpty) {
                      return const Center(child: Text('لا توجد عمليات مسجلة'));
                    }
                    return OperationsList(operations: state.operations);
                  } else if (state is OperationError) {
                    return Center(child: Text('حدث خطأ: ${state.message}'));
                  }
                  return const Center(child: Text('لا توجد بيانات'));
                },
              ),
            ),

            // زر إضافة حجز
            ElevatedButton(
              onPressed: () {
                // TODO: إضافة حجز
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('إضافة حجز'),
            ),
            SizedBox(height: 20),

            // الحجوزات الموجودة (معلومات تجريبية)
            Text(
              'الحجوزات:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('حجز رقم ${index + 1} - اسم العميل'),
                      subtitle: Text('التاريخ: 2024-06-15، الكمية: 50 شتلة'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // TODO: عرض تفاصيل الحجز
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green.shade700),
              child: const Text('خيارات', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('المخزن'),
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  PagesRoutesConstants.storage,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.pan_tool_sharp),
              title: const Text('العمليات'),
              onTap: (){
                //Navigator.pop(context);
                Navigator.pushNamed(context, PagesRoutesConstants.operations);
              }
            )
            // أضف خيارات أخرى حسب الحاجة
          ],
        ),
      ),
    );
  }
}
