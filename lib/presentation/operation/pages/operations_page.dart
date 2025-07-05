import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/constants.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_bloc.dart';
import 'package:local_tammoz_chat/presentation/operation/widgets/OperationsList.dart';

class OperationsPage extends StatelessWidget {
  const OperationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العمليات النباتية'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/add-operation'),
          ),
        ],
      ),
      body: BlocBuilder<OperationBloc, OperationState>(
        builder: (context, state) {
          if (state is OperationsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is OperationsLoaded) {
            return OperationsList(operations: state.operations);
          } else if (state is OperationError) {
            return Center(child: Text('حدث خطأ: ${state.message}'));
          } else {
            return Center(child: Text('لا توجد عمليات مسجلة'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          '/addOperation',
          arguments: {'preselectedOperationName': OperationTypesConstants.planting}
        ),

      ),
    );
  }
}
