part of 'book_list_bloc.dart';

class BookListState extends Equatable {
  const BookListState({
    this.books = const Load.initial(),
    this.isLastPage = false,
    this.page,
  });

  final Load<List<Book>> books;
  final bool isLastPage;
  final int? page;

  @override
  List<Object?> get props => [
        books,
        isLastPage,
        page,
      ];

  BookListState copyWith({
    Load<List<Book>>? books,
    bool? isLastPage,
    int? page,
  }) {
    return BookListState(
      books: books ?? this.books,
      isLastPage: isLastPage ?? this.isLastPage,
      page: page ?? this.page,
    );
  }
}
