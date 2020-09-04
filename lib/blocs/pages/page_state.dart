part of 'page_bloc.dart';

abstract class PageState extends Equatable {}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int indexPage;

  OnMainPage(this.indexPage);
  @override
  List<Object> get props => [indexPage];
}

class OnSignUpPage extends PageState {
  final PageEvent backPage;
  final RegisterModel registerModel;

  OnSignUpPage(this.backPage, this.registerModel);
  @override
  List<Object> get props => [backPage, registerModel];
}

class OnCompletingSignUpPage extends PageState {
  final PageEvent backPage;
  final RegisterModel registerModel;

  OnCompletingSignUpPage(
    this.backPage,
    this.registerModel,
  );
  @override
  List<Object> get props => [backPage, registerModel];
}

class OnConfirmSignUpPage extends PageState {
  final PageEvent backPage;
  final RegisterModel registerModel;

  OnConfirmSignUpPage(
    this.backPage,
    this.registerModel,
  );
  @override
  List<Object> get props => [backPage, registerModel];
}

class OnActivateYourAccount extends PageState {
  final String token;
  final UserData userModel;

  OnActivateYourAccount(this.token, this.userModel);
  @override
  List<Object> get props => [token, userModel];
}

class OnCompletingActivating extends PageState {
  final UserData userModel;

  OnCompletingActivating(this.userModel);
  @override
  List<Object> get props => [userModel];
}

class OnSuccessPage extends PageState {
  final String message;
  final bool isRegister;

  OnSuccessPage(this.isRegister, {this.message});
  @override
  List<Object> get props => [
        isRegister,
        message,
      ];
}

class OnSettingPage extends PageState {
  final TokenResult tokenResult;

  OnSettingPage(this.tokenResult);
  @override
  List<Object> get props => [tokenResult];
}

class OnCdetailPage extends PageState {
  final String slug;
  final String memberToken;
  final CloterDetailResult cloterData;
  OnCdetailPage(this.memberToken, {this.slug, this.cloterData});
  @override
  List<Object> get props => [memberToken, slug, cloterData];
}
