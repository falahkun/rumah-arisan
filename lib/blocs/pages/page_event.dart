part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  final PageEvent onBackPage;
  final RegisterModel registerModel;

  GoToSignUpPage(this.onBackPage, this.registerModel);
  @override
  List<Object> get props => [onBackPage, registerModel];
}

class GoToCompletingSignUpPage extends PageEvent {
  final PageEvent onBackPage;
  final RegisterModel registerModel;

  GoToCompletingSignUpPage(this.onBackPage, this.registerModel);
  @override
  List<Object> get props => [
        onBackPage,
        registerModel,
      ];
}
