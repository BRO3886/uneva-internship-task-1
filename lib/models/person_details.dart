// To parse this JSON data, do
//
//     final personDetails = personDetailsFromJson(jsonString);

import 'dart:convert';

PersonDetails personDetailsFromJson(String str) => PersonDetails.fromJson(json.decode(str));

String personDetailsToJson(PersonDetails data) => json.encode(data.toJson());

class PersonDetails {
    String personFullName;
    String personGender;
    String personPic;
    String personAge;
    String personPhone;
    String personPid;
    String personRelation;
    String personAddress;
    dynamic personOccupation;
    String personCaption;
    int pk;

    PersonDetails({
        this.personFullName,
        this.personGender,
        this.personPic,
        this.personAge,
        this.personPhone,
        this.personPid,
        this.personRelation,
        this.personAddress,
        this.personOccupation,
        this.personCaption,
        this.pk,
    });

    factory PersonDetails.fromJson(Map<String, dynamic> json) => PersonDetails(
        personFullName: json["person_full_name"],
        personGender: json["person_gender"],
        personPic: json["person_pic"],
        personAge: json["person_age"],
        personPhone: json["person_phone"],
        personPid: json["person_pid"],
        personRelation: json["person_relation"],
        personAddress: json["person_address"],
        personOccupation: json["person_occupation"],
        personCaption: json["person_caption"],
        pk: json["_pk"],
    );

    Map<String, dynamic> toJson() => {
        "person_full_name": personFullName,
        "person_gender": personGender,
        "person_pic": personPic,
        "person_age": personAge,
        "person_phone": personPhone,
        "person_pid": personPid,
        "person_relation": personRelation,
        "person_address": personAddress,
        "person_occupation": personOccupation,
        "person_caption": personCaption,
        "_pk": pk,
    };
}
