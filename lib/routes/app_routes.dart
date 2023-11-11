import 'package:flutter/material.dart';
import 'package:pagefly/presentation/home_screen/home_screen.dart';
import 'package:pagefly/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:pagefly/presentation/sign_up_screen/sign_up_screen.dart';

import 'package:pagefly/presentation/search_topics_screen/search_topics_screen.dart';

import 'package:pagefly/presentation/explore_screen/explore_screen.dart';
import 'package:pagefly/presentation/terms_and_conditions_screen/terms_and_conditions_screen.dart';
import 'package:pagefly/presentation/privacy_policy_screen/privacy_policy_screen.dart';

import '../presentation/add_blog/add_blog_screen.dart';
import '../presentation/personal_blog/user_blogs.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String searchTopicsScreen = '/search_topics_screen';

  static const String exploreScreen = '/explore_screen';

  static const String termsAndConditionsScreen = '/terms_and_conditions_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String addBloggScreen = '/add_blog_screen';
  static const String userBlogs = '/user_blogs';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => const HomeScreen(),
    signInScreen: (context) => const SignInScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    searchTopicsScreen: (context) => SearchTopicsScreen(),
    exploreScreen: (context) => const ExploreScreen(),
    termsAndConditionsScreen: (context) => const TermsAndConditionsScreen(),
    privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
    addBloggScreen: (context) => const AddBlogScreen(),
    userBlogs: (context) => const UserBlogs(),
  };
}
