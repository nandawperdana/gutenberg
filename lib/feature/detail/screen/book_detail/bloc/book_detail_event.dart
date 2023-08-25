part of 'book_detail_bloc.dart';

abstract class BookDetailEvent extends Equatable {
  const BookDetailEvent();
}

class FetchDetailEvent extends BookDetailEvent {
  final int bookId;

  const FetchDetailEvent(this.bookId);

  @override
  List<Object> get props => [bookId];
}

class FetchMoreBooksEvent extends BookDetailEvent {
  final KeywordType type;
  final String keyword;

  const FetchMoreBooksEvent({
    required this.keyword,
    required this.type,
  });

  @override
  List<Object> get props => [type, keyword];
}

class FetchMoreBooksByTopicEvent extends BookDetailEvent {
  final String topic;

  const FetchMoreBooksByTopicEvent(this.topic);

  @override
  List<Object> get props => [topic];
}

class NavigateToBookScreenEvent extends BookDetailEvent {
  final int id;

  const NavigateToBookScreenEvent(this.id);

  @override
  List<Object> get props => [id];
}

class NavigateToBookListScreenEvent extends BookDetailEvent {
  final String keyword;

  const NavigateToBookListScreenEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

class OnTapPreviewEvent extends BookDetailEvent {
  final String url;

  const OnTapPreviewEvent(this.url);

  @override
  List<Object> get props => [url];
}
