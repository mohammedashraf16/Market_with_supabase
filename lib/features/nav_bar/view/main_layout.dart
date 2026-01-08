import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:markety/core/utils/app_colors.dart';
import 'package:markety/features/favorite/views/favorite_view.dart';
import 'package:markety/features/home/views/home_view.dart';
import 'package:markety/features/nav_bar/manger/cubit/nav_bar_cubit.dart';
import 'package:markety/features/profile/views/profile_view.dart';
import 'package:markety/features/store/views/store_view.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});
  List<Widget> views = [HomeView(), StoreView(), FavoriteView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();
          return Scaffold(
            body: SafeArea(child: views[cubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.kBordersideColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: GNav(
                  onTabChange: (index) {
                    cubit.navBarChagedIndex(index);
                  },
                  rippleColor: Colors.grey[800]!,
                  hoverColor: Colors.grey[700]!,
                  tabBorderRadius: 30,
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 300),
                  gap: 8,
                  color: AppColors.kGreyColor,
                  activeColor: AppColors.kWhiteColor,
                  iconSize: 24,
                  tabBackgroundColor: AppColors.kPrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.shopping_bag_rounded, text: 'Store'),
                    GButton(icon: Icons.favorite, text: 'Favorite'),
                    GButton(icon: Icons.person_2_rounded, text: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
