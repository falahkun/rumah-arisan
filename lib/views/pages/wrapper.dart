part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String token = Provider.of<String>(context);
    if (token != null) {
      context.bloc<PageBloc>().add(GoToMainPage());
    } else {
      context.bloc<PageBloc>().add(GoToSplashPage());
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnSignInPage)
                ? SignInPage()
                : (pageState is OnMainPage)
                    ? MainPage()
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
                                : Container());
  }
}
