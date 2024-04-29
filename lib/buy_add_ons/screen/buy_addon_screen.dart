


import 'dart:ui';


import 'package:aquaventure/buy_add_ons/repo/buy_add_on_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_images.dart';
import '../../core/custom_widgets/custom_app_bar.dart';
import '../../core/custom_widgets/custom_loader.dart';
import '../../payments/bloc/payments_bloc.dart';
import '../../payments/repo/payments_repo.dart';
import '../../payments/screen/payments_screen.dart';
import '../../utils/helper.dart';
import '../bloc/buy_add_on_bloc.dart';
import '../event_states/buy_add_on_events.dart';
import '../event_states/buy_add_on_states.dart';
import '../items/buy_add_on_list_items.dart';
import '../models/buy_add_on_models.dart';


class BuyAddOnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuyAddOnBloc>(
        create: (context) => BuyAddOnBloc(repo: BuyAddOnRepo()),
        child: AddOnScreen());
  }
}

class AddOnScreen extends StatefulWidget {
  const AddOnScreen({Key? key}) : super(key: key);

  @override
  State<AddOnScreen> createState() => _AddOnScreenState();
}

class _AddOnScreenState extends State<AddOnScreen> {
  int currentIndex = -1;
  late TextEditingController controller;
  late BuyAddOnModels model;
  double totalValue = 0.0;


  @override
  initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
    //initializeNetworkListener();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Purchase",
        ),
        /*bottomSheet: summaryWidget(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,*/
        body: getBlocBuilder());
  }

  Widget summaryWidget() => Column(
      children: [
        if(totalValue > 0.0)
        Container(
          // width: MediaQuery.of(context).size.width,
          //  margin: EdgeInsets.only(right: 10, left: 10),
            height: 80,
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
            decoration:
            const BoxDecoration(color: AppColors.BACKGROUND_BLUE_COLOR),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Total",
                    style: TextStyle(
                        color: AppColors.TEXT_GREY_COLOR,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${totalValue.toStringAsFixed(2)} AED",
                  style:  TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
        if(totalValue > 0.0)
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 85,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(9.0),
                  side: BorderSide(
                      width: 1,
                      color: Colors.transparent),
                ),
                backgroundColor:
                totalValue > 0.0 ? AppColors.PRIMARY_COLOR
                    : AppColors.BUTTON_DISABLED_COLOR,
              ),
              onPressed: () async {
                if (totalValue <= 0) {
                  Helper.showSnackbar(
                      context: context, message: "Please place an order first");
                  return;
                }
                final result =
                await Navigator.of(context).push(CupertinoPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => PaymentsBloc(
                          repo: PaymentsRepo(),
                          model: BlocProvider.of<BuyAddOnBloc>(context)
                              .getItemsWithAddedQuantity()),
                      child: PaymentScreen(
                        totalAmount: totalValue,
                      ),
                    )));
                //calculateTotalCartValue();
              },
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3,
                        fontSize: 22),
                  ),
                )
        )

      ],
    );

  Widget getBlocBuilder() {
    return BlocConsumer<BuyAddOnBloc, BuyAddOnStates>(builder: (_, state) {
      Helper.printLog(state.toString());
      if (state is BuyAddOnInitialState) {
        BlocProvider.of<BuyAddOnBloc>(context).add(GetBuyAddOnEvent());
        return CustomCircleLoader(
          color: AppColors.PRIMARY_COLOR,
        );
      } else if (state is BuyAddOnLoadingState) {
        return CustomCircleLoader(
          color: AppColors.PRIMARY_COLOR,
        );
      } else if (state is BuyAddOnSuccessfulState) {
        return scaffoldBody();
      } else if (state is HoldItemLoadingState) {
        return scaffoldBody();
      } else if (state is HoldItemSuccessfulState) {
        return scaffoldBody();
      } else if (state is HoldItemFailedState) {
        return scaffoldBody();
      } else if (state is BuyAddOnFailureState) {
        return Center(
          child: Text(
            state.errorMessage,
            style: const TextStyle(
                color: AppColors.PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        );
      }
      return CustomCircleLoader(
        color: AppColors.PRIMARY_COLOR,
      );
    }, listener: (_, state) {
      if (state is BuyAddOnFailureState) {
        Helper.showSnackbar(context: context, message: state.errorMessage);
      } else if (state is BuyAddOnSuccessfulState) {
        //calculateTotalCartValue();
      } else if (state is HoldItemFailedState) {
        context.loaderOverlay.hide();
        Helper.showSnackbar(context: context, message: state.errorMessage);
      } else if (state is HoldItemSuccessfulState) {
        //calculateTotalCartValue();
        context.loaderOverlay.hide();
      } else if (state is HoldItemLoadingState) {
        // context.loaderOverlay.show();
      }
    });
  }

  Widget scaffoldBody() {
    BuyAddOnModels model1 = BuyAddOnModels(currency: "c",eventId: 1,iconUrl: "c",name: "Locker Large",plu: "c",price: 90.0,sectionId: 1,status: "DISABLED",statusDescription: "Add-Ons are no longer available for purchase",addedQuantity: 0,selectedSize: "c",isLoader: false);
    BuyAddOnModels model2 = BuyAddOnModels(currency: "c",eventId: 1,iconUrl: "c",name: "Locker Small",plu: "c",price: 65.0,sectionId: 1,status: "ENABLED",statusDescription: "c",addedQuantity: 1,selectedSize: "c",isLoader: false);
    BuyAddOnModels model3 = BuyAddOnModels(currency: "c",eventId: 1,iconUrl: "c",name: "Locker Mini",plu: "c",price: 35.0,sectionId: 1,status: "DISABLED",statusDescription: "c",addedQuantity: 0,selectedSize: "c",isLoader: false);
    List<BuyAddOnModels>? model = BlocProvider.of<BuyAddOnBloc>(context).model;
    List<BuyAddOnModels> lockerModel = [];
    for(int i =0;i<model!.length;i++){
      if(model[i].name.startsWith("Locker")){
       lockerModel.add(model[i]);
      }
    }
    model = lockerModel;

    if (model.isEmpty) {
      return noAddOnWidget();
    } else {
      //return noAddOnWidget();
      return Column(
        children: [
          Expanded(child: ListView(
            // physics: RangeMaintainingScrollPhysics(),
            children: [
              const Padding(
                padding: EdgeInsets.only( top: 0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Entitlements Available",
                  style: TextStyle(
                      color: AppColors.LOCKER_ITEM_COLOR,
                      fontWeight: FontWeight.normal,
                      fontFamily: AppConstants.AVERTAPE_FONT,
                      letterSpacing: 1.2,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(padding: EdgeInsets.only(left: 15,right: 15),
                  child: const Divider(
                    color: AppColors.DIVIDER_COLOR,
                  )),
              showEntitlements(model),
              //summaryWidget(),
            ],
          )),
          summaryWidget()
        ],
      );

    }
  }

  Widget showEntitlements(List<BuyAddOnModels> itemList) {

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 15, bottom: 200),
        itemCount: itemList.length,
        itemBuilder: (_, index) {
          BuyAddOnModels model = itemList[index];
          return BuyAddOnListItems(
              modelList: itemList,
              total: totalValue,
              index: index,
              models: model,
              onAddItem: (int quantity,double price) {
                totalValue = totalValue+price;
                controller.text = "${totalValue.toStringAsFixed(2)} AED";
              },
              onRemoveItem: (int quantity,double price) {

              }
          );
        });
  }

  Widget noAddOnWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppImages.NO_ADD_ON_IMAGE,
          width: 86,
          height: 100,
        ),
        const Center(
          child: Text(
            "No Add-ons available",
            style: TextStyle(
                color: AppColors.PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Add-ons are available for purchase at any Guest Services kiosk, or through the mobile app by tapping the ‘Purchase Add-Ons’ button below..",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.TEXT_GREY_COLOR,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  /*void calculateTotalCartValue() {
    List<BuyAddOnModels> itemList =
    BlocProvider.of<BuyAddOnBloc>(context).model!;
    totalValue =
        itemList.fold(0, (total, item) => total + item.getTotalValue());
    setState(() {});
  }*/

}


