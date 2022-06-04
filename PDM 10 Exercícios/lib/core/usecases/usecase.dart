import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Params extends Equatable{
  late final String id;

  Params({required this.id}) : super();
   
  @override
  List<Object> get props => [id];
}


class NoParams extends Equatable{
  @override
  List<Object> get props => [];
}