// import 'package:abiola_along_client_app/src/core/local/local_storage_repository.dart';
// import 'package:abiola_along_client_app/src/modals/card_modal.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'add_card_provider.g.dart';
//
// @Riverpod()
// class AddCard with _$AddCard {
//   @override
//   void build(CardModal modal) {
//     addCardMethod(modal);
//   }
//
//   Future<void> addCardMethod(CardModal modal) async {
//     final card = CardModal(
//       cardNumber: modal.cardNumber,
//       cardHolderName: modal.cardHolderName,
//       cardExpiryDate: modal.cardExpiryDate,
//       cardCvv: modal.cardCvv,
//     );
//     ref.read(localDataProvider).saveUserCard(card);
//     ref.read(localDataProvider);
//   }
// }
