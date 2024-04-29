import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtensionX on num {
  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get days => Duration(days: toInt());

  Future<int> get delayedMicroSeconds async =>
      Future.delayed(toInt().microseconds);

  Future<int> get delayedMilliSeconds async =>
      Future.delayed(toInt().milliseconds);

  Future<int> get delayedSeconds async => await Future.delayed(toInt().seconds);

  Future<int> get delayedMinutes async => Future.delayed(toInt().minutes);

  Future<int> get delayedHours async => Future.delayed(toInt().hours);

  Radius get circular => Radius.circular(toDouble().r);

  BorderRadiusGeometry get rounded => BorderRadius.circular(toDouble().r);

  EdgeInsets get all => EdgeInsets.all(toDouble().r);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble().w);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble().h);
}



extension EdgeInsetsX on EdgeInsets {
  EdgeInsets get r =>
      copyWith(top: top.r, left: left.r, right: right.r, bottom: bottom.r);
}
