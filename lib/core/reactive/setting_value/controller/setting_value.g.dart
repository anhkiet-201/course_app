// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_value.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingValue<T> on _SettingValueBase<T>, Store {
  Computed<T>? _$valueComputed;

  @override
  T get value => (_$valueComputed ??=
          Computed<T>(() => super.value, name: '_SettingValueBase.value'))
      .value;

  late final _$_valueAtom =
      Atom(name: '_SettingValueBase._value', context: context);

  @override
  T get _value {
    _$_valueAtom.reportRead();
    return super._value;
  }

  @override
  set _value(T value) {
    _$_valueAtom.reportWrite(value, super._value, () {
      super._value = value;
    });
  }

  late final _$updateValueAsyncAction =
      AsyncAction('_SettingValueBase.updateValue', context: context);

  @override
  Future<void> updateValue(T? newValue) {
    return _$updateValueAsyncAction.run(() => super.updateValue(newValue));
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
