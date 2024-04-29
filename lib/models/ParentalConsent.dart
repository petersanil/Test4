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


/** This is an auto generated class representing the ParentalConsent type in your schema. */
@immutable
class ParentalConsent {
  final String? _parent_name;
  final String? _email;
  final String? _phone;
  final bool? _consent_requested;
  final bool? _consent_granted;

  String? get parent_name {
    return _parent_name;
  }
  
  String? get email {
    return _email;
  }
  
  String? get phone {
    return _phone;
  }
  
  bool? get consent_requested {
    return _consent_requested;
  }
  
  bool? get consent_granted {
    return _consent_granted;
  }
  
  const ParentalConsent._internal({parent_name, email, phone, consent_requested, consent_granted}): _parent_name = parent_name, _email = email, _phone = phone, _consent_requested = consent_requested, _consent_granted = consent_granted;
  
  factory ParentalConsent({String? parent_name, String? email, String? phone, bool? consent_requested, bool? consent_granted}) {
    return ParentalConsent._internal(
      parent_name: parent_name,
      email: email,
      phone: phone,
      consent_requested: consent_requested,
      consent_granted: consent_granted);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParentalConsent &&
      _parent_name == other._parent_name &&
      _email == other._email &&
      _phone == other._phone &&
      _consent_requested == other._consent_requested &&
      _consent_granted == other._consent_granted;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ParentalConsent {");
    buffer.write("parent_name=" + "$_parent_name" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("consent_requested=" + (_consent_requested != null ? _consent_requested!.toString() : "null") + ", ");
    buffer.write("consent_granted=" + (_consent_granted != null ? _consent_granted!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ParentalConsent copyWith({String? parent_name, String? email, String? phone, bool? consent_requested, bool? consent_granted}) {
    return ParentalConsent._internal(
      parent_name: parent_name ?? this.parent_name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      consent_requested: consent_requested ?? this.consent_requested,
      consent_granted: consent_granted ?? this.consent_granted);
  }
  
  ParentalConsent.fromJson(Map<String, dynamic> json)  
    : _parent_name = json['parent_name'],
      _email = json['email'],
      _phone = json['phone'],
      _consent_requested = json['consent_requested'],
      _consent_granted = json['consent_granted'];
  
  Map<String, dynamic> toJson() => {
    'parent_name': _parent_name, 'email': _email, 'phone': _phone, 'consent_requested': _consent_requested, 'consent_granted': _consent_granted
  };
  
  Map<String, Object?> toMap() => {
    'parent_name': _parent_name, 'email': _email, 'phone': _phone, 'consent_requested': _consent_requested, 'consent_granted': _consent_granted
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ParentalConsent";
    modelSchemaDefinition.pluralName = "ParentalConsents";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'parent_name',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'email',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'phone',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'consent_requested',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'consent_granted',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}