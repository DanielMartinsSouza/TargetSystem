import 'package:mobx/mobx.dart';

part 'state.g.dart';

class InformationState = _InformationState with _$InformationState;

abstract class _InformationState with Store {
  @observable
  ObservableList<String> informationList = ObservableList<String>();

  @action
  void addInformation(String information) {
    informationList.add(information);
  }

  @action
  void removeInformation(int index) {
    informationList.removeAt(index);
  }
}
