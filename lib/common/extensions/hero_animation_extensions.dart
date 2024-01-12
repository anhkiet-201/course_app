import 'package:flutter/material.dart';

extension HeroTag on Widget {
  Hero heroTag(String tag, {Widget Function(Animation<double> animation, Widget child)? transactionBuilder}) => Hero(
    tag: tag,
    transitionOnUserGestures: true,
    child: this,
    flightShuttleBuilder:
        (flightContext, animation, direction, fromcontext, toContext) {
      final Hero toHero = toContext.widget as Hero;
      final Hero fromHero = fromcontext.widget as Hero;
      // Change push and pop animation.
      final target = direction ==  HeroFlightDirection.push
            ? toHero.child
            : fromHero.child;
      final widget = transactionBuilder?.call(animation, target) ?? target;
      return Material(
        color: Colors.transparent,
        child: widget,
      );
    },
  );

  Hero subTag(String tag) => Hero(
      tag: tag,
      child: this
  );
}