part of 'book_detail_bloc.dart';

class BookDetailState extends Equatable {
  const BookDetailState({
    this.book = const Load.initial(),
  });

  final Load<Book> book;

  @override
  List<Object?> get props => [book];

  BookDetailState copyWith({
    Load<Book>? book,
  }) {
    return BookDetailState(
      book: book ?? this.book,
    );
  }
}
