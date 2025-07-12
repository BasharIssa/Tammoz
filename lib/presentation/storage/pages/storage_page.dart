// في ملف presentation/storage/pages/storage_page.dart


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/storage.dart';
import '../bloc/storage_bloc.dart';
import '../widgets/storage_details_dialog.dart';
import '../widgets/storage_item.dart';
import '../widgets/storage_search_bar.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المخزن'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<StorageBloc>().add(const LoadAllStorages())
            ),
        ],
      ),
      body: BlocConsumer<StorageBloc, StorageState>(
        listener: _handleStateChanges,
        builder: (context, state) {
          if (state is StorageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StorageLoaded) {
            return Column(
              children: [
                const StorageSearchBar(),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.storages.length,
                    itemBuilder: (context, index) => StorageItem(
                      storage: state.storages[index],
                      onTap: () => _showStorageDetails(context, state.storages[index]),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is StorageInitial) {
            context.read<StorageBloc>().add(const LoadAllStorages());
            return const Center(child: CircularProgressIndicator());
          } else if (state is StorageOperationFailure) {
            return Center(child: Text('حدث خطأ: ${state.failure.message}'));
          } else {
            return const Center(child: Text('حالة غير معروفة'));
          }
        },
      ),
    );
  }
  void _handleStateChanges(BuildContext context, StorageState state) {
    if (state is StorageOperationFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.failure.message)),
      );
    } else if (state is StorageOperationSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تمت العملية بنجاح')),
      );
    }
  }

  void _showStorageDetails(BuildContext context, Storage storage) {
    showDialog(
      context: context,
      builder: (context) => StorageDetailsDialog(storage: storage),
    );
  }
}