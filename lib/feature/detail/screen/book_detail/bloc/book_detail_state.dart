part of 'book_detail_bloc.dart';

class BookDetailState extends Equatable {
  const BookDetailState({
    this.book = const Load.initial(),
    this.moreBooksAuthor = const Load.initial(),
    this.moreBooksTopic = const Load.initial(),
  });

  final Load<Book> book;
  final Load<List<Book>> moreBooksAuthor;
  final Load<List<Book>> moreBooksTopic;

  @override
  List<Object?> get props => [
        book,
        moreBooksAuthor,
        moreBooksTopic,
      ];

  BookDetailState copyWith({
    Load<Book>? book,
    Load<List<Book>>? moreBooksAuthor,
    Load<List<Book>>? moreBooksTopic,
  }) {
    return BookDetailState(
      book: book ?? this.book,
      moreBooksAuthor: moreBooksAuthor ?? this.moreBooksAuthor,
      moreBooksTopic: moreBooksTopic ?? this.moreBooksTopic,
    );
  }
}
