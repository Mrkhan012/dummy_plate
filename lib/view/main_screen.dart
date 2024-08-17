import 'package:craft_plate/constants/app_decoration.dart';
import 'package:craft_plate/constants/images.dart';
import 'package:craft_plate/constants/text.dart';
import 'package:craft_plate/widget/cutom_continer.dart';
import 'package:craft_plate/widget/meal_box_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/theme.dart';
import '../controller/home_controller.dart';
import '../widget/Dashed_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.greetingText,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width * 0.060,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.currentLocationText,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: Get.width * 0.044,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 24,
                    color: Color(0xFF6318AF),
                  ),
                  Text(
                    AppStrings.locationName,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: Get.width * 0.048,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    CupertinoIcons.chevron_down,
                    size: 24,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      SvgPicture.asset(
                        AppImages.iconSvg,
                        height: 24,
                        width: 24,
                      ),
                      const Text(AppStrings.howItWorksText),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              CustomContainer(
                height: Get.height * 0.2,
                width: Get.width * 1,
                color: Colors.deepPurple,
                borderRadius: 20.0,
                border: Border.all(color: Colors.white, width: 2.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.enjoyFirstOrderText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DashedBorderText(
                            text: 'FIRSTPLATE01',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppImages.cookingSvg,
                        height: Get.height * 0.14,
                        width: Get.width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.startCraftingText,
                style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: Get.width * 0.055,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF242628)),
              ),
              const SizedBox(height: 8),
              CustomContainer(
                height: Get.height * 0.2,
                width: Get.width * 1,
                color: const Color(0xFFFDFAEC),
                borderRadius: 20.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Delivery Box',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: Get.width * 0.048,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF242628)),
                            ),
                          ),
                          const Wrap(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(0xFF935A10),
                              ),
                              Text(
                                'Min 10 - Max 120',
                                style: TextStyle(color: Color(0xFF935A10)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              backgroundColor: const Color(0xFFDD8E18),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 18.0),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  AppStrings.seeAllButtonText,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppImages.clipImage,
                      width: Get.width * 0.48,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: Get.height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.meals.length,
                  itemBuilder: (context, index) {
                    return buildMealBox(
                        controller.meals[index]['name'],
                        controller.meals[index]['guests'],
                        controller.meals[index]['image']);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    'Choose Your Platter', // Static text
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400], // Divider color
                      thickness: 1, // Divider thickness
                      indent: 8, // Indent divider to align with text
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.cateringMenusHeaderText,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: Get.width * 0.044,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppStrings.cateringMenusMinText,
                    style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: Get.width * 0.040,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.moreText,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: Get.width * 0.045,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _buildDishPlate(controller),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.mealsub,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: Get.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppStrings.mealtext,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: Get.width * 0.028,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.moreText,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: Get.width * 0.045,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: Get.height * 0.2,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Adjust as per your need for multiple items
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              8.0), // Adjust horizontal spacing between items
                      child: Stack(
                        children: [
                          Container(
                            height: 124,
                            width: 180,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFFCC1DD), // Start color
                                  Color(0xFFF560A7), // End color
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/images/paltee.png',
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 40.0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 6.0,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF7915DE), // Start color
                                    Color(0xFF260C40), // End color
                                  ],
                                  stops: [
                                    0.0,
                                    1.0
                                  ], // Adjusted stops to correct range
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                '3 Items Box',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: Get.width * 0.040,
                                  color: Colors
                                      .white, // Adjust text color as needed
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              _buildDishPlate(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDishPlate(HomeController controller) {
    return SizedBox(
      height: Get.height * 0.35,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.dishData.length,
        itemBuilder: (context, index) {
          final data = controller.dishData[index];
          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: Get.width * 0.7,
              decoration: AppDecoration.outlineGrayA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Image.asset(
                          data['image']!,
                          height: Get.height * 0.14,
                          width: Get.width * 0.72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 6.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6318AF),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            'Popular',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontSize: Get.width * 0.040,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icon/mark.svg"),
                        const SizedBox(width: 8.0),
                        Text(
                          data['headline']!,
                          style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: Get.width * 0.044,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          data['counters'],
                          style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: Get.width * 0.038,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF6318AF)),
                        ),
                        const Spacer(),
                        Text(
                          "See all",
                          style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: Get.width * 0.038,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Row(
                      children: [
                        Wrap(
                          children: [
                            Text(
                              'Starts at ',
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontSize: Get.width * 0.040,
                              ),
                            ),
                            Text(
                              '₹299',
                              style: theme.textTheme.bodySmall!.copyWith(
                                  fontSize: Get.width * 0.036,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 16,
                              color: Colors.grey,
                            ),
                            Text(
                              '10 - 60',
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontSize: Get.width * 0.032,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            Text(
                              '₹299',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: Get.width * 0.045,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '/ Person',
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontSize: Get.width * 0.035,
                              ),
                            ),
                          ],
                        ),
                        const Wrap(
                          children: [
                            Icon(Icons.arrow_downward,
                                size: 20, color: Colors.green),
                            Text(
                              '20%',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Wrap(
                      children: [
                        Text(
                          ' with Dynamic Price for  ',
                          style: theme.textTheme.bodyLarge!.copyWith(
                              fontSize: Get.width * 0.037,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          '100 Guests',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // Additional elements can go here
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
