import 'package:dartz/dartz.dart';


import '../../../../core/error/failure.dart';
import '../entities/ghibliChar.dart';


abstract class GhibliCharRepository {
  Future<Either<Failure, GhibliChar>> getGhibliChar(String id);
}
