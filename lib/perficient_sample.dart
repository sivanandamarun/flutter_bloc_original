// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mynyl/models/dashboard/dashboard_info_model.dart';
import 'package:mynyl/themes/nyl_colors.dart';
import 'package:mynyl/themes/nyl_typography.dart';
import 'package:mynyl/utils/constants/nyl_shadows.dart';
import 'package:mynyl/utils/helper/policy_number_masking_helper.dart';
import 'package:mynyl/views/dashboard/payment_center_carousel_footer_card.dart';
import 'package:mynyl/views/dashboard/payment_center_list_tile.dart';
import 'package:mynyl/widgets/base_stateless_widget.dart';
import 'package:mynyl/widgets/common/nyl_scrollable_body.dart';

class PaymentCenterCarouselCard extends BaseStatelessWidget {
  final ActiveContract activeContract;
  PaymentCenterCarouselCard({super.key, required this.activeContract});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: NYLColors.grey30, width: 1),
                gradient: NYLGradient.paymentCenterPaymentCardGradient,
                boxShadow: const [NYLBoxShadow.shadow5]),
            child: 
                // mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerSection,
                  Expanded(
                    child: NYLScrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [_content, CarouselFooterCard()]),
                      ),
                    ),
                  ),
                ])));
  }

  Widget get _content =>
      Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        ...activeContract.paymentExp.activePaymentTypes
            .map((e) => PaymentCenterListTile(eligiblePayment: e, activeContract: activeContract))
      ]);

  Widget get _headerSection => Container(
      height: 113,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 24, top: 8, bottom: 8),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: NYLColors.grey30))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [_policyNumber, _policyTitle]));

  Widget get _policyNumber => Padding(
      padding: const EdgeInsets.only(left: 0, top: 0),
      child: Row(children: [
        Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Text.rich(TextSpan(children: [
              WidgetSpan(
                  child: Transform.translate(
                      offset: const Offset(0, -4.0),
                      child: Text('⋯', style: NYLTypography.label1.copyWith(color: NYLColors.coolBlack))))
            ]))),
        Text(PolicyNumberHelper.lastFourDigits(activeContract.policyNumber!),
            key: const Key('txt_paymentCenterCarousel_slide[n]_policyNumber'), style: NYLTypography.body1)
      ]));

  Widget get _policyTitle => Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 0),
      child: Text(activeContract.planName ?? '',
          key: const Key('txt_paymentCenterCarousel_slide[n]_policyTitle'),
          style: NYLTypography.headline3.copyWith(color: NYLColors.coolBlack)));
}
