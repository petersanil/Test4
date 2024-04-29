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


/** This is an auto generated class representing the Amount type in your schema. */
@immutable
class Amount {
  final String? _currency;
  final int? _value;

  String? get currency {
    return _currency;
  }
  
  int? get value {
    return _value;
  }
  
  const Amount._internal({currency, value}): _currency = currency, _value = value;
  
  factory Amount({String? currency, int? value}) {
    return Amount._internal(
      currency: currency,
      value: value);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Amount &&
      _currency == other._currency &&
      _value == other._value;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Amount {");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Amount copyWith({String? currency, int? value}) {
    return Amount._internal(
      currency: currency ?? this.currency,
      value: value ?? this.value);
  }
  
  Amount.fromJson(Map<String, dynamic> json)  
    : _currency = json['currency'],
      _value = (json['value'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'currency': _currency, 'value': _value
  };
  
  Map<String, Object?> toMap() => {
    'currency': _currency, 'value': _value
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Amount";
    modelSchemaDefinition.pluralName = "Amounts";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'currency',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'value',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}