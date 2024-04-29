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
import 'HomeBanner.dart';
import 'PartyMembers.dart';
import 'Profiles.dart';
import 'Transactions.dart';
import 'Visits.dart';
import 'WaitTimes.dart';
import 'AddPArtyMemberResponseDto.dart';
import 'Amount.dart';
import 'CreditCardSettings.dart';
import 'DeleteAccountResponse.dart';
import 'LinkSharedCCResponse.dart';
import 'LinkWristBandResponse.dart';
import 'ParentalConsent.dart';
import 'PersonalCreditCardSettings.dart';
import 'ReferenceDto.dart';
import 'SessionData.dart';
import 'SetUsersPinResponse.dart';
import 'TransactionStatus.dart';
import 'checkCCstatusResponse.dart';
import 'deleteCCInfoResponseDto.dart';

export 'AddPArtyMemberResponseDto.dart';
export 'Amount.dart';
export 'CreditCardSettings.dart';
export 'DeleteAccountResponse.dart';
export 'HomeBanner.dart';
export 'LinkSharedCCReasonEnum.dart';
export 'LinkSharedCCResponse.dart';
export 'LinkWristBandResponse.dart';
export 'ParentalConsent.dart';
export 'PartyMemberStatus.dart';
export 'PartyMembers.dart';
export 'PersonalCreditCardSettings.dart';
export 'ProfileGenderEnum.dart';
export 'Profiles.dart';
export 'ReferenceDto.dart';
export 'SessionData.dart';
export 'SetUsersPinResponse.dart';
export 'TransactionStatus.dart';
export 'Transactions.dart';
export 'TransactionsStatus.dart';
export 'VisitStatusEnum.dart';
export 'Visits.dart';
export 'WaitStatus.dart';
export 'WaitTimes.dart';
export 'checkCCstatusResponse.dart';
export 'deleteCCInfoResponseDto.dart';
export 'setUsersResponseEnum.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "9cab81a3b39babb82efee9a0016e4619";
  @override
  List<ModelSchema> modelSchemas = [HomeBanner.schema, PartyMembers.schema, Profiles.schema, Transactions.schema, Visits.schema, WaitTimes.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [AddPArtyMemberResponseDto.schema, Amount.schema, CreditCardSettings.schema, DeleteAccountResponse.schema, LinkSharedCCResponse.schema, LinkWristBandResponse.schema, ParentalConsent.schema, PersonalCreditCardSettings.schema, ReferenceDto.schema, SessionData.schema, SetUsersPinResponse.schema, TransactionStatus.schema, checkCCstatusResponse.schema, deleteCCInfoResponseDto.schema];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "HomeBanner":
        return HomeBanner.classType;
      case "PartyMembers":
        return PartyMembers.classType;
      case "Profiles":
        return Profiles.classType;
      case "Transactions":
        return Transactions.classType;
      case "Visits":
        return Visits.classType;
      case "WaitTimes":
        return WaitTimes.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}