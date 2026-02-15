import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/components/widgets/custom_appbar_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_circular_widget.dart';
import 'package:movieapp/presentation/pages/homePage/components/state/home_page_cubit.dart';
import 'package:movieapp/presentation/pages/homePage/components/state/home_page_state.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/movie_grid_view_list.dart';
import 'package:movieapp/utils/pop_up_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<HomePageCubit>().getHomePageMovies();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ana Sayfa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.backgroundDark,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<HomePageCubit, HomePageState>(
                listener: (context, state) {
                  if (state is HomePageError) {
                    PopUpUtils.showPopup(
                      context,
                      false,
                      successMessage: '',
                      failureMessage: state.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is HomePageLoading) {
                    return const Center(
                      child: CustomCircularWidget(),
                    );
                  }
                  if (state is HomePageLoaded) {
                    return MovieGridViewList(items: state.movieList);
                  }
                  return const Center(
                    child: Column(
                      children: [
                        CustomCircularWidget(),
                        Text(
                          'Liste yükleniyor...',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
