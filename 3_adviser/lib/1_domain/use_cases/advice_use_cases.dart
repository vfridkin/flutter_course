// Use cases contain business logic

import 'package:adviser/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // space for business logic
    return adviceRepo.getAdviceFromDataSource();

    // // Call repo to get data
    // // Manipulate data
    // await Future.delayed(const Duration(seconds: 3), () {});

    // // failure
    // return left(CacheFailure());

    // // success
    // return right(const AdviceEntity(
    //     id: 0, advice: 'fake advice: entity -> use case -> cubit'));
  }
}
