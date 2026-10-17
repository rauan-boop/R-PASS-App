import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/config/app_config.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EarchBlacklistCall {
  static Future<ApiCallResponse> call({
    String? searchTerm = '',
    required String companyId,
  }) async {
    final ffApiRequestBody = '''
{
 "search_term": "${escapeStringForJson(searchTerm)}",
 "p_company_id": "${escapeStringForJson(companyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'earchBlacklist',
      apiUrl: '${AppConfig.restUrl}/rpc/search_blacklist',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': 'Bearer ${AppConfig.supabaseAnonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewAdminCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? username = '',
    String? phone = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "username": "${escapeStringForJson(username)}",
  "phone": "${escapeStringForJson(phone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createNewAdmin',
      apiUrl: '${AppConfig.functionsUrl}/create-new-admin',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewManagerCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? username = '',
    String? phone = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "username": "${escapeStringForJson(username)}",
  "phone": "${escapeStringForJson(phone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createNewManager',
      apiUrl: '${AppConfig.functionsUrl}/create-new-manager',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBlacklistCountCall {
  static Future<ApiCallResponse> call({
    required String companyId,
  }) async {
    final ffApiRequestBody = '''
{
"p_company_id": "${escapeStringForJson(companyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBlacklistCount',
      apiUrl: '${AppConfig.restUrl}/rpc/get_blacklist_count_by_company',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': 'Bearer ${AppConfig.supabaseAnonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ExtendSubscriptionCall {
  static Future<ApiCallResponse> call({
    String? companyId = '',
  }) async {
    final ffApiRequestBody = '''
{
"company_id_to_extend": "${escapeStringForJson(companyId)}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'extendSubscription',
      apiUrl: '${AppConfig.restUrl}/rpc/extend_company_subscription',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': 'Bearer ${AppConfig.supabaseAnonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCompaniesCountCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCompaniesCount',
      apiUrl: '${AppConfig.restUrl}/rpc/get_companies_count',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': 'Bearer ${AppConfig.supabaseAnonKey}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRecentBlacklistCountCall {
  static Future<ApiCallResponse> call({
    required String companyId,
  }) async {
    final ffApiRequestBody = '''
{
"p_company_id": "${escapeStringForJson(companyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRecentBlacklistCount',
      apiUrl: '${AppConfig.restUrl}/rpc/get_recent_blacklist_count_by_company',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': 'Bearer ${AppConfig.supabaseAnonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRecentCountByCompanyCall {
  static Future<ApiCallResponse> call({
    String? companyId = '',
  }) async {
    final ffApiRequestBody = '''
{
"p_company_id": "${escapeStringForJson(companyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRecentCountByCompany',
      apiUrl:
          '${AppConfig.restUrl}/rpc/get_recent_blacklist_count_by_company',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': 'Bearer ${AppConfig.supabaseAnonKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSignedUrlCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? userId = '',
    String? agreementText = '',
    String? surname = '',
    String? name = '',
    String? iin = '',
    String? fileName = '',
  }) async {
    final ffApiRequestBody = '''
{
 "agreementText": "${escapeStringForJson(agreementText)}",
"surname": "${escapeStringForJson(surname)}",
"name": "${escapeStringForJson(name)}",
"iin": "${escapeStringForJson(iin)}",
"fileName": "${escapeStringForJson(fileName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getSignedUrl',
      apiUrl: '${AppConfig.functionsUrl}/generate-save-pdf',
      callType: ApiCallType.POST,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': '${authToken}',
        'x-user-id': userId,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyIPAddressCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMyIPAddress',
      apiUrl: AppConfig.ipAddressApiUrl,
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
