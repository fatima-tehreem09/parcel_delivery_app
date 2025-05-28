import 'package:dio/dio.dart' show BaseOptions, Dio;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// const kBaseUrl = 'https://apisurgemate.wespark.co/api/v1/';
const kBaseUrl =
    'https://surgemate-backend-170522911236.asia-south1.run.app/api/v1/';

final dioClientProvider = Provider(
  (ref) => Dio(
    BaseOptions(
      headers: {"Content-Type": "application/json"},
      baseUrl: kBaseUrl,
      connectTimeout: const Duration(seconds: 120000),
      receiveTimeout: const Duration(seconds: 120000),
    ),
  ),
);
