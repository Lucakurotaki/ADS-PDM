// Mocks generated by Mockito 5.0.7 from annotations
// in number_trivia/test/features/ghibliFilm/domain/usecases/getGhibliFilmById_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:number_trivia/core/error/failure.dart' as _i5;
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibliFilm.dart'
    as _i6;
import 'package:number_trivia/features/ghibliFilm/domain/repositories/ghibliFilmRepository.dart'
    as _i3;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [GhibliFilmRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGhibliFilmRepository extends _i1.Mock
    implements _i3.GhibliFilmRepository {
  MockGhibliFilmRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.GhibliFilm>> getGhibliFilmById(
          String? id) =>
      (super.noSuchMethod(Invocation.method(#getGhibliFilmById, [id]),
          returnValue: Future<_i2.Either<_i5.Failure, _i6.GhibliFilm>>.value(
              _FakeEither<_i5.Failure, _i6.GhibliFilm>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.GhibliFilm>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.GhibliFilm>>>
      getAllGhibliFilm() => (super.noSuchMethod(
              Invocation.method(#getAllGhibliFilm, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.GhibliFilm>>>.value(
                      _FakeEither<_i5.Failure, List<_i6.GhibliFilm>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.GhibliFilm>>>);
}
