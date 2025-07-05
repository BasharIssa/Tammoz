

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/constants.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/presentation/storage/widgets/storage_item_for_next_select.dart';

import '../bloc/storage_bloc.dart';
import '../widgets/storage_search_bar.dart';

class SelectSecondStoragePage extends StatelessWidget {
  final String preselectedOperationName;
  final Storage firstStorage;
  const SelectSecondStoragePage(
  {
      super.key,
      required this.preselectedOperationName,
      required this.firstStorage,

});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختيار نوع ثان للعملية'),
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
                    itemBuilder: (context, index) {
                      final currentStorage = state.storages[index];
                      return SecondStorageItem
                        (
                        storage: currentStorage,
                        onLongPress: ()=>moveToGraftingPage(context, currentStorage),
                      );
                    }
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => context.read<StorageBloc>().add(const LoadAllStorages()),
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

  void moveToGraftingPage(BuildContext context, Storage secondStorage){
    Navigator.pushNamedAndRemoveUntil(
        context,
        PagesRoutesConstants.addGrafting,
        ModalRoute.withName(PagesRoutesConstants.selectSecondStorage),
        arguments: {
          'preselectedOperationName': preselectedOperationName,
          'firstStorage': firstStorage,
          'secondStorage' : secondStorage,
        }
    );
  }
}