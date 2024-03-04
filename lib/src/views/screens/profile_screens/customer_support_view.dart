import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/views/widgets/buttons/dropdown_button.dart';
import 'package:pet_nations/src/views/widgets/scaffold/back_appbar.dart';
import 'package:pet_nations/src/views/widgets/fields/email_textfield.dart';
import 'package:pet_nations/src/views/widgets/fields/message_textfield.dart';
import 'package:pet_nations/src/views/widgets/fields/mobile_textfield.dart';
import 'package:pet_nations/src/views/widgets/fields/name_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerSupportView extends StatefulWidget {
  const CustomerSupportView({super.key});

  @override
  State<CustomerSupportView> createState() => _CustomerSupportViewState();
}

class _CustomerSupportViewState extends State<CustomerSupportView> {
  final theme = Get.textTheme;
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar('Customer Support'),
      body: Column(
        children: [
          NameField(controller: name),
          SizedBox(height: 1.5.h),
          EmailTextField(controller: email),
          SizedBox(height: 1.5.h),
          const CustomDropDown(
            items: [],
            value: null,
            hint: 'Subject',
            title: 'Subject',
          ),
          SizedBox(height: 1.5.h),
          MobileField(controller: phone),
          SizedBox(height: 1.5.h),
          MessageField(controller: message)
        ],
      ),
    );
  }
}
