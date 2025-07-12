import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/price.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';

abstract class PriceRepository {
  Future<List<Price>> getAllPrices();
  Future<Price?> getPriceById(int id);
  Future<int> insertPrice(Price price);
  Future<Either<Failure, bool>> updatePrice(Price price);
  Future<bool> deletePrice(int id);
}
