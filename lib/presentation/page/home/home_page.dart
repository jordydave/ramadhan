part of 'home_worker.dart';

class HomePage extends GetState<HomeBloc> with _Worker {
  static const page = '/home_page';
  HomePage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<HomeBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (bloc) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Home',
              style: AppStyles.primaryTextBold.copyWith(fontSize: 18.0.sp),
            ),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body: _Body(bloc: bloc),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  final HomeBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            bloc.greetingMessage(),
            style: AppStyles.primaryTextBold.copyWith(
              fontSize: 18.0.sp,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          height: 15.0.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.blue.withOpacity(0.7),
                AppColors.purple.withOpacity(0.5),
              ],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quran Last Read',
                  style: AppStyles.primaryTextBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 2.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Surah Al-Baqarah',
                      style: AppStyles.secondaryText.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'Ayat 100',
                      style: AppStyles.secondaryText.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        DefaultTabController(
          length: 3,
          child: TabBar(
            onTap: (index) => bloc.tabIndex(index),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(
                child: Obx(() {
                  final tab = bloc.tabIndex.value;
                  return Text(
                    'Surah',
                    style: AppStyles.primaryTextBold.copyWith(
                      color: tab == 0 ? AppColors.primary : AppColors.grey,
                    ),
                  );
                }),
              ),
              Tab(
                child: Obx(() {
                  final tab = bloc.tabIndex.value;
                  return Text(
                    'Tafsir',
                    style: AppStyles.primaryTextBold.copyWith(
                      color: tab == 1 ? AppColors.primary : AppColors.grey,
                    ),
                  );
                }),
              ),
              Tab(
                child: Obx(() {
                  final tab = bloc.tabIndex.value;
                  return Text(
                    'Bookmark',
                    style: AppStyles.primaryTextBold.copyWith(
                      color: tab == 2 ? AppColors.primary : AppColors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.2, 0),
                    end: const Offset(0, 0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: [
                _SurahTab(bloc: bloc),
                const Text('Tafsir Tab'),
                _BookmarkTab(bloc: bloc),
              ][bloc.tabIndex.value],
            );
          }),
        ),
      ],
    );
  }
}
