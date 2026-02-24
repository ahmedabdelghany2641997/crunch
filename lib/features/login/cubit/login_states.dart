abstract class LoginStates {}
class InitialState extends LoginStates{}
class LoadingState extends LoginStates{}
class SuccessState extends LoginStates{}
class ErrorState extends LoginStates{
  final String error ;
  ErrorState({required this.error});

}