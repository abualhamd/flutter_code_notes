import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavParams extends Equatable {
  const FavParams({required this.id, required this.cond});

  final int id;
  final String cond;

  @override
  List<Object?> get props => [id, cond];
}