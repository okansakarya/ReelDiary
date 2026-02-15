import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/constants/list_type_labels.dart';
import 'package:movieapp/core/extensions/user_extensions.dart';
import 'package:movieapp/presentation/components/widgets/custom_appbar_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_circular_widget.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_cubit.dart';
import 'package:movieapp/presentation/pages/homePage/components/state/home_page_cubit.dart';
import 'package:movieapp/presentation/pages/homePage/components/state/home_page_state.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/drawer_widget.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/filter_listview.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/movie_grid_view_list.dart';
import 'package:movieapp/utils/pop_up_utils.dart';
import 'package:movieapp/utils/screen_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String?> _filterNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<HomePageCubit>().getHomePageMovies();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _filterNotifier.dispose();
    super.dispose();
  }

  void _searchMovie() {
    context.read<HomePageCubit>().searchMovie(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().currentUser;
    final initials = user.getInitials();
    final textPrimary = AppColors.textPrimary(context);
    final primary = AppColors.primary(context);
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);

    return Scaffold(
      backgroundColor: AppColors.surface(context),
      drawer: DrawerWidget(),
      body: Builder(
        builder: (context) => SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtils.getScreenHeight(context) * 0.20,
                child: CustomAppBarWidget(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu, color: textPrimary),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                            ),
                            Text(
                              'Anasayfa',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: textPrimary,
                              ),
                            ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: primary,
                              child: Text(
                                initials,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtils.getScreenHeight(context) * 0.008,
                        ),
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Ara...',
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.textFieldIcon(context),
                            ),
                            filled: true,
                            fillColor: AppColors.textFieldFill(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.textFieldBorder(context),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.textFieldBorder(context),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.textFieldText(context),
                            fontSize: 14,
                          ),
                          onChanged: (_) => _searchMovie(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtils.getScreenHeight(context) * 0.02,
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
                      return const Center(child: CustomCircularWidget());
                    }
                    if (state is HomePageLoaded) {
                      final list = state.movieList;
                      final distinctListTypes =
                          list.map((m) => m.list_type).toSet().toList();
                      final displayLabels = [
                        'Tümü',
                        ...distinctListTypes
                            .map((api) => ListTypeLabels.toTurkish(api)),
                      ];
                      final filterValues = [
                        null,
                        ...distinctListTypes,
                      ];

                      return ValueListenableBuilder<String?>(
                        valueListenable: _filterNotifier,
                        builder: (context, selected, _) {
                          final filteredList = selected == null
                              ? list
                              : list
                                  .where(
                                    (m) =>
                                        m.list_type.toLowerCase() ==
                                        selected.toLowerCase(),
                                  )
                                  .toList();

                          return Column(
                            children: [
                              FilterListview(
                                filterDisplayLabels: displayLabels,
                                filterValues: filterValues,
                                selectedFilterNotifier: _filterNotifier,
                              ),
                              SizedBox(
                                height: ScreenUtils.getScreenHeight(context) *
                                    0.025,
                              ),
                              Expanded(
                                child: MovieGridViewList(items: filteredList),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomCircularWidget(),
                          Text(
                            'Liste yükleniyor...',
                            style: TextStyle(
                              color: AppColors.textSecondary(context),
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
      ),
    );
  }
}
