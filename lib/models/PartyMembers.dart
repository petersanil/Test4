/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the PartyMembers type in your schema. */
@immutable
class PartyMembers extends Model {
  static const classType = const _PartyMembersModelType();
  final String id;
  final CreditCardSettings? _cc_info;
  final String? _cc_limit;
  final Visits? _visits;
  final String? _partyMembersVisitsVisit_id;
  final String? _profile_pic;
  final String? _name;
  final Profiles? _profile;
  final bool? _cc_shared;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  PartyMembersModelIdentifier get modelIdentifier {
    return PartyMembersModelIdentifier(id: id);
  }

  CreditCardSettings? get cc_info {
    return _cc_info;
  }

  String? get cc_limit {
    return _cc_limit;
  }

  Visits? get visits {
    return _visits;
  }

  String? get partyMembersVisitsVisit_id {
    return _partyMembersVisitsVisit_id;
  }

  String? get profile_pic {
    return _profile_pic;
  }

  bool? get cc_shared {
    return _cc_shared;
  }

  String get name {
    try {
      return _name!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  Profiles? get profile {
    return _profile;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const PartyMembers._internal(
      {required this.id,
      cc_info,
      cc_limit,
      visits,
      partyMembersVisitsVisit_id,
      profile_pic,
      required name,
      profile,
      createdAt,
      cc_shared,
      updatedAt})
      : _cc_info = cc_info,
        _cc_limit = cc_limit,
        _visits = visits,
        _partyMembersVisitsVisit_id = partyMembersVisitsVisit_id,
        _profile_pic = profile_pic,
        _name = name,
        _profile = profile,
        _createdAt = createdAt,
        _cc_shared = cc_shared,
        _updatedAt = updatedAt;

  factory PartyMembers(
      {String? id,
      CreditCardSettings? cc_info,
      Visits? visits,
      String? partyMembersVisitsVisit_id,
      String? profile_pic,
      required String name,
      bool? cc_shared,
      Profiles? profile}) {
    return PartyMembers._internal(
        id: id == null ? UUID.getUUID() : id,
        cc_info: cc_info,
        visits: visits,
        partyMembersVisitsVisit_id: partyMembersVisitsVisit_id,
        profile_pic: profile_pic,
        name: name,
        cc_shared: cc_shared,
        profile: profile);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PartyMembers &&
        id == other.id &&
        _cc_info == other._cc_info &&
        _cc_limit == other._cc_limit &&
        _visits == other._visits &&
        _partyMembersVisitsVisit_id == other._partyMembersVisitsVisit_id &&
        _profile_pic == other._profile_pic &&
        _name == other._name &&
        _cc_shared == other._cc_shared &&
        _profile == other._profile;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("PartyMembers {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "cc_info=" + (_cc_info != null ? _cc_info!.toString() : "null") + ", ");
    buffer.write("cc_limit=" + "$_cc_limit" + ", ");
    buffer.write(
        "partyMembersVisitsVisit_id=" + "$_partyMembersVisitsVisit_id" + ", ");
    buffer.write("profile_pic=" + "$_profile_pic" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("cc_shared=" +
        (_cc_shared != null ? _cc_shared!.toString() : "null") +
        ", ");
    buffer.write(
        "profile=" + (_profile != null ? _profile!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  PartyMembers copyWith(
      {CreditCardSettings? cc_info,
      String? cc_limit,
      Visits? visits,
      String? partyMembersVisitsVisit_id,
      String? profile_pic,
      String? name,
      bool? cc_shared,
      Profiles? profile}) {
    return PartyMembers._internal(
        id: id,
        cc_info: cc_info ?? this.cc_info,
        cc_limit: cc_limit ?? this.cc_limit,
        visits: visits ?? this.visits,
        partyMembersVisitsVisit_id:
            partyMembersVisitsVisit_id ?? this.partyMembersVisitsVisit_id,
        profile_pic: profile_pic ?? this.profile_pic,
        name: name ?? this.name,
        cc_shared: cc_shared ?? this.cc_shared,
        profile: profile ?? this.profile);
  }

  PartyMembers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _cc_info = json['cc_info'] != null
            ? CreditCardSettings.fromJson(
                new Map<String, dynamic>.from(json['cc_info']))
            : null,
        _cc_limit = json['cc_limit'],
        _visits = json['visits']?['serializedData'] != null
            ? Visits.fromJson(
                new Map<String, dynamic>.from(json['visits']['serializedData']))
            : null,
        _partyMembersVisitsVisit_id = json['partyMembersVisitsVisit_id'],
        _profile_pic = json['profile_pic'],
        _name = json['name'],
        _cc_shared = json['cc_shared'],
        _profile = json['profile']?['serializedData'] != null
            ? Profiles.fromJson(new Map<String, dynamic>.from(
                json['profile']['serializedData']))
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'cc_info': _cc_info?.toJson(),
        'cc_limit': _cc_limit,
        'visits': _visits?.toJson(),
        'partyMembersVisitsVisit_id': _partyMembersVisitsVisit_id,
        'profile_pic': _profile_pic,
        'name': _name,
        'profile': _profile?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format(),
        'cc_shared': _cc_shared
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'cc_info': _cc_info,
        'cc_limit': _cc_limit,
        'visits': _visits,
        'partyMembersVisitsVisit_id': _partyMembersVisitsVisit_id,
        'profile_pic': _profile_pic,
        'name': _name,
        'cc_shared': _cc_shared,
        'profile': _profile,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final QueryModelIdentifier<PartyMembersModelIdentifier>
      MODEL_IDENTIFIER = QueryModelIdentifier<PartyMembersModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CC_INFO = QueryField(fieldName: "cc_info");
  static final QueryField VISITS = QueryField(
      fieldName: "visits",
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Visits'));
  static final QueryField PARTYMEMBERSVISITSVISIT_ID =
      QueryField(fieldName: "partyMembersVisitsVisit_id");
  static final QueryField PROFILE_PIC = QueryField(fieldName: "profile_pic");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PROFILE = QueryField(
      fieldName: "profile",
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Profiles'));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PartyMembers";
    modelSchemaDefinition.pluralName = "PartyMembers";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PRIVATE, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.indexes = [
      ModelIndex(
          fields: const ["partyMembersVisitsVisit_id"], name: "byVisitId"),
      ModelIndex(fields: const ["owner"], name: "byProfiles")
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'cc_info',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'CreditCardSettings')));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        key: PartyMembers.VISITS,
        isRequired: false,
        ofModelName: 'Visits',
        associatedKey: Visits.VISIT_ID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PartyMembers.PARTYMEMBERSVISITSVISIT_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PartyMembers.PROFILE_PIC,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PartyMembers.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: PartyMembers.PROFILE,
        isRequired: false,
        targetNames: ['owner'],
        ofModelName: 'Profiles'));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _PartyMembersModelType extends ModelType<PartyMembers> {
  const _PartyMembersModelType();

  @override
  PartyMembers fromJson(Map<String, dynamic> jsonData) {
    return PartyMembers.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'PartyMembers';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PartyMembers] in your schema.
 */
@immutable
class PartyMembersModelIdentifier implements ModelIdentifier<PartyMembers> {
  final String id;

  /** Create an instance of PartyMembersModelIdentifier using [id] the primary key. */
  const PartyMembersModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'PartyMembersModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is PartyMembersModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
