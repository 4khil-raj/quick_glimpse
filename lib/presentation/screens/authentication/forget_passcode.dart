import 'package:flutter/material.dart';
import 'package:quick_glimpse/infrastructure/repository/forget_password/forget_passcoderepo.dart';

import 'package:quick_glimpse/presentation/widgets/button.dart';
import 'package:quick_glimpse/presentation/widgets/form_field.dart';

class ForgetPasscode extends StatelessWidget {
  ForgetPasscode({super.key});
  final forgetEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Forget Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text('Quick Glimpse'),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Enter Email',
                controller: forgetEmailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24,
              ),
              customButton(
                isRow: false,
                color: Colors.black,
                name: 'Get Link',
                height: 50,
                onTap: () {
                  ForgetPasscodeRepo().forgetpasscode(
                      context, forgetEmailController.text.toString());
                },
                radius: 20,
                textsize: 14,
                borderclr: Colors.transparent,
                textclr: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
