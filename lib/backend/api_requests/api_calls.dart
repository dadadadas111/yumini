import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeminiCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    dynamic messagesJson,
    String? systemMessage = '',
  }) async {
    final messages = _serializeJson(messagesJson);
    final ffApiRequestBody = '''
{
  "system_instruction": {
    "parts": [
      {
        "text": "${systemMessage}"
      }
    ]
  },
  "contents": ${messages},
  "safetySettings": [
    {
      "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
      "threshold": "BLOCK_ONLY_HIGH"
    }
  ],
  "generationConfig": {
    "stopSequences": [
      "Title"
    ],
    "temperature": 1.0,
    "maxOutputTokens": 800,
    "topP": 0.8,
    "topK": 10
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Gemini',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-8b:streamGenerateContent?alt=sse&key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  static String? segment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
  static String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.role''',
      ));
}

class GptCall {
  static Future<ApiCallResponse> call({
    String? apiKey =
        'aint no way you see this',
    dynamic messagesJson,
    String? sysMessage = '',
  }) async {
    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "system_instruction": {
    "parts": {
      "text": "${sysMessage}"
    }
  },
  "model": "gpt-3.5-turbo",
  "messages": ${messages},
  "safetySettings": [
    {
      "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
      "threshold": "BLOCK_ONLY_HIGH"
    }
  ],
  "generationConfig": {
    "stopSequences": [
      "Title"
    ],
    "temperature": 1.0,
    "maxOutputTokens": 800,
    "topP": 0.8,
    "topK": 10
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GPT',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'surprise mother fucker',
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
  if (item is DocumentReference) {
    return item.path;
  }
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
