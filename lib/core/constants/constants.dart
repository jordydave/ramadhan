part 'constants/constant_base.dart';

class Consts {
  const Consts();

  static const baseKey = "base_key";
  static const flavorKey = "flavor_key";

  static Base base = const Base();
  static FlavorConst flavor = const FlavorConst();
}

class FlavorConst {
  const FlavorConst();
  String get dev => "dev";
  String get prod => "production";
}
