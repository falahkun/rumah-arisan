import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumah_arisan/models/models.dart';

part 'page_state.dart';
part 'page_event.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(PageState initialState) : super(initialState);

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToSignInPage) {
      yield OnSignInPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToSignUpPage) {
      yield OnSignUpPage(event.onBackPage, event.registerModel);
    } else if (event is GoToCompletingSignUpPage) {
      yield OnCompletingSignUpPage(event.onBackPage, event.registerModel);
    }else if (event is GoToConfirmSignUpPage) {
      yield OnConfirmSignUpPage(event.onBackPage, event.registerModel);
    }
  }
}
