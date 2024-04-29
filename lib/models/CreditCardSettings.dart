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


/** This is an auto generated class representing the CreditCardSettings type in your schema. */
@immutable
class CreditCardSettings {
  final double? _cc_limit;
  final String? _pin;

  double get cc_limit {
    try {
      return _cc_limit!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get pin {
    try {
      return _pin!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const CreditCardSettings._internal({required cc_limit, required pin}): _cc_limit = cc_limit, _pin = pin;
  
  factory CreditCardSettings({required double cc_limit, required String pin}) {
    return CreditCardSettings._internal(
      cc_limit: cc_limit,
      pin: pin);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreditCardSettings &&
      _cc_limit == other._cc_limit &&
      _pin == other._pin;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CreditCardSettings {");
    buffer.write("cc_limit=" + (_cc_limit != null ? _cc_limit!.toString() : "null") + ", ");
    buffer.write("pin=" + "$_pin");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CreditCardSettings copyWith({double? cc_limit, String? pin}) {
    return CreditCardSettings._internal(
      cc_limit: cc_limit ?? this.cc_limit,
      pin: pin ?? this.pin);
  }
  
  CreditCardSettings.fromJson(Map<String, dynamic> json)  
    : _cc_limit = (json['cc_limit'] as num?)?.toDouble(),
      _pin = json['pin'];
  
  Map<String, dynamic> toJson() => {
    'cc_limit': _cc_limit, 'pin': _pin
  };
  
  Map<String, Object?> toMap() => {
    'cc_limit': _cc_limit, 'pin': _pin
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CreditCardSettings";
    modelSchemaDefinition.pluralName = "CreditCardSettings";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'cc_limit',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'pin',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}