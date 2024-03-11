import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/utils/constants/colors.dart';
import 'package:pet_nations/src/core/utils/constants/constant.dart';
import 'package:pet_nations/src/views/widgets/buttons/custom_button.dart';
import 'package:pet_nations/src/views/widgets/cards/service_card.dart';
import 'package:pet_nations/src/views/widgets/titles/title_1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetCommunityView extends StatefulWidget {
  const PetCommunityView({super.key});

  @override
  State<PetCommunityView> createState() => _PetCommunityViewState();
}

class _PetCommunityViewState extends State<PetCommunityView> {
  final theme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _img(),
          CustomButtonNew(
            margin: EdgeInsets.symmetric(vertical: 2.h),
            onTap: () {
              Get.toNamed<void>(AppRoutes.bookAppt);
            },
            text: 'Book Pet Grooming Appointment',
          ),
          _title('Dog Training Service'),
          SizedBox(height: 1.5.h),
          Text(
            "Welcome to Pet Nation's dog training service! At Pet Nation, we understand that your furry friend is more than just a pet; they are a member of your family. That's why we offer top-notch dog training services to help you and your four-legged friend develop a strong bond, improve communication, and enjoy a more fulfilling life together.\n\n Our dog training services are available to customers across Canada and the United States, and we offer a variety of training options to meet the unique needs of each pet and owner. Whether you're looking to teach your dog basic obedience, improve their behavior, or address specific issues, our certified trainers are here to help.\n\nWe understand that each dog is unique and may require a customized approach to training. That's why we offer personalized one-on-one training sessions to provide your dog with individual attention and tailored instruction. During these sessions, our certified trainers will work with you and your dog to identify specific problem areas and develop a training plan that addresses these issues. We use positive reinforcement techniques to train your dog, so you can be confident that they will enjoy the training process.\n\nIn addition to one-on-one training sessions, we also offer group training classes. These classes provide a great opportunity for your dog to socialize with other dogs and learn in a fun, supportive environment. Our group classes cover a range of topics, including obedience training, behavior modification, and puppy socialization.  At Pet Nation, we believe that dog training is an ongoing process. That's why we offer follow-up sessions to ensure that you and your dog are making progress and to address any new challenges that may arise. Our trainers are also available to provide ongoing support and advice to help you and your dog continue to grow and thrive.\n\nWhen you choose Pet Nation's dog training services, you can be confident that your dog is in good hands. Our trainers are certified by reputable organizations and have years of experience working with dogs of all breeds and ages. We are committed to providing a safe, supportive, and positive environment for you and your dog to learn and grow together.\n\nIn addition to our dog training services, Pet Nation offers a wide range of pet products and services to meet all of your pet's needs. From food and toys to grooming and veterinary care, we have everything you need to keep your furry friend healthy and happy.\n\nThank you for choosing Pet Nation for your dog training needs. We look forward to helping you and your dog develop a strong, loving bond that will last a lifetime.\n\nAt Pet Nation, we offer a variety of dog training classes to suit the needs and preferences of every pet owner. Here are some of the different types of training classes we offer: Canine Cadet Obedience Training Classes: These classes are designed to teach dogs basic commands such as sit, stay, come, and heel. Our certified trainers use positive reinforcement techniques to train your dog, which will help them develop good behavior and listening skills.\n\nTotal Duration - 6 weeks:\nWeek 1: Introduction to basic obedience commands (sit, stay, come, etc.) Week 2: Focus on leash manners and walking etiquette Week 3: Introduction to distractions and working through them Week 4: Advanced obedience training and off-leash work Week 5: Polishing up obedience commands and practicing in different environments Week 6: Graduation and evaluation",
            style: theme.titleLarge,
          ),
          TitleRow(onTap: () {}, title: 'Pet Services'),
          _petServices(),
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Text(text, style: theme.displaySmall);
  }

  Widget _petServices() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      height: 15.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constant.serviceSvg.length,
        itemBuilder: (context, index) {
          final obj = Constant.serviceSvg[index];
          return ServiceCard(
            img: obj['img'].toString(),
            title: obj['name'].toString(),
          );
        },
      ),
    );
  }

  Widget _img() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 100.w,
            height: 22.h,
            child: Image.network(
              'https://img.freepik.com/premium-photo/cartoon-character-with-glasses-laptop_7023-101048.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: CustomButtonNew(
            onTap: () {
              Get.toNamed<void>(AppRoutes.bookAppt);
            },
            width: 30.w,
            text: 'Book Appointment',
            style: theme.titleSmall
                ?.copyWith(color: AppColors.whiteColor, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
