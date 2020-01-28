import 'package:clean_arc_tdd_course/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InvalidInputFailure extends Failure {}

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}