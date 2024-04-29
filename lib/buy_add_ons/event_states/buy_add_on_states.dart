
import 'package:equatable/equatable.dart';

abstract class BuyAddOnStates extends Equatable {
  const BuyAddOnStates();

  @override
  List<Object?> get props => [];
}

class BuyAddOnInitialState extends BuyAddOnStates {}

class BuyAddOnLoadingState extends BuyAddOnStates {}

class BuyAddOnSuccessfulState extends BuyAddOnStates {}


class HoldItemLoadingState extends BuyAddOnStates{}
class HoldItemSuccessfulState extends BuyAddOnStates{}
class HoldItemFailedState extends BuyAddOnStates{
  final String errorMessage;

  HoldItemFailedState({required this.errorMessage});
}

class BuyAddOnFailureState extends BuyAddOnStates {
  final String errorMessage;

  const BuyAddOnFailureState({required this.errorMessage});
}
