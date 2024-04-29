

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:info_popup/info_popup.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_images.dart';
import '../../core/custom_widgets/custom_loader.dart';
import '../../core/custom_widgets/custom_solid_buttom.dart';
import '../models/buy_add_on_models.dart';

class BuyAddOnListItems extends StatefulWidget{
  List<BuyAddOnModels> modelList;
  int index ;
  double total ;
  BuyAddOnModels models;
  Function(int,double) onAddItem;
  Function(int,double) onRemoveItem;

  BuyAddOnListItems(
      {Key? key,
        required this.modelList,
        required this.total,
        required this.index,
        required this.models,
        required this.onAddItem,
        required this.onRemoveItem})
      : super(key: key);

  @override
  State<BuyAddOnListItems> createState() => _BuyAddOnListItemsState();
}

class _BuyAddOnListItemsState extends State<BuyAddOnListItems> {

  int _itemQuantity = 0;
  String selectedItemText = "ADD ";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addOnImage(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                "${widget.models.name} ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                softWrap: true,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: AppColors.LOCKER_ITEM_COLOR,
                                    fontFamily: AppConstants.AVERTAPE_FONT,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InfoPopupWidget(
                              arrowTheme: const InfoPopupArrowTheme(
                                color: Colors.transparent,
                              ),
                              customContent: (){
                                return  showPopupWidget();
                              },
                              dismissTriggerBehavior:
                              PopupDismissTriggerBehavior.anyWhere,
                              child: const Icon(Icons.info,
                                color: AppColors.HEADER_TEXT_COLOR, size: 20,),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${widget.models.price.toStringAsFixed(2)} AED",
                        style: const TextStyle(
                            fontSize: 20,
                            color: AppColors.PRIMARY_COLOR,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (widget.models.status != "ENABLED")
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.4,
                          child: Text(
                            "Add-Ons are no longer available for purchase" ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.TEXT_GREY_COLOR,
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                      ///Locker size options
                      // if(widget.models.name.toLowerCase().contains("LOCKER".toLowerCase()))
                      //   GestureDetector(
                      //     onTap: (){
                      //       _showLockerOptions();
                      //     },
                      //     child: Text(
                      //     "Select Size ${widget.models.selectedSize} >",
                      //     style: const TextStyle(fontSize: 14,
                      //         color: AppColors.TEXT_GREY_COLOR,
                      //         fontWeight: FontWeight.bold),
                      // ),
                      //   ),
                    ],
                  ),
                ],
              ),

              if (widget.models.status != "ENABLED" && !widget.models.isLoader)
                GestureDetector(
                  onTap: () {
                    if (widget.models.status == "ENABLED") {
                      widget.onAddItem(widget.models.addedQuantity + 1,widget.models.price);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Container(
                      width: 80,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: widget.models.status == "ENABLED"
                              ? AppColors.SECONDARY_COLOR
                              : AppColors.DIVIDER_COLOR),

                      child: const Text(
                        "ADD",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              if (widget.models.status == "ENABLED" && !widget.models.isLoader)
                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        if(selectedItemText != "ADDED") {
                          widget.onAddItem(widget.models.addedQuantity + 1,
                              widget.models.price);
                          widget.models.addedQuantity = 1;
                        }
                        /*for (var i = 0; i < widget.modelList.length; i++) {

                          }*/
                        if(widget.models.status == "ENABLED") {
                          setState(() {
                            for (var i = 0; i <
                                widget.modelList.length; i++) {
                              if (i != widget.index) {
                                widget.modelList[i].status = "DISABLED";
                              }
                            }
                            _itemQuantity = 1;
                            selectedItemText = "ADDED";
                            widget.total = widget.models.price;
                          });
                        }
                        //print(widget.models.addedQuantity);
                      },
                      child: _itemQuantity == 1 ?
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Container(
                          width: 90,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 8),
                          decoration: selectedItemText == "ADDED"
                              ?BoxDecoration(
                              color: widget.models.status == "ENABLED" && _itemQuantity == 1
                                  ? AppColors.LOCKER_ICON_COLOR
                                  : AppColors.DIVIDER_COLOR,
                              borderRadius: BorderRadius.circular(9))
                              : BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: widget.models.status == "ENABLED"
                                  ? AppColors.SECONDARY_COLOR
                                  : AppColors.DIVIDER_COLOR),


                          child:  Text(
                            selectedItemText,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                          : Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: widget.models.status == "ENABLED"
                                  ? AppColors.SECONDARY_COLOR
                                  : AppColors.DIVIDER_COLOR),

                          child: const Text(
                            "ADD",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              /*Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        widget.models.addedQuantity.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.PRIMARY_COLOR),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          widget.onAddItem(widget.models.addedQuantity + 1);
                        },
                        child: Lottie.asset(AppImages.ADD_ICON)),
                  ],
                ),*/
              /*GestureDetector(
                onTap: () {
                  if (widget.models.status == "ENABLED") {
                    widget.onAddItem(widget.models.addedQuantity + 1);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      color: widget.models.status == "ENABLED"
                          ? AppColors.SECONDARY_COLOR
                          : AppColors.DIVIDER_COLOR),

                  child: const Text(
                    "ADD",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),*/
              if (widget.models.isLoader)
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CustomCircleLoader(
                    color: AppColors.PRIMARY_COLOR,
                  ),
                )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 15,right: 15),
            child: const Divider(
              color: AppColors.DIVIDER_COLOR,
            )),
      ],
    );
  }

  void _showLockerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Select Size',
                  style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              const Center(
                child: Text(
                  'Select the suitable size',
                  style: TextStyle(
                      color: AppColors.TEXT_GREY_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomSolidButton(
                buttonColor: AppColors.PRIMARY_COLOR,
                onTap: () {
                  widget.models.selectedSize = "SMALL";
                  widget.onAddItem(widget.models.addedQuantity + 1,widget.models.price);
                  Navigator.pop(context);
                },
                child: const Text(
                  'SMALL',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomSolidButton(
                buttonColor: AppColors.PRIMARY_COLOR,
                onTap: () {
                  widget.models.selectedSize = "MINI";
                  widget.onAddItem(widget.models.addedQuantity + 1,widget.models.price);
                  Navigator.pop(context);
                },
                child: const Text(
                  'MINI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomSolidButton(
                buttonColor: AppColors.PRIMARY_COLOR,
                onTap: () {
                  widget.models.selectedSize = "LARGE";
                  widget.onAddItem(widget.models.addedQuantity + 1,widget.models.price);
                  Navigator.pop(context);
                },
                child: const Text(
                  'LARGE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomSolidButton(
                onTap: () {
                  // Handle button 4 action
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text(
                  'CANCEL',
                  style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget addOnImage(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.DIVIDER_COLOR,style: BorderStyle.none)),
      child: Image.network(widget.models.iconUrl,
          width: 86,
          height: 86, errorBuilder: (_, error, stacktrace) {
            return Image.asset(
              width: 180,
              height: 180,
              AppImages.LOCKER_ITEM_ICON,
              fit: BoxFit.fill,
            );
            /*return const Icon(
              Icons.image,
              size: 86,
              color: Colors.grey,
            );*/
          }),
    );
  }
  Widget showPopupWidget(){
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.DIVIDER_COLOR)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.models.iconUrl,
              width: 24,
              height: 24, errorBuilder: (_, error, stacktrace) {
                return Image.asset(
                  width: 65,
                  height: 69,
                  AppImages.LOCKER_INFO_ICON,
                  fit: BoxFit.fill,
                );
              }),
          const SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
                text: widget.models.name,
                style: const TextStyle(
                    color: AppColors.LOCKER_ITEM_COLOR,
                    fontFamily: AppConstants.AVERTAPE_FONT,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: " : ${AppConstants.addOnsDescriptionsMap[widget.models.name] ?? "Buy Add-Ons"}",
                      style: TextStyle(
                          color: AppColors.TEXT_GREY_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ]),
          )
        ],
      ),
    );
  }


}
