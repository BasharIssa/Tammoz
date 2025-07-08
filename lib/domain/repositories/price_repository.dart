import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/data/models/price_dto.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';

abstract class PriceRepository {
  Future<List<PriceDto>> getAllPrices();
  Future<PriceDto?> getPriceById(int id);
  Future<int> insertPrice(PriceDto price);
  Future<Either<Failure, bool>> updatePrice(PriceDto price);
  Future<bool> deletePrice(int id);
}
