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

import 'package:aquaventure/models/EntitlemetOutPut.dart';

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the EntitlementWrapped type in your schema. */
class EntitlementWrapped {
  final List<EntitlemetOutPut>? _userEntitlements;
  final List<EntitlemetOutPut>? _partyEntitlements;

  List<EntitlemetOutPut>? get userEntitlements {
    return _userEntitlements;
  }
  
  List<EntitlemetOutPut>? get partyEntitlements {
    return _partyEntitlements;
  }
  
  const EntitlementWrapped._internal({userEntitlements, partyEntitlements}): _userEntitlements = userEntitlements, _partyEntitlements = partyEntitlements;
  
  factory EntitlementWrapped({List<EntitlemetOutPut>? userEntitlements, List<EntitlemetOutPut>? partyEntitlements}) {
    return EntitlementWrapped._internal(
      userEntitlements: userEntitlements != null ? List<EntitlemetOutPut>.unmodifiable(userEntitlements) : userEntitlements,
      partyEntitlements: partyEntitlements != null ? List<EntitlemetOutPut>.unmodifiable(partyEntitlements) : partyEntitlements);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntitlementWrapped &&
      DeepCollectionEquality().equals(_userEntitlements, other._userEntitlements) &&
      DeepCollectionEquality().equals(_partyEntitlements, other._partyEntitlements);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EntitlementWrapped {");
    buffer.write("userEntitlements=" + (_userEntitlements != null ? _userEntitlements!.toString() : "null") + ", ");
    buffer.write("partyEntitlements=" + (_partyEntitlements != null ? _partyEntitlements!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EntitlementWrapped copyWith({List<EntitlemetOutPut>? userEntitlements, List<EntitlemetOutPut>? partyEntitlements}) {
    return EntitlementWrapped._internal(
      userEntitlements: userEntitlements ?? this.userEntitlements,
      partyEntitlements: partyEntitlements ?? this.partyEntitlements);
  }

  
  EntitlementWrapped.fromJson(Map<String, dynamic> json)  
    : _userEntitlements = json['userEntitlements'] is List
        ? (json['userEntitlements'] as List)
          .where((e) => e != null)
          .map((e) => EntitlemetOutPut.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _partyEntitlements = json['partyEntitlements'] is List
        ? (json['partyEntitlements'] as List)
          .where((e) => e != null)
          .map((e) => EntitlemetOutPut.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'userEntitlements': _userEntitlements?.map((EntitlemetOutPut? e) => e?.toJson()).toList(), 'partyEntitlements': _partyEntitlements?.map((EntitlemetOutPut? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'userEntitlements': _userEntitlements,
    'partyEntitlements': _partyEntitlements
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EntitlementWrapped";
    modelSchemaDefinition.pluralName = "EntitlementWrappeds";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'userEntitlements',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'EntitlemetOutPut')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'partyEntitlements',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'EntitlemetOutPut')
    ));
  });
}