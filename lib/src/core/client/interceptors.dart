// part of 'client.dart';
//
// /// An Auth interceptor file used by dio to keep trying netowrk calls again if it fails due to 401
// class AuthorizationInterceptor extends Interceptor {
//   AuthorizationInterceptor(this.ref);
//
//   final ProviderRef ref;
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // final token = ref.read(accessTokenProvider);
//
//     // if (token != null) {
//     //   debugPrint('ACCESS TOKEN\n$token');
//     //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
//     // }
//
//     super.onRequest(options, handler);
//   }
//
//   @override
//   Future<void> onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     if (err.response?.statusCode == HttpStatus.unauthorized) {
//       if (err.response?.statusCode == HttpStatus.unauthorized) {
//         try {
//           // final refresh = ref.refresh(accessTokenProvider);
//           debugPrint('401 ERROR \n$err');
//           // debugPrint(refresh.toString());
//           // await ref.read(accessTokenProvider.notifier).refreshToken();
//           // final token = ref.read(accessTokenProvider);
//
//           // if (token == null) {
//           //   handler.next(err);
//           // }
//
//           final requestOptions = err.response!.requestOptions;
//           // requestOptions.headers[HttpHeaders.authorizationHeader] =
//           //     'Bearer $token';
//           final options = Options(
//             method: requestOptions.method,
//             headers: requestOptions.headers,
//           );
//           final dioRefresh = Dio(BaseOptions(
//             baseUrl: requestOptions.baseUrl,
//             headers: <String, String>{
//               HttpHeaders.acceptHeader: 'application/json'
//             },
//           ));
//           final response = await dioRefresh.request<dynamic>(
//             requestOptions.path,
//             data: requestOptions.data,
//             queryParameters: requestOptions.queryParameters,
//             options: options,
//           );
//           return handler.resolve(response);
//         } catch (_) {
//           debugPrint('REFRESH ERROR :$_');
//         }
//       }
//       handler.next(err);
//     }
//   }
// }
part of 'client.dart';

/// An Auth interceptor file used by dio to retry network calls in case of 401 Unauthorized.
class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(this.ref);

  final ProviderRef ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = ref.read(accessTokenProvider);

    // if (token != null) {
    //   debugPrint('ACCESS TOKEN\n$token');
    //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // }

    super.onRequest(options, handler);
  }
  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // // Check if the error is due to unauthorized access (401)
    // if (err.response?.statusCode == HttpStatus.unauthorized) {
    //   debugPrint('401 ERROR \n$err');
    //
    //   // Try refreshing the token (assuming you have a refresh token mechanism in place)
    //   try {
    //     // Refresh token logic, assuming refreshToken() gets a new access token.
    //     await ref.read(accessTokenProvider.notifier).refreshToken();
    //
    //     // Retrieve the new token
    //     final newToken = ref.read(accessTokenProvider);
    //
    //     // If we can't get a new token, pass the error along
    //     if (newToken == null) {
    //       handler.next(err);
    //       return;
    //     }
    //
    //     // Clone the original request with the new token and retry it
    //     final requestOptions = err.response!.requestOptions;
    //     requestOptions.headers[HttpHeaders.authorizationHeader] = 'Bearer $newToken';
    //
    //     // Retry the request with updated token and options
    //     final response = await Dio().fetch<dynamic>(requestOptions);
    //
    //     // Resolve the error by returning the successful response
    //     return handler.resolve(response);
    //
    //   } catch (refreshError) {
    //     // If refreshing the token fails, log the error and pass it down the chain
    //     debugPrint('REFRESH ERROR: $refreshError');
    //   }
    // }

    // If it's not a 401 error or refresh fails, pass the error forward.
    // handler.next(err);
    handler.reject(err);

  }
}
