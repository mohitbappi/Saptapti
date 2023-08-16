class Language {
  final int id;
  final String name;

  Language({required this.id, required this.name});
}

class Subcast {
  final int subcaste_id;
  final String caste_name;

  Subcast({required this.subcaste_id, required this.caste_name});
}

class City {
  final int id;
  final String status;
  final String city_name;
  final String country_id;
  final String state_id;
  final String is_deleted;

  City(
      {required this.id,
      required this.status,
      required this.city_name,
      required this.country_id,
      required this.state_id,
      required this.is_deleted});
}

class StateModel {
  final String state_name;

  StateModel({
    required this.state_name,
  });
}

class VillageModel {
  final String state_name;

  VillageModel({
    required this.state_name,
  });
}

class Education {
  final int id;
  final String status;
  final String education_name;
  final String is_deleted;

  Education(
      {required this.id,
      required this.status,
      required this.education_name,
      required this.is_deleted});
}

class Occupation {
  final int id;
  final String occupation_name;
  final String status;
  final String is_deleted;

  Occupation(
      {required this.id,
      required this.occupation_name,
      required this.status,
      required this.is_deleted});
}

class Designation {
  final int id;
  final String designation_name;
  final String status;
  final String is_deleted;

  Designation(
      {required this.id,
      required this.designation_name,
      required this.status,
      required this.is_deleted});
}

class Autogenerated {
  List<String> response;

  Autogenerated({required this.response});
}
