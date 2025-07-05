
import 'package:flutter/material.dart';
import 'package:local_tammoz_chat/domain/entities/operation.dart';

class OperationsList extends StatelessWidget {
  final List<Operation> operations;

  const OperationsList({super.key, required this.operations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (context, index) {
        final operation = operations[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              operation.operationType.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الكمية: ${operation.quantity}'),
                Text('النوع: ${operation.firstType.name}'),
                Text('التاريخ: ${operation.date.toString().substring(0, 10)}'),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // تفاصيل العملية (يمكن تطويرها لاحقًا)
            },
          ),
        );
      },
    );
  }
}
