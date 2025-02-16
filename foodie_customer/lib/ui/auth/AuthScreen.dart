import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodie_customer/constants.dart';
import 'package:foodie_customer/main.dart';
import 'package:foodie_customer/services/helper.dart';
import 'package:foodie_customer/ui/container/ContainerScreen.dart';
import 'package:foodie_customer/ui/location_permission_screen.dart';
import 'package:foodie_customer/ui/login/LoginScreen.dart';
import 'package:foodie_customer/ui/signUp/SignUpScreen.dart';
import 'package:geolocator/geolocator.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode(context) ? Color(DARK_VIEWBG_COLOR) : Colors.white,
      body: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
                right: 20.0, left: 20.0, top: 40, bottom: 20),
            child: TextButton(
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(COLOR_PRIMARY)),
              ).tr(),
              onPressed: () async {
                LocationPermission permission =
                    await Geolocator.checkPermission();
                if (permission == LocationPermission.always ||
                    permission == LocationPermission.whileInUse) {
                  if (MyAppState.selectedPosotion.location == null) {
                    pushAndRemoveUntil(
                        context, LocationPermissionScreen(), false);
                  } else {
                    pushAndRemoveUntil(
                        context,
                        ContainerScreen(
                          user: null,
                        ),
                        false);
                  }
                } else {
                  pushAndRemoveUntil(
                      context, LocationPermissionScreen(), false);
                }
              },
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.only(top: 5, bottom: 5),
                ),
                shape: WidgetStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(
                      color: Color(COLOR_PRIMARY),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/app_logo.png',
                color: Color(COLOR_PRIMARY),
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 32, right: 16, bottom: 8),
              child: Text(
                "Welcome to Qwik Chow",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(COLOR_PRIMARY),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ).tr(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: Text(
                "Order food from restaurants around you and track food in real-time",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ).tr(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(COLOR_PRIMARY),
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color: Color(COLOR_PRIMARY),
                      ),
                    ),
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ).tr(),
                  onPressed: () {
                    push(context, LoginScreen());
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 40.0, left: 40.0, top: 20, bottom: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: TextButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(COLOR_PRIMARY)),
                  ).tr(),
                  onPressed: () {
                    push(context, SignUpScreen());
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.only(top: 12, bottom: 12),
                    ),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                          color: Color(COLOR_PRIMARY),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
