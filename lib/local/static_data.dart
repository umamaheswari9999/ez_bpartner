import 'package:ez_flutter/shared/model/simple.dart';

abstract class StaticData {
  static List<Simple> get genders => [
    const Simple(id: 'M', title: 'Male'),
    const Simple(id: 'F', title: 'Female'),
    const Simple(id: 'T', title: 'Others'),
  ];

  static List<Simple> get accountTypes => [
    const Simple(id: 'Current', title: 'Current'),
    const Simple(id: 'Saving', title: 'Saving'),
  ];

  static List<Simple> get occupationTypes => [
    const Simple(id: "SPS", title: "Service- Private Sector"),
    const Simple(id: "SPBS", title: "Service- Public Sector"),
    const Simple(id: "SGS", title: "Service- Government Sector"),
    const Simple(id: "OP", title: "Others- Professional"),
    const Simple(id: "OSE", title: "Others- Self Employed"),
    const Simple(id: "OR", title: "Others- Retired"),
    const Simple(id: "B", title: "Business"),
    const Simple(id: "X", title: "X- Not Categorised")
  ];

  static List<Simple> get residenceTypes => [
    const Simple(id: "RI", title: "Resident Individual"),
    const Simple(id: "NRI", title: "Non Resident Indian"),
    const Simple(id: "Foreign", title: "Foreign National"),
    const Simple(id: "PIO", title: "Person of Indian Origin")
  ];

  static List<Simple> get maritalStatus => [
    const Simple(id: "Married", title: "Married"),
    const Simple(id: "Unmarried", title: "Unmarried"),
    const Simple(id: "Others", title: "Others")
  ];
}