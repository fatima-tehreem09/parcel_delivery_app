import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../local/local_storage_repository.dart';
import 'dio_client.dart';

part 'api_interceptor.g.dart';

@riverpod
void authInterceptor(AuthInterceptorRef ref) {
  final token = ref.read(localDataProvider).accessToken ?? '';
  final dioClient = ref.read(dioClientProvider);
  if (token.isEmpty) {
    dioClient.options.headers.remove("Authorization");
  } else {
    dioClient.options.headers["Authorization"] = 'Bearer $token';
  }
}
