import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import 'package:gutenberg/feature/home/screen/bloc/home_bloc.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_book_content.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        fetchBooksUseCase: locator<FetchBooksUseCase>(),
        transporter: locator<Transporter>(),
      )..add(const FetchEvent()),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SafeArea(
                child: RefreshIndicator(
                  backgroundColor: Colors.white,
                  color: AppColor.primary,
                  onRefresh: () async {
                    context.read<HomeBloc>().add(const FetchEvent());
                  },
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeSearchBar(),
                      Expanded(child: HomeBookContent()),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
