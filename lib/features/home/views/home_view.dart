import 'package:flutter/material.dart';
import 'package:markety/core/utils/app_colors.dart';
import 'package:markety/core/widgets/custom_text_form_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                radius: 25,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello!"),
                  Text(
                    "Mohammed Ashraf",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Container(
                decoration: ShapeDecoration(
                  color: AppColors.kBordersideColor,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: CustomTextFormField(
              lable: "Search here",
              prefixIcon: Image.asset("assets/images/SearchIcon.png"),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured", style: TextStyle(color: AppColors.kGreyColor)),
              Text(
                "see more",
                style: TextStyle(color: AppColors.kPrimaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.kWhiteColor,
                  elevation: 1.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          color: AppColors.kBordersideColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Product 1"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Price : \$20"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
