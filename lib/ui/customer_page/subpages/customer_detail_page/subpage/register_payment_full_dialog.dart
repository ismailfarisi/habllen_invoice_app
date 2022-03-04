import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:habllen/shared/widgets/date_field_widget.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:habllen/ui/customer_page/subpages/customer_detail_page/subpage/bloc/registerpayment_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RegisterPaymentFullDialog extends StatelessWidget {
  const RegisterPaymentFullDialog({Key? key}) : super(key: key);

  static const String routeName = 'register_payment_full_dialog';

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterpaymentBloc, RegisterpaymentState>(
      listener: (context, state) {
        if (context.loaderOverlay.visible) {
          context.loaderOverlay.hide();
        }
        context.pop();
      },
      listenWhen: (previous, current) =>
          current.status == FormzStatus.submissionSuccess,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                context.loaderOverlay.show();
                context
                    .read<RegisterpaymentBloc>()
                    .add(RegisterpaymentEvent.submitPressed());
              },
              child: Text("save"),
            )
          ],
        ),
        body: Column(
          children: [
            VerticalBigSpace(),
            CustomDateField(
              onDateSelected: (date) {
                if (date != null) {
                  context
                      .read<RegisterpaymentBloc>()
                      .add(RegisterpaymentEvent.dateChanged(date: date));
                }
              },
            ),
            CustomTextField(
              helperText: "Amount",
              initialValue: context
                  .read<RegisterpaymentBloc>()
                  .state
                  .amount
                  .value
                  .toString(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                context
                    .read<RegisterpaymentBloc>()
                    .add(RegisterpaymentEvent.amountChanged(amount: value));
              },
            ),
            CustomTextField(
              helperText: "Remarks",
              onChanged: (value) {
                context
                    .read<RegisterpaymentBloc>()
                    .add(RegisterpaymentEvent.remarksChanged(remarks: value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
