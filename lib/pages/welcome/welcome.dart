import 'package:app/main.dart';
import 'package:app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:app/pages/welcome/bloc/welcome_events.dart';
import 'package:app/pages/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  PageController  pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: Container(
        color: const Color.fromARGB(255, 99, 99, 99),
        child: Scaffold(
          body:BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
            return  Container(
            margin: EdgeInsets.only(
              top: 34.h,
            ),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index){
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomEvents());

                  },
                  children: [
                    _page(
                        1,
                        context,
                        "name",
                        "First See Learning ",
                        "Forget sbout a for of paper all knowledge is one learning",
                        "assets/images/reading.png"),
                    _page(
                        2,
                        context,
                        "name",
                        "Connect With Everyone ",
                        "Always keep in touch with your utor & friend Let's get connected",
                        "assets/images/boy.png"),
                    _page(
                        3,
                        context,
                        "name",
                        "Always Fasinated Learning ",
                        "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ))
              ],
            ),
          );
        
          },)),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName,
      String titile, String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          height: 345.w,
          width: 345.w,
          child:   Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Container(
          child: Text(titile,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.normal)),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(subTitle,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal)),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3 ) {
              pageController.animateToPage(index, duration:  const Duration(microseconds: 1000), curve: Curves.easeIn);

              
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(),));
               
              
            }
            
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1))
                ]),
            child: Center(
              child: Text(buttonName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        ),
      ],
    );
  }
}
