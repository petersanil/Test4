import 'dart:convert';

import 'package:aquaventure/buy_add_ons/event_states/buy_add_on_events.dart';
import 'package:aquaventure/buy_add_ons/event_states/buy_add_on_states.dart';
import 'package:aquaventure/buy_add_ons/models/buy_add_on_models.dart';
import 'package:aquaventure/buy_add_ons/repo/buy_add_on_repo.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/sharedprefrence/sharedprefrences.dart';
import 'package:aquaventure/utils/helper.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class BuyAddOnBloc extends Bloc<BuyAddOnEvent, BuyAddOnStates> {
  BuyAddOnRepo repo;
  List<BuyAddOnModels>? model;
  // int? orderId;

  BuyAddOnBloc({required this.repo}) : super(BuyAddOnInitialState()) {
    on<GetBuyAddOnEvent>((event, emit) async {
      if (model == null) {
        emit(BuyAddOnLoadingState());
      }
      try {
        model = await repo.getEntitlementsList();
        updateCartItems();
        emit(BuyAddOnSuccessfulState());
      } on AppException catch (e, stacktrace) {
        emit(BuyAddOnFailureState(errorMessage: e.message));
      } catch (e, stacktrace) {
        emit(BuyAddOnFailureState(errorMessage: e.toString()));
      }
    });

    on<HoldItemEvent>((event, emit) async {
      emit(HoldItemLoadingState());
      try {
        // event.models.isLoader = true;
        // final response = await repo.holdItems(
        //     model: event.models, quantity: event.quantity, orderId: orderId);
        // orderId = response;
        event.models.addedQuantity = event.models.addedQuantity + 1;
        event.models.isLoader = false;
        saveCartItems();
        emit(HoldItemSuccessfulState());
      } on AppException catch (e, stacktrace) {
        event.models.isLoader = false;
        emit(HoldItemFailedState(errorMessage: e.message));
      } catch (e, stacktrace) {
        event.models.isLoader = false;
        emit(HoldItemFailedState(errorMessage: e.toString()));
      }
    }, transformer: concurrent());

    on<UnholdItemEvent>((event, emit) async {
      emit(HoldItemLoadingState());

      try {
        // event.models.isLoader = true;
        // final response = await repo.unholdItems(
        //     model: event.models, quantity: event.quantity, orderId: orderId!);
        if (event.models.addedQuantity > 0) {
          event.models.addedQuantity = event.models.addedQuantity - 1;
        }
        event.models.isLoader = false;
        saveCartItems();
        emit(HoldItemSuccessfulState());
      } on AppException catch (e, stacktrace) {
        event.models.isLoader = false;
        emit(HoldItemFailedState(errorMessage: e.message));
      } catch (e, stacktrace) {
        event.models.isLoader = false;
        emit(HoldItemFailedState(errorMessage: e.toString()));
      }
    }, transformer: concurrent());
  }

  List<BuyAddOnModels> getItemsWithAddedQuantity() {
    return model!.where((item) => item.addedQuantity > 0).toList();
  }

  void saveCartItems() {
    final cartItems = getItemsWithAddedQuantity();
    final cartItemsMap = cartItems.map((e) => e.toCartJson()).toList();
    final cartItemsJson = jsonEncode(cartItemsMap);
    Helper.printLog("CartItems : $cartItemsJson");
    SharedprefUtils.setString(AppConstants.cartItems, cartItemsJson);
  }

  List<BuyAddOnModels> getCartItems() {
    final savedItems = SharedprefUtils.getString(AppConstants.cartItems);
    if (savedItems.isNotEmpty) {
      final savedItemsList = jsonDecode(savedItems) as List;
      final cartItems =
          savedItemsList.map((e) => BuyAddOnModels.fromJson(e)).toList();
      return cartItems;
    } else {
      return [];
    }
  }

  void updateCartItems() {
    final cartItems = getCartItems();
    if (cartItems.isNotEmpty) {
      for (var element in cartItems) {
        for (var item in model!) {
          if (item.plu == element.plu && item.status == "ENABLED") {
            item.addedQuantity = element.addedQuantity;
          }
        }
      }
    }
  }
}
