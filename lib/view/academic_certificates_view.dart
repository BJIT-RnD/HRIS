import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_demo/components/rectangle_with_ellipse.dart';
import 'package:navigation_demo/utils/colors/app_color.dart';
import 'package:navigation_demo/utils/constant/constant.dart';

class AcademicCertificateView extends StatelessWidget {
  const AcademicCertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          RectangleWithEllipse(),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: displayWidth(context) / 5,
            width: displayWidth(context) / 1.75,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColor.primaryColor,
            ),
            child: Center(
              child: Text(
                'academic_certificates'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: displayHeight(context) / 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.buttonAmberColor,
                ),
                child: Text(
                  'bsc_certificate'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 38,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColor.buttonAmberColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ),
              Container(
                height: 38,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColor.buttonAmberColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.buttonAmberColor,
                ),
                child: Text(
                  'view'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
