import 'package:dio/dio.dart' show BaseOptions, Dio;
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kBaseUrl = "";

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
