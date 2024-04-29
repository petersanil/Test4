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
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the EntitlemetOutPut type in your schema. */
class EntitlemetOutPut {
  final String? _attachmentType;
  final String? _description;
  final String id;
  final int? _gid;
  final String? _entitlementType;
  final String? _created;
  final String? _expirationDate;
  final bool? _isRedeemed;
  final String? _redemeed_date;
  final int? _redeemed_by;
  final String? _redeemed_location;

  String? get attachmentType {
    return _attachmentType;
  }
  
  String? get description {
    return _description;
  }
  
  int? get gid {
    return _gid;
  }
  
  String? get entitlementType {
    return _entitlementType;
  }
  
  String? get created {
    return _created;
  }
  
  String? get expirationDate {
    return _expirationDate;
  }
  
  bool? get isRedeemed {
    return _isRedeemed;
  }
  
  String? get redemeed_date {
    return _redemeed_date;
  }
  
  int? get redeemed_by {
    return _redeemed_by;
  }
  
  String? get redeemed_location {
    return _redeemed_location;
  }
  
  const EntitlemetOutPut._internal({attachmentType, description,required this.id, gid, entitlementType, created, expirationDate, isRedeemed, redemeed_date, redeemed_by, redeemed_location}): _attachmentType = attachmentType, _description = description, _gid = gid, _entitlementType = entitlementType, _created = created, _expirationDate = expirationDate, _isRedeemed = isRedeemed, _redemeed_date = redemeed_date, _redeemed_by = redeemed_by, _redeemed_location = redeemed_location;
  
  factory EntitlemetOutPut({String? attachmentType, String? description, String? id, int? gid, String? entitlementType, String? created, String? expirationDate, bool? isRedeemed, String? redemeed_date, int? redeemed_by, String? redeemed_location}) {
    return EntitlemetOutPut._internal(
      attachmentType: attachmentType,
      description: description,
      id: id == null ? amplify_core.UUID.getUUID() : id,
      gid: gid,
      entitlementType: entitlementType,
      created: created,
      expirationDate: expirationDate,
      isRedeemed: isRedeemed,
      redemeed_date: redemeed_date,
      redeemed_by: redeemed_by,
      redeemed_location: redeemed_location);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntitlemetOutPut &&
      _attachmentType == other._attachmentType &&
      _description == other._description &&
      id == other.id &&
      _gid == other._gid &&
      _entitlementType == other._entitlementType &&
      _created == other._created &&
      _expirationDate == other._expirationDate &&
      _isRedeemed == other._isRedeemed &&
      _redemeed_date == other._redemeed_date &&
      _redeemed_by == other._redeemed_by &&
      _redeemed_location == other._redeemed_location;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EntitlemetOutPut {");
    buffer.write("attachmentType=" + "$_attachmentType" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("gid=" + (_gid != null ? _gid!.toString() : "null") + ", ");
    buffer.write("entitlementType=" + "$_entitlementType" + ", ");
    buffer.write("created=" + "$_created" + ", ");
    buffer.write("expirationDate=" + "$_expirationDate" + ", ");
    buffer.write("isRedeemed=" + (_isRedeemed != null ? _isRedeemed!.toString() : "null") + ", ");
    buffer.write("redemeed_date=" + "$_redemeed_date" + ", ");
    buffer.write("redeemed_by=" + (_redeemed_by != null ? _redeemed_by!.toString() : "null") + ", ");
    buffer.write("redeemed_location=" + "$_redeemed_location");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EntitlemetOutPut copyWith({String? attachmentType, String? description, String? id, int? gid, String? entitlementType, String? created, String? expirationDate, bool? isRedeemed, String? redemeed_date, int? redeemed_by, String? redeemed_location}) {
    return EntitlemetOutPut._internal(
      attachmentType: attachmentType ?? this.attachmentType,
      description: description ?? this.description,
      id: id ?? this.id,
      gid: gid ?? this.gid,
      entitlementType: entitlementType ?? this.entitlementType,
      created: created ?? this.created,
      expirationDate: expirationDate ?? this.expirationDate,
      isRedeemed: isRedeemed ?? this.isRedeemed,
      redemeed_date: redemeed_date ?? this.redemeed_date,
      redeemed_by: redeemed_by ?? this.redeemed_by,
      redeemed_location: redeemed_location ?? this.redeemed_location);
  }

  
  EntitlemetOutPut.fromJson(Map<String, dynamic> json)  
    : _attachmentType = json['attachmentType'],
      _description = json['description'],
      id = json['id'],
      _gid = (json['gid'] as num?)?.toInt(),
      _entitlementType = json['entitlementType'],
      _created = json['created'],
      _expirationDate = json['expirationDate'],
      _isRedeemed = json['isRedeemed'],
      _redemeed_date = json['redemeed_date'],
      _redeemed_by = (json['redeemed_by'] as num?)?.toInt(),
      _redeemed_location = json['redeemed_location'];
  
  Map<String, dynamic> toJson() => {
    'attachmentType': _attachmentType, 'description': _description, 'id': id, 'gid': _gid, 'entitlementType': _entitlementType, 'created': _created, 'expirationDate': _expirationDate, 'isRedeemed': _isRedeemed, 'redemeed_date': _redemeed_date, 'redeemed_by': _redeemed_by, 'redeemed_location': _redeemed_location
  };
  
  Map<String, Object?> toMap() => {
    'attachmentType': _attachmentType,
    'description': _description,
    'id': id,
    'gid': _gid,
    'entitlementType': _entitlementType,
    'created': _created,
    'expirationDate': _expirationDate,
    'isRedeemed': _isRedeemed,
    'redemeed_date': _redemeed_date,
    'redeemed_by': _redeemed_by,
    'redeemed_location': _redeemed_location
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EntitlemetOutPut";
    modelSchemaDefinition.pluralName = "EntitlemetOutPuts";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'attachmentType',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'description',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'gid',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'entitlementType',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'created',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'expirationDate',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'isRedeemed',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'redemeed_date',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'redeemed_by',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'redeemed_location',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}