import 'package:flutter/material.dart';
import 'package:ramadhan_app/ui_kit/widgets/shared/animated_switcher_size.dart';
import 'package:ramadhan_app/ui_kit/widgets/shared/blank_builder.dart';

class FadeSwitcherBuilder extends StatelessWidget {
  final Widget Function() builder;
  final Duration fadeDuration;
  const FadeSwitcherBuilder({
    super.key,
    required this.builder,
    this.fadeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: fadeDuration,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: (this).builder(),
    );
  }
}

class AnimatedSwitcherBuilder extends StatelessWidget {
  final Widget Function() builder;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const AnimatedSwitcherBuilder({
    super.key,
    required this.builder,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.sizeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).builder(),
    );
  }
}

class AnimatedSwitcherWidget extends StatelessWidget {
  final Widget child;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const AnimatedSwitcherWidget({
    super.key,
    required this.child,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.sizeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).child,
    );
  }
}

class AnimatedVisibility extends StatelessWidget {
  final Widget child;
  final bool show;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const AnimatedVisibility({
    super.key,
    required this.child,
    this.show = true,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.sizeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      fadeInCurve: Curves.bounceInOut,
      fadeOutCurve: Curves.bounceInOut,
      sizeCurve: Curves.bounceInOut,
      child: BlankBuilder(() {
        if (show == true) {
          return (this).child;
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
