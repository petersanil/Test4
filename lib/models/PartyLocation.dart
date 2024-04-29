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

import 'package:aquaventure/models/Coordinates.dart';
import 'package:aquaventure/models/FindMyFiendStatus.dart';

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the PartyLocation type in your schema. */
class PartyLocation {
  final String id;
  final String? _name;
  final FindMyFiendStatus? _status;
  final String? _location;
  final Coordinates? _coordinates;

  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  FindMyFiendStatus? get status {
    return _status;
  }
  
  String? get location {
    return _location;
  }
  
  Coordinates? get coordinates {
    return _coordinates;
  }
  
  const PartyLocation._internal({required this.id, required name, status, location, coordinates}): _name = name, _status = status, _location = location, _coordinates = coordinates;
  
  factory PartyLocation({String? id, required String name, FindMyFiendStatus? status, String? location, Coordinates? coordinates}) {
    return PartyLocation._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      status: status,
      location: location,
      coordinates: coordinates);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PartyLocation &&
      id == other.id &&
      _name == other._name &&
      _status == other._status &&
      _location == other._location &&
      _coordinates == other._coordinates;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PartyLocation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("coordinates=" + (_coordinates != null ? _coordinates!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PartyLocation copyWith({String? id, String? name, FindMyFiendStatus? status, String? location, Coordinates? coordinates}) {
    return PartyLocation._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      location: location ?? this.location,
      coordinates: coordinates ?? this.coordinates);
  }

  PartyLocation.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _status = amplify_core.enumFromString<FindMyFiendStatus>(json['status'], FindMyFiendStatus.values),
      _location = json['location'],
      _coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(new Map<String, dynamic>.from(json['coordinates']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'status': amplify_core.enumToString(_status), 'location': _location, 'coordinates': _coordinates?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'status': _status,
    'location': _location,
    'coordinates': _coordinates
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PartyLocation";
    modelSchemaDefinition.pluralName = "PartyLocations";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'location',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'coordinates',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Coordinates')
    ));
  });
}