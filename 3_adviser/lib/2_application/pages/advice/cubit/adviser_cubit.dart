import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/use_cases/advice_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_state.dart';

const kServerFailureMessage = "API Error, please try again!";
const kCacheFailureMessage = "Cache failed, please try again!";
const kGeneralFailureMessage = "Something went wrong, please try again";

class AdviserCubit extends Cubit<AdviserCubitState> {
  final AdviceUseCases adviceUseCases;
  AdviserCubit({required this.adviceUseCases}) : super(AdviserInitial());

  // could use multiple use cases

  void adviceRequested() async {
    emit(AdviserStateLoading());

    final failureOrAdvice = await adviceUseCases.getAdvice();

    failureOrAdvice.fold(
      (failure) =>
          emit(AdviserStateError(message: _mapFailureToMessage(failure))),
      (advice) => emit(AdviserStateLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return kServerFailureMessage;
      case CacheFailure:
        return kCacheFailureMessage;
      default:
        return kGeneralFailureMessage;
    }
  }
}
