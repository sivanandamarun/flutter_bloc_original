// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mynyl/models/dashboard/dashboard_card_model.dart';
import 'package:mynyl/models/dashboard/dashboard_info_model.dart';
import 'package:mynyl/models/dashboard/payment_eligibility_model.dart';
import 'package:mynyl/models/dashboard/payment_experience_model.dart';
import 'package:mynyl/models/policy_detail/payment_tractsaction_model.dart';
import 'package:mynyl/services/analytics_service.dart';
import 'package:mynyl/themes/nyl_colors.dart';
import 'package:mynyl/themes/nyl_typography.dart';
import 'package:mynyl/utils/accessibility_utils.dart';
import 'package:mynyl/utils/constants/app_images_constants.dart';
import 'package:mynyl/utils/constants/nyl_global_constants.dart';
import 'package:mynyl/utils/enums/payment_enum.dart';
import 'package:mynyl/utils/helper/payment_bloc_helper.dart';
import 'package:mynyl/utils/helper/post_login_bloc_helper.dart';
import 'package:mynyl/viewmodels/payment/one_time_payment_viewmodel.dart';
import 'package:mynyl/viewmodels/payment/payment_review_viewmodel.dart';
import 'package:mynyl/viewmodels/payment/select_payment_viewmodel.dart';
import 'package:mynyl/viewmodels/payment/select_payment_vul_viewmodel.dart';
import 'package:mynyl/viewmodels/pre_login/pre_login_base_cubit.dart';
import 'package:mynyl/views/payment/step1_select_payment_view.dart';
import 'package:mynyl/views/payment/step2_choose_payment_method_view.dart';
import 'package:mynyl/views/payment/step3_payment_review_view.dart';
import 'package:mynyl/widgets/base_stateless_widget.dart';
import 'package:mynyl/widgets/common/nyl_dialog.dart';
import 'package:mynyl/widgets/common/nyl_scrollable_body.dart';
import 'package:mynyl/widgets/payment/nyl_payment_app_bar.dart';
import 'package:mynyl/widgets/payment/swipe_button_widget.dart';
import 'package:mynyl/widgets/payment/total_payment_footer_widget.dart';
import 'package:mynyl/widgets/payment/payment_header.dart';

class OneTimePaymentView extends BaseStatelessWidget {
  final String policyNumber;
  final EligiblePayment eligiblePayment;
  OneTimePaymentView({super.key, required this.policyNumber, required this.eligiblePayment});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        handleBackButton(context);
        return Future<bool>.value(false);
      },
      child: Scaffold(
          appBar: _appBar(context),
          bottomNavigationBar: BlocBuilder<OneTimePaymentViewModel, OneTimePaymentState>(
            builder: (context, state) {
              return switch (activeStep) {
                PaymentStep.step1SelectPayment => _stickyFooter(
                    PaymentsBlocHelper.instance.getInstance(PaymentStep.step1SelectPayment, eligiblePayment)),
                PaymentStep.step2ChoosePayment => _stickyFooter(
                    PaymentsBlocHelper.instance.getInstance(PaymentStep.step2ChoosePayment, eligiblePayment)),
                PaymentStep.step3PaymentReview => _stickyFooter(
                    PaymentsBlocHelper.instance.getInstance(PaymentStep.step3PaymentReview, eligiblePayment)),
                _ => const SizedBox()
              };
            },
            buildWhen: (previous, current) {
              return previous != current;
            },
          ),
          body: BlocBuilder<OneTimePaymentViewModel, OneTimePaymentState>(buildWhen: (previous, current) {
            return previous != current;
          }, builder: (context, state) {
            if (state.step == PaymentStep.none) {
              return Container();
            }
            return BlocProvider<PreLoginBaseCubit>.value(
                value: PaymentsBlocHelper.instance.getInstance(activeStep, eligiblePayment),
                child: NYLScrollableBody(
                  bottomOffset: 118,
                  child: Container(
                      color: state.step == PaymentStep.step2ChoosePayment ? Colors.white : NYLColors.grey10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [..._stepPageHeader, _getStepView],
                      )),
                ));
          })),
    );
  }

  List<Widget> get _stepPageHeader => [
        PaymentHeader(
                policyName: activeContract.planName!,
                policyNumber: activeContract.formattedPolicyNumber,
                policyNumberSemanticsLabel: AccessibilityUtils.spellOutOnlyDigits(activeContract.formattedPolicyNumber),
                showRoundedCorner: true)
            .withKey('{$keyString}_nav_header'),
        Container(
          color: NYLColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _pageHeading,
          ),
        ),
      ];

  get _pageHeading {
    if (viewModel.state.step == PaymentStep.step1SelectPayment &&
        eligiblePayment.type == EligiblePaymentType.ONE_TIME_PAYMENT_VAR) {
      return BlocBuilder<PreLoginBaseCubit<PreLoginBaseState>, PreLoginBaseState>(
          bloc: PaymentsBlocHelper.instance.selectPaymentViewModel,
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Text(
                state is SelectPaymentLoaded
                    ? PaymentsBlocHelper.instance.selectPaymentViewModel.pageHeader
                    : eligiblePayment.type.heading,
                key: Key('txt_{$keyString}_title'),
                style: NYLTypography.headline4Effra);
          });
    }

    return Text(
        viewModel.state.step == PaymentStep.step1SelectPayment ? eligiblePayment.type.heading : activeStep.heading,
        key: Key('txt_{$keyString}_title'),
        style: NYLTypography.headline4Effra);
  }

  ActiveContract get activeContract => PostLoginBlocHelper.instance.dashboardViewModel.contractByNumber(policyNumber);
  OneTimePaymentViewModel get viewModel => PostLoginBlocHelper.instance.oneTimePaymentViewModel;
  PaymentStep get activeStep => viewModel.state.step;

  _appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(kMinInteractiveDimension),
        child: BlocBuilder<OneTimePaymentViewModel, OneTimePaymentState>(builder: (context, state) {
          return NYLPaymentAppBar(
            title: 'Make a Payment',
            key: Key('${keyString}_app_bar'),
            onBackButtonPressed: () {
              handleBackButton(context);
            },
            onCloseButtonPressed: () {
              navigateToInitial(context);
            },
          );
        }, buildWhen: (previous, current) {
          return previous != current;
        }));
  }

  navigateToInitial(BuildContext context) {
    showSimpleDialog(NYLDialog.stacked(
            title: AppLocalizations.of(context)!.are_you_sure_want_to_exit,
            content: AppLocalizations.of(context)!.if_leave_now_this_payment_will_not_be_completed,
            icon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  AppImagesConstants.ICN_WARNING,
                  key: const Key('icn_warning'),
                )),
            primaryAction: CardButtonActionModel(displayText: AppLocalizations.of(context)!.no),
            secondaryAction: CardButtonActionModel(displayText: AppLocalizations.of(context)!.yes_exit),
            automationId: '${keyString}_exitDialog'))
        .then((value) {
      if (value == NYLGlobalConstants.RESULT_CANCEL) {
        viewModel.goto(PaymentStep.none);
        GoRouter.of(context).pop();
      }
    });
  }

  _stickyFooter(activeStepModel) {
    return BlocBuilder<PreLoginBaseCubit<PreLoginBaseState>, PreLoginBaseState>(
        bloc: activeStepModel,
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is PaymentReviewState) {
            return SwipePaySlider(
                maxwidth: MediaQuery.of(context).size.width,
                amount: PaymentsBlocHelper.instance.selectPaymentViewModel.totalPaymentAmountAsString,
                automationId: 'oneTimePayment_step3_premiumLife_slideToPay',
                onSwipeComplete: () => _paymentSubmission(context, activeStepModel as PaymentReviewViewModel));
          }
          return TotalPaymentBottomBarWidget(
            paymentAmt: PaymentsBlocHelper.instance.selectPaymentViewModel.totalPaymentAmountAsString,
            isContinueEnabled: activeStepModel.canContinueNext,
            onContinueButtonPressed:
                activeStepModel.canContinueNext ? () => _onContinueButtonTapped(activeStepModel) : null,
          ).withKey('{$keyString}_${activeStep.name}_sticky_footer');
        });
  }

  void _onContinueButtonTapped(dynamic activeStepModel) async {
    if (activeStep != PaymentStep.step1SelectPayment) {
      viewModel.next();
      return;
    }
    final model = activeStepModel as SelectPaymentViewModel;
    await model.validatePaymnetAmount(policyNumber).then((res) {
      if (res.$2 == true) viewModel.next();
    });
  }

  _paymentSubmission(BuildContext context, PaymentReviewViewModel model) async {
    await PaymentsBlocHelper.instance.choosePaymentViewModel.getSubmitPaymentRequest().then((request) async {
      await model.submitPayment(policyNumber, request).then((res) {
        if (res.$2 == true) {
          viewModel.goto(PaymentStep.none);
          PostLoginBlocHelper.instance.disposeInstance('oneTimePayment');
          GoRouter.of(context).pop();
          PaymentsBlocHelper.instance.disposeAll();
          var eligiblity = eligiblePayment.eligibilitymodel;
          switch (eligiblePayment.type) {
            case EligiblePaymentType.ONE_TIME_PAYMENT_VAR:
              eligiblity = (eligiblity as PaymentEligibility).copyWith(eligible: false);
              break;
            default:
              eligiblity = (eligiblity as PaymentEligibilityModel).copyWith(payEligible: false, pendingEligible: true);
              break;
          }

          var eligibleP = eligiblePayment.copyWith(eligibilitymodel: eligiblity, pendingModel: res.$1.pendingModel);
          PostLoginBlocHelper.instance.dashboardViewModel.updatePaymentInfo(eligibleP, policyNumber);

          if (GoRouter.of(context).routerDelegate.currentConfiguration.fullPath.contains('policyDetails')) {
            GoRouter.of(context)
                .go('/dashboard/policyDetails/$policyNumber/pendingPayment/$policyNumber', extra: eligibleP);
          } else {
            GoRouter.of(context).go('/dashboard/pendingPayment/$policyNumber', extra: eligibleP);
          }
        }
      });
    });
  }

  Widget get _getStepView {
    AnalyticsService.trackScreen(viewModel.state.screenName);
    return switch (activeStep) {
      PaymentStep.step1SelectPayment =>
        Step1SelectPaymentView(policyNumber: policyNumber).withKey('{$keyString}_${activeStep.name}'),
      PaymentStep.step2ChoosePayment =>
        Step2ChoosePaymentMethodView(policyNumber: policyNumber).withKey('{$keyString}_${activeStep.name}'),
      PaymentStep.step3PaymentReview =>
        Step3PaymentReviewView(policyNumber: policyNumber).withKey('{$keyString}_${activeStep.name}'),
      _ => Container()
    };
  }

  void handleBackButton(context) {
    PaymentsBlocHelper.instance.disposeInstance(viewModel.state.step);
    viewModel.state.step == PaymentStep.step1SelectPayment
        ? navigateToInitial(context)
        : viewModel.goto(PaymentsBlocHelper.instance.previousStep);
  }
}
