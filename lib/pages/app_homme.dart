import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_cars/data/cars_cats.dart';
import 'package:rent_a_cars/data/logo_data.dart';
import 'package:rent_a_cars/images/image_data.dart';
import 'package:rent_a_cars/pages/app_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tap = 0;

  void changePress(int index) {
    tap = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.0.h),
            searchBar(),
            SizedBox(height: 10.0.h),
            brandsText(),
            builderBarCarsLogo(),
            availableCars(),
            SizedBox(
              width: 500.w,
              height: 390.h,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  // 1
                  mainContainer(
                    onPtessend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][0],
                            infoImage: imageAssets[tap][0],
                          ),
                        ),
                      );
                    },
                    index: 0,
                  ),

                  //2
                  mainContainer(
                    onPtessend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][1],
                            infoImage: imageAssets[tap][1],
                          ),
                        ),
                      );
                    },
                    index: 1,
                  ),

                  //3
                  mainContainer(
                    onPtessend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][2],
                            infoImage: imageAssets[tap][2],
                          ),
                        ),
                      );
                    },
                    index: 2,
                  ),

                  //4
                  mainContainer(
                    onPtessend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][3],
                            infoImage: imageAssets[tap][3],
                          ),
                        ),
                      );
                    },
                    index: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack mainContainer({
    required int index,
    required GestureTapCallback onPtessend,
  }) {
    return Stack(
      children: [
        SizedBox(width: 420.0.w, height: 150.0.h),

        //
        Positioned(
          top: 25.0,
          child: Container(
            padding: EdgeInsets.all(14.0.h),
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F3),
              borderRadius: BorderRadius.circular(27.0.h),
            ),
            width: 340.0.w,
            height: 120.0.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // name
                Text(
                  Cars[tap][index]['name'],
                  style: TextStyle(
                    fontSize: 16.0.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //year
                Text(
                  Cars[tap][index]['year'],
                  style: TextStyle(
                    fontSize: 17.0.h,
                    fontWeight: FontWeight.w200,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 12.0.h),

                //row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${Cars[tap][index]['price']}\$',
                            style: TextStyle(
                              fontSize: 16.0.h,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '/day',
                            style: TextStyle(
                              fontSize: 17.0.h,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),

                    // jump to the info page
                    GestureDetector(
                      onTap: onPtessend,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(5.0, 4.0),
                              color: Colors.grey,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0.h),
                          ),
                        ),
                        width: 100.0.w,
                        height: 37.0.h,
                        child: Center(
                          child: Text(
                            'details',
                            style: TextStyle(
                              fontSize: 17.0.h,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -55,
          width: 180.w,
          height: 160.h,
          child: Image.asset('${imageAssets[tap][index]}'),
        )
      ],
    );
  }

  Widget availableCars() {
    return Container(
      width: 360.w,
      height: 59.h,
      margin: EdgeInsets.only(right: 15.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8.0.h),
            child: Text(
              'Available cars',
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontSize: 20.0.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(Icons.sell_outlined, size: 23.0.h),
        ],
      ),
    );
  }

  Container builderBarCarsLogo() {
    return Container(
      height: 103.0.h,
      padding: EdgeInsets.symmetric(vertical: 7.0.h),
      child: ListView.builder(
        itemCount: Cars.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                changePress(index);
              },
              child: Container(
                width: 70.0.w,
                height: 70.0.h,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0.h),
                  color: const Color(0xffF2F2F3),

                  // boxShadow
                  boxShadow: [
                    tap == index
                        ? const BoxShadow(
                            blurRadius: 5.0,
                            offset: Offset(7.0, 5.0),
                            color: Colors.grey)
                        : const BoxShadow(
                            blurRadius: 7.0,
                            color: Colors.grey,
                          ),
                  ],

                  // border setting
                  border: tap == index
                      ? Border.all(width: 2.0, color: Colors.black)
                      : const Border(),
                ),

                // padding setting
                padding: tap == index
                    ? EdgeInsets.all(8.0.h)
                    : EdgeInsets.all(13.0.h),

                // margin
                margin: EdgeInsets.only(
                  bottom: 7.0.h,
                  right: 27.0.h,
                  left: 8.0.h,
                  top: 17.0.h,
                ),

                //image
                child: Image(
                  image: AssetImage(imageI[index]),
                ),
              ));
        },
      ),
    );
  }

  Container brandsText() {
    return Container(
      padding: EdgeInsets.only(left: 5.0.h),
      child: Text(
        'brands',
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontSize: 20.0.w,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget searchBar() {
    return SizedBox(
      width: 343.0.w,
      height: 70.0.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // text bar
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Choose  ',
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 24.0.w,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: 'a Cars',
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 25.0.w,
                    ))
              ],
            ),
          ),

          // search button
          IconButton(
            splashColor: const Color(0xffFFFFFF),
            highlightColor: const Color(0xffFFFFFF),
            onPressed: (() {}),
            icon: Icon(
              Icons.manage_search_outlined,
              size: 25.0.h,
            ),
          )
        ],
      ),
    );
  }
}
