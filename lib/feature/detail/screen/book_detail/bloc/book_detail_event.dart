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
