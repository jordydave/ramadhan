part of 'splash_worker.dart';

class SplashPage extends GetState<SplashBloc> with _Worker {
  static const page = '/splash_page';
  SplashPage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<SplashBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (bloc) {
        return Scaffold(
          body: _Body(bloc: bloc),
        );
      }
    );
  }
}

class _Body extends StatelessWidget {
  final SplashBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}