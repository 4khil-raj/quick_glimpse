// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:quick_glimpse/application/otp_bloc/otp_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/custom_navigator.dart';
import 'package:quick_glimpse/domain/validations/formfield_validation.dart';
import 'package:quick_glimpse/presentation/screens/bottom_nav/bottom_nav.dart';

import 'package:quick_glimpse/presentation/screens/profile_build/user_profile.dart';
import 'package:quick_glimpse/presentation/widgets/alert_box.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';
import 'package:timer_button/timer_button.dart';

class UsingPhone extends StatelessWidget {
  const UsingPhone({super.key});
  @override
  Widget build(BuildContext context) {
    final phonenumberController = TextEditingController();
    final otpController = TextEditingController();
    var id;
    bool isReq = false;
    return BlocBuilder<OtpBloc, OtpState>(builder: (context, state) {
      if (state is OtpInitialState) {
        isReq = false;
      }
      if (state is PhoneAuthCodeSentSuccess) {
        id = state.verificationId;
        isReq = true;
      } else if (state is OtpScreenErrorState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          alerts(context, state.error);
        });
      }
      if (state is OtpLoadedState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          customNavRemoveuntil(
              context,
              ProfileBuild(
                usingSignup: false,
              ));
        });
      }
      if (state is OtpDonegotoHome) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          customNavRemoveuntil(context, BottomNavigation());
        });
      }
      return Scaffold(
          appBar: AppBar(
            title: Text('Enter Otp'),
          ),
          body: Center(
            child: isReq
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PinCodeFields(
                              controller: otpController,
                              length: 6,
                              fieldBorderStyle: FieldBorderStyle.square,
                              fieldHeight: 60,
                              borderWidth: 1.0,
                              activeBorderColor: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              keyboardType: TextInputType.number,
                              onComplete: (value) {
                                BlocProvider.of<OtpBloc>(context).add(
                                    VerifySentOtp(
                                        otpCode: otpController.text,
                                        verificationId: id));
                              })),
                      SizedBox(
                        height: 10,
                      ),
                      TimerButton(
                        label: "Resend Otp",
                        timeOutInSeconds: 26,
                        onPressed: () {
                          BlocProvider.of<OtpBloc>(context).add(
                              SendOtpPhoneEvent(
                                  phone: '+91'.trim() +
                                      phonenumberController.text.trim()));
                        },
                        buttonType: ButtonType.outlinedButton,
                        disabledColor: Colors.black,
                        color: Colors.green,
                        activeTextStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        disabledTextStyle: const TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${phonenumberController.text} the number is worng.?'),
                          TextButton(
                              onPressed: () {
                                BlocProvider.of<OtpBloc>(context)
                                    .add(OtpinitialEvent());
                              },
                              child: Text('Change'))
                        ],
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LogIn With Phone',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              validator: Validations.phoneValidator,
                              keyboardType: TextInputType.phone,
                              hintText: 'Enter Your Number',
                              controller: phonenumberController),
                          SizedBox(
                            height: 20,
                          ),
                          customButton(
                            isRow: false,
                            onTap: () {
                              BlocProvider.of<OtpBloc>(context).add(
                                  SendOtpPhoneEvent(
                                      phone: '+91'.trim() +
                                          phonenumberController.text.trim()));
                            },
                            textsize: 16,
                            borderclr: Colors.transparent,
                            color: Colors.black,
                            height: 50,
                            radius: 20,
                            width: 170,
                            textclr: Colors.white,
                            name: 'Get Otp',
                          )
                        ])),
          ));
    });
  }
}
