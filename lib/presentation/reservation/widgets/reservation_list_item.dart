// /presentation/reservation/widgets/reservation_list_item.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';

class ReservationListItem extends StatelessWidget {
  final Reservation reservation;

  const ReservationListItem({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(reservation.fullName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('النبات: ${reservation.plantType.name}'),
            Text('الشكل: ${reservation.plantShape.name}'),
            Text('الكمية: ${reservation.quantity}'),
            Text('تاريخ الحجز: ${dateFormat.format(reservation.reservationDate)}'),
            Text('المبلغ الكلي: \$${reservation.calculatedTotalAmount?.toStringAsFixed(2)}'),
            Text('تم الدفع كاملاً: ${reservation.isFullyPaid ? "نعم" : "لا"}'),
          ],
        ),
      ),
    );
  }
}
