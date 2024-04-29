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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the checkCCstatusResponse type in your schema. */
@immutable
class checkCCstatusResponse {
  final bool? _hasPin;
  final bool? _hasCreditCard;

  bool? get hasPin {
    return _hasPin;
  }
  
  bool? get hasCreditCard {
    return _hasCreditCard;
  }
  
  const checkCCstatusResponse._internal({hasPin, hasCreditCard}): _hasPin = hasPin, _hasCreditCard = hasCreditCard;
  
  factory checkCCstatusResponse({bool? hasPin, bool? hasCreditCard}) {
    return checkCCstatusResponse._internal(
      hasPin: hasPin,
      hasCreditCard: hasCreditCard);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is checkCCstatusResponse &&
      _hasPin == other._hasPin &&
      _hasCreditCard == other._hasCreditCard;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("checkCCstatusResponse {");
    buffer.write("hasPin=" + (_hasPin != null ? _hasPin!.toString() : "null") + ", ");
    buffer.write("hasCreditCard=" + (_hasCreditCard != null ? _hasCreditCard!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  checkCCstatusResponse copyWith({bool? hasPin, bool? hasCreditCard}) {
    return checkCCstatusResponse._internal(
      hasPin: hasPin ?? this.hasPin,
      hasCreditCard: hasCreditCard ?? this.hasCreditCard);
  }
  
  checkCCstatusResponse.fromJson(Map<String, dynamic> json)  
    : _hasPin = json['hasPin'],
      _hasCreditCard = json['hasCreditCard'];
  
  Map<String, dynamic> toJson() => {
    'hasPin': _hasPin, 'hasCreditCard': _hasCreditCard
  };
  
  Map<String, Object?> toMap() => {
    'hasPin': _hasPin, 'hasCreditCard': _hasCreditCard
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "checkCCstatusResponse";
    modelSchemaDefinition.pluralName = "checkCCstatusResponses";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'hasPin',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'hasCreditCard',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}