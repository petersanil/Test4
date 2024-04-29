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


/** This is an auto generated class representing the LinkSharedCCResponse type in your schema. */
@immutable
class LinkSharedCCResponse {
  final String? _status;
  final LinkSharedCCReasonEnum? _reason;

  String? get status {
    return _status;
  }

  LinkSharedCCReasonEnum? get reason {
    return _reason;
  }
  
  const LinkSharedCCResponse._internal({status, reason}): _status = status, _reason = reason;
  
  factory LinkSharedCCResponse({String? status, LinkSharedCCReasonEnum? reason}) {
    return LinkSharedCCResponse._internal(
      status: status,
      reason: reason);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkSharedCCResponse &&
      _status == other._status &&
      _reason == other._reason;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LinkSharedCCResponse {");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("reason=" + (_reason != null ? enumToString(_reason)! : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LinkSharedCCResponse copyWith({String? status, LinkSharedCCReasonEnum? reason}) {
    return LinkSharedCCResponse._internal(
      status: status ?? this.status,
      reason: reason ?? this.reason);
  }
  
  LinkSharedCCResponse.fromJson(Map<String, dynamic> json)  
    : _status = json['status'],
      _reason = enumFromString<LinkSharedCCReasonEnum>(json['reason'], LinkSharedCCReasonEnum.values);
  
  Map<String, dynamic> toJson() => {
    'status': _status, 'reason': enumToString(_reason)
  };
  
  Map<String, Object?> toMap() => {
    'status': _status, 'reason': _reason
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LinkSharedCCResponse";
    modelSchemaDefinition.pluralName = "LinkSharedCCResponses";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'reason',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
  });
}