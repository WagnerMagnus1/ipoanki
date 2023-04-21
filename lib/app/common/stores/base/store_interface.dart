import 'package:flutter/material.dart';

abstract class IStoreBase<T> extends ValueNotifier<T> {
  IStoreBase(super.value);
}
