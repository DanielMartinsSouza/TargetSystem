// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationState on _InformationState, Store {
  late final _$informationListAtom =
      Atom(name: '_InformationState.informationList', context: context);

  @override
  ObservableList<String> get informationList {
    _$informationListAtom.reportRead();
    return super.informationList;
  }

  @override
  set informationList(ObservableList<String> value) {
    _$informationListAtom.reportWrite(value, super.informationList, () {
      super.informationList = value;
    });
  }

  late final _$_InformationStateActionController =
      ActionController(name: '_InformationState', context: context);

  @override
  void addInformation(String information) {
    final _$actionInfo = _$_InformationStateActionController.startAction(
        name: '_InformationState.addInformation');
    try {
      return super.addInformation(information);
    } finally {
      _$_InformationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInformation(int index) {
    final _$actionInfo = _$_InformationStateActionController.startAction(
        name: '_InformationState.removeInformation');
    try {
      return super.removeInformation(index);
    } finally {
      _$_InformationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
informationList: ${informationList}
    ''';
  }
}
