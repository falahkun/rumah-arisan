part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String token = Provider.of<String>(context);

    if (token != null) {
      context.bloc<AuthBloc>().add(GetToken(token));
      context.bloc<CloterBloc>().add(LoadCloter(token));
      context.bloc<SliderBloc>().add(LoadSlider(token));
      context.bloc<CommunitiesBloc>().add(LoadCommunities(token));
      prevPageEvent = GoToMainPage(0);
      context.bloc<PageBloc>().add(prevPageEvent);
    } else {
      UnilinkServices.getLink().then((value) {
        if (value != null) {
          var token = UnilinkServices.getTokenFromUrl(value);
          var code = UnilinkServices.getCodeFromUrl(value);

          context.bloc<UserBloc>().add(LoadUser(token, code));

          context.bloc<PageBloc>().add(GoToActivateYourAccount(
              token, UserData(kode: code, memberToken: token)));
        }
      });
      prevPageEvent = GoToSplashPage();
      context.bloc<PageBloc>().add(prevPageEvent);
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnSignInPage)
                ? SignInPage()
                : (pageState is OnMainPage)
                    ? MainPage(
                        indexPage: pageState.indexPage,
                      )
                    : (pageState is OnSignUpPage)
                        ? SignUpPage(
                            onBackPage: pageState.backPage,
                            registerModel: pageState.registerModel,
                          )
                        : (pageState is OnCompletingSignUpPage)
                            ? CompletingSignUpPage(
                                onBackPage: pageState.backPage,
                                registerModel: pageState.registerModel,
                              )
                            : (pageState is OnConfirmSignUpPage)
                                ? ConfirmSignUpPage(
                                    onBackPage: pageState.backPage,
                                    registerModel: pageState.registerModel,
                                  )
                                : (pageState is OnActivateYourAccount)
                                    ? ActivateYourAccountPage(
                                        model: pageState.userModel,
                                        token: pageState.token,
                                      )
                                    : (pageState is OnCompletingActivating)
                                        ? CompletingActivatePage(
                                            model: pageState.userModel,
                                          )
                                        : (pageState is OnSuccessPage)
                                            ? SuccessCreatingAccountPage(
                                                isRegister:
                                                    pageState.isRegister,
                                                message: pageState.message,
                                              )
                                            : (pageState is OnSettingPage)
                                                ? SettingPage(
                                                    tokenResult:
                                                        pageState.tokenResult,
                                                  )
                                                : (pageState is OnCdetailPage)
                                                    ? CloterDetail(
                                                        cloterData: pageState
                                                            .cloterData,
                                                        slug: pageState.slug,
                                                        memberToken: pageState
                                                            .memberToken,
                                                      )
                                                    : Container());
  }
}
