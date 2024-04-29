import 'package:aquaventure/constants/app_constants.dart';
import 'package:launchdarkly_flutter_client_sdk/launchdarkly_flutter_client_sdk.dart';

mixin GetFlagsStatus {
  Future<bool> getFlagsStatus({required String flagName}) async {
    LDEvaluationDetail status =
        await LDClient.boolVariationDetail(flagName, false);
    return status.value as bool;
  }
}
