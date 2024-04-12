// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:quick_glimpse/application/otp_bloc/otp_bloc.dart';
import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class UsingPhone extends StatelessWidget {
  const UsingPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final phonenumberController = TextEditingController();
    bool isReq = false;
    return BlocBuilder<OtpBloc, OtpState>(
      builder: (context, state) {
        if (state is OtpInitial) {
          isReq = false;
        }
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: isReq
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PinCodeFields(
                        length: 6,
                        fieldBorderStyle: FieldBorderStyle.square,
                        fieldHeight: 60,
                        borderWidth: 1.0,
                        activeBorderColor: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                        textStyle: const TextStyle(
                            color: Colors.black,
                            // fontFamily: CustomFont.textFont,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                        keyboardType: TextInputType.number,
                        onComplete: (value) {
                          // BlocProvider.of<OtpNumberAuthPageBloc>(context)
                          //     .add(OtpNumberAuthPageEvent.setOtp(otp: value));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      customButton(
                        isRow: false,
                        onTap: () {},
                        textsize: 16,
                        borderclr: Colors.transparent,
                        color: Colors.black,
                        height: 50,
                        radius: 20,
                        width: 170,
                        textclr: Colors.white,
                        name: 'Get Otp',
                      ),
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
                              hintText: 'Enter Your Number',
                              controller: phonenumberController),
                          SizedBox(
                            height: 20,
                          ),
                          customButton(
                            isRow: false,
                            onTap: () {
                              BlocProvider.of<OtpBloc>(context).add(
                                  SendOtpPhoneEvent(phone: '+918943514279'));
                              // await FirebaseAuth.instance.verifyPhoneNumber(
                              //     verificationCompleted:
                              //         (PhoneAuthCredential credential) {},
                              //     verificationFailed:
                              //         (FirebaseAuthException exception) {},
                              //     codeSent: (String verificationId,
                              //         int? resendtoken) {
                              //       print(verificationId.toString());
                              //       print(
                              //           '=================done=====================');
                              //     },
                              //     codeAutoRetrievalTimeout:
                              //         (String verificationId) {},
                              //     phoneNumber:
                              //         phonenumberController.text.toString());
                            },
                            textsize: 16,
                            borderclr: Colors.transparent,
                            color: Colors.black,
                            height: 50,
                            radius: 20,
                            width: 170,
                            textclr: Colors.white,
                            name: 'Get Otp',
                          ),
                        ]),
                  ),
          ),
        );
      },
    );
  }
}
