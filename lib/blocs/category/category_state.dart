part of 'category_bloc.dart';

abstract class CategoryState {

} 

class OnInitialCategory extends CategoryState {}
class OnLoadedCategory extends CategoryState {
  final CategoryResult categoryResult;

  OnLoadedCategory(this.categoryResult);
}