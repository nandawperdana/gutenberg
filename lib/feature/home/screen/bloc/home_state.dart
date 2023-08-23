part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Load<List<Book>> books;
  final bool isSearchActive;
  final String? keyword;
  final int? page;

  const HomeState({
    this.books = const Load.initial(),
    this.isSearchActive = false,
    this.keyword,
    this.page,
  });

  @override
  List<Object?> get props => [
        books,
        isSearchActive,
        keyword,
        page,
      ];

  HomeState copyWith({
    Load<List<Book>>? books,
    String? keyword,
    bool? isSearchActive,
    int? page,
    dynamic error,
  }) {
    return HomeState(
      books: books ?? this.books,
      isSearchActive: isSearchActive ?? this.isSearchActive,
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
    );
  }
}
