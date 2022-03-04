import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomToTopSlideTransition extends CustomTransitionPage {
  BottomToTopSlideTransition(
      {required this.child, this.key, this.fullscreenDialog = false})
      : super(
            fullscreenDialog: fullscreenDialog,
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder: (context, animation, secondaryAnimation,
                    child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeOut)).animate(animation),
                  child: child,
                ),
            transitionDuration: const Duration(milliseconds: 300),
            key: key);
  final Widget child;
  final LocalKey? key;
  final bool fullscreenDialog;
}
