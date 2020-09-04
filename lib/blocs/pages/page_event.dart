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
  final int indexPage;

  GoToMainPage(this.indexPage);
  @override
  List<Object> get props => [indexPage];
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

class GoToConfirmSignUpPage extends PageEvent {
  final PageEvent onBackPage;
  final RegisterModel registerModel;

  GoToConfirmSignUpPage(this.onBackPage, this.registerModel);
  @override
  List<Object> get props => [
        onBackPage,
        registerModel,
      ];
}

class GoToActivateYourAccount extends PageEvent {
  final String token;
  final UserData userModel;

  GoToActivateYourAccount(this.token, this.userModel);
  @override
  List<Object> get props => [
        token,
        userModel,
      ];
}

class GoToCompletingActivating extends PageEvent {
  final UserData userModel;

  GoToCompletingActivating(this.userModel);
  @override
  List<Object> get props => [
        userModel,
      ];
}

class GoToSuccessPage extends PageEvent {
  final String message;
  final bool isRegister;

  GoToSuccessPage(this.isRegister, {this.message});
  @override
  List<Object> get props => [isRegister, message];
}

class GoToSettingPage extends PageEvent {
  final TokenResult tokenResult;

  GoToSettingPage(this.tokenResult);
  @override
  List<Object> get props => [tokenResult];
}

class GoToCdetail extends PageEvent {
  final String slug;
  final String memberToken;
  final CloterData cloterData;

  GoToCdetail(this.memberToken, {this.slug, this.cloterData});
  @override
  List<Object> get props => [memberToken, slug, cloterData];
}
