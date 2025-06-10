// lib/presentation/planting/pages/plantings_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/planting_bloc.dart';
import '../bloc/planting_events.dart';
import '../bloc/planting_states.dart';
import 'add_edit_planting_page.dart';

class PlantingsPage extends StatelessWidget {
  const PlantingsPage( {super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('قائمة النباتات')),
      body: BlocBuilder<PlantingBloc, PlantingState>(
        builder: (context, state) {
          if (state is PlantingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlantingLoaded) {
            final plantings = state.plantings;
            if (plantings.isEmpty) {
              return const Center(child: Text('لا توجد بيانات'));
            }
            return ListView.builder(
              itemCount: plantings.length,
              itemBuilder: (context, index) {
                final planting = plantings[index];
                return ListTile(
                  title: Text(planting.typeName),
                  subtitle: Text('الكمية: ${planting.quantity} - التاريخ: ${planting.date.toLocal().toString().split(' ')[0]}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      final currentContext = context; // تخزين Context قبل async gap

                      final confirm = await showDialog<bool>(
                        context: currentContext,
                        builder: (context) => AlertDialog(
                          title: const Text('تأكيد الحذف'),
                          content: Text('هل أنت متأكد أنك تريد حذف "${planting.typeName}"؟'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('إلغاء'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('حذف', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      );

                      if (confirm == true&& currentContext.mounted) {
                        context.read<PlantingBloc>().add(DeletePlanting(planting.id!));

                        // عرض SnackBar بعد الحذف
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('تم حذف النبات "${planting.typeName}"'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),

                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AddEditPlantingPage(planting: planting),
                      ),
                    );
                  },

                );
              },
            );
          } else if (state is PlantingError) {
            return Center(child: Text('حدث خطأ: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (_) => const AddEditPlantingPage(),
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
