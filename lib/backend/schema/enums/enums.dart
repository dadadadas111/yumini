import 'package:collection/collection.dart';

enum DropdownMenuType {
  Section_Header,
  Default_Item,
  Section_Footer,
}

enum ResponseType {
  RFP,
  RFI,
  RFQ,
}

enum Teams {
  FlutterFlow,
  Google,
  ACME,
}

enum Role {
  user,
  assistant,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (DropdownMenuType):
      return DropdownMenuType.values.deserialize(value) as T?;
    case (ResponseType):
      return ResponseType.values.deserialize(value) as T?;
    case (Teams):
      return Teams.values.deserialize(value) as T?;
    case (Role):
      return Role.values.deserialize(value) as T?;
    default:
      return null;
  }
}
