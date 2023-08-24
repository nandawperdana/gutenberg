part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Load<List<Book>> books;
  final bool isSearchActive;
  final String? keyword;
  final bool isLastPage;
  final int? page;

  const HomeState({
    this.books = const Load.initial(),
    this.isSearchActive = false,
    this.keyword,
    this.isLastPage = false,
    this.page,
  });

  @override
  List<Object?> get props => [
        books,
        isSearchActive,
        keyword,
        isLastPage,
        page,
      ];

  HomeState copyWith({
    Load<List<Book>>? books,
    String? keyword,
    bool? isSearchActive,
    bool? isLastPage,
    int? page,
  }) {
    return HomeState(
      books: books ?? this.books,
      isSearchActive: isSearchActive ?? this.isSearchActive,
      keyword: keyword ?? this.keyword,
      isLastPage: isLastPage ?? this.isLastPage,
      page: page ?? this.page,
    );
  }
}
