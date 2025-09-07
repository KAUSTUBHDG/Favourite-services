enum SaveEditButtonEnum {
  edit,
  save,
  newSave,
  none,
}

extension SaveEditButtonEnumExt on SaveEditButtonEnum {
  bool get isEdit => this == SaveEditButtonEnum.edit;
  bool get isSave => this == SaveEditButtonEnum.save;
  bool get isNewSave => this == SaveEditButtonEnum.newSave;
  bool get isNone => this == SaveEditButtonEnum.none;
}
