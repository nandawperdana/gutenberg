part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchEvent extends HomeEvent {
  final int page;

  const FetchEvent({this.page = 1});

  @override
  List<Object> get props => [page];
}

class SearchEvent extends HomeEvent {
  final String keyword;

  const SearchEvent({required this.keyword});

  @override
  List<Object> get props => [keyword];
}

class NavigateToBookScreenEvent extends HomeEvent {
  final int id;

  const NavigateToBookScreenEvent({required this.id});

  @override
  List<Object> get props => [id];
}
