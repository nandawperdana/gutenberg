part of 'book_list_bloc.dart';

abstract class BookListEvent extends Equatable {
  const BookListEvent();
}

class FetchEvent extends BookListEvent {
  final String keyword;
  final int page;

  const FetchEvent({
    required this.keyword,
    this.page = 1,
  });

  @override
  List<Object> get props => [keyword, page];
}

class NavigateToBookScreenEvent extends BookListEvent {
  final int id;

  const NavigateToBookScreenEvent({required this.id});

  @override
  List<Object> get props => [id];
}
