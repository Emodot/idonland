import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:rootshive/utils/constant.dart';

getHintInputText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 14.0),
      const Condition.equals(name: TABLET, value: 16.0),
      const Condition.equals(name: DESKTOP, value: 18.0),
      const Condition.largerThan(name: DESKTOP, value: 20.0),
    ],
    defaultValue: 14.0,
  ).value;
}

getSmallerText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 8.0),
      const Condition.equals(name: TABLET, value: 10.0),
      const Condition.equals(name: DESKTOP, value: 12.0),
      const Condition.largerThan(name: DESKTOP, value: 14.0),
    ],
    defaultValue: 8.0,
  ).value;
}

getSmallerRegText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 10.0),
      const Condition.equals(name: TABLET, value: 12.0),
      const Condition.equals(name: DESKTOP, value: 14.0),
      const Condition.largerThan(name: DESKTOP, value: 16.0),
    ],
    defaultValue: 10.0,
  ).value;
}

getSmallRegText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 12.0),
      const Condition.equals(name: TABLET, value: 14.0),
      const Condition.equals(name: DESKTOP, value: 16.0),
      const Condition.largerThan(name: DESKTOP, value: 18.0),
    ],
    defaultValue: 12.0,
  ).value;
}

getRegText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 14.0),
      const Condition.equals(name: TABLET, value: 16.0),
      const Condition.equals(name: DESKTOP, value: 18.0),
      const Condition.largerThan(name: DESKTOP, value: 20.0),
    ],
    defaultValue: 14.0,
  ).value;
}

getBigRegText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 16.0),
      const Condition.equals(name: TABLET, value: 18.0),
      const Condition.equals(name: DESKTOP, value: 20.0),
      const Condition.largerThan(name: DESKTOP, value: 22.0),
    ],
    defaultValue: 16.0,
  ).value;
}

getBigText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 18.0),
      const Condition.equals(name: TABLET, value: 20.0),
      const Condition.equals(name: DESKTOP, value: 22.0),
      const Condition.largerThan(name: DESKTOP, value: 24.0),
    ],
    defaultValue: 18.0,
  ).value;
}

getBiggerText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 20.0),
      const Condition.equals(name: TABLET, value: 22.0),
      const Condition.equals(name: DESKTOP, value: 24.0),
      const Condition.largerThan(name: DESKTOP, value: 26.0),
    ],
    defaultValue: 20.0,
  ).value;
}

getBiggerRegText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 24.0),
      const Condition.equals(name: TABLET, value: 26.0),
      const Condition.equals(name: DESKTOP, value: 28.0),
      const Condition.largerThan(name: DESKTOP, value: 30.0),
    ],
    defaultValue: 24.0,
  ).value;
}

getBiggerRegText2(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 28.0),
      const Condition.equals(name: TABLET, value: 30.0),
      const Condition.equals(name: DESKTOP, value: 32.0),
      const Condition.largerThan(name: DESKTOP, value: 34.0),
    ],
    defaultValue: 28.0,
  ).value;
}

getLargeRegText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 32.0),
      const Condition.equals(name: TABLET, value: 34.0),
      const Condition.equals(name: DESKTOP, value: 36.0),
      const Condition.largerThan(name: DESKTOP, value: 38.0),
    ],
    defaultValue: 32.0,
  ).value;
}

getLargerRegText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 36.0),
      const Condition.equals(name: TABLET, value: 38.0),
      const Condition.equals(name: DESKTOP, value: 40.0),
      const Condition.largerThan(name: DESKTOP, value: 42.0),
    ],
    defaultValue: 36.0,
  ).value;
}

getLargeText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 40.0),
      const Condition.equals(name: TABLET, value: 42.0),
      const Condition.equals(name: DESKTOP, value: 44.0),
      const Condition.largerThan(name: DESKTOP, value: 46.0),
    ],
    defaultValue: 40.0,
  ).value;
}

getLargerText(BuildContext context) {
  return ResponsiveValue(
    context,
    valueWhen: [
      const Condition.equals(name: MOBILE, value: 44.0),
      const Condition.equals(name: TABLET, value: 46.0),
      const Condition.equals(name: DESKTOP, value: 48.0),
      const Condition.largerThan(name: DESKTOP, value: 50.0),
    ],
    defaultValue: 44.0,
  ).value;
}

getInputBox(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFF010D2C),
      width: 1.5,
    ),
  );
}

getInputBoxWhite(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: const Color(0xFFFFFFFF).withOpacity(0.6),
      width: 1.5,
    ),
  );
}

getInputBox2(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xFF004DE1),
      width: 2,
    ),
  );
}
