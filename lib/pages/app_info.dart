import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class InfoPage extends StatefulWidget {
  static const id = 'InfoPage';
  Map? info;
  String? infoImage;
  InfoPage({super.key, this.info, this.infoImage});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xff1d1f20),
        elevation: 0.0,
        actions: [
          Icon(Icons.more_horiz_outlined, size: 32.0.w),
          SizedBox(width: 10.w),
        ],
      ),
      body: Column(
        children: [
          // tap
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            decoration: BoxDecoration(
              color: const Color(0xff1d1f20),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.h),
                bottomRight: Radius.circular(40.h),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // tap text name year
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: widget.info!['name'],
                    style: TextStyle(fontSize: 20.0.h),
                  ),
                  TextSpan(
                    text: ' \n${widget.info!['year']}',
                    style: TextStyle(
                      fontSize: 15.0.h,
                      color: Colors.grey,
                    ),
                  )
                ])),

                // image
                SizedBox(
                  width: 360.w,
                  height: 250.h,
                  child: Image.asset(
                    widget.infoImage.toString(),
                    // fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          // bottom
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(17.h),
                child: Text(
                  'specifications',
                  style: TextStyle(fontSize: 20.0.h),
                ),
              ),

              // info scroll
              SizedBox(
                height: 100.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    infoAll(
                      icon: Icons.speed_outlined,
                      text: '${widget.info!['speed']} km/h',
                    ),
                    infoAll(
                      icon: Icons.money_rounded,
                      text: '${widget.info!['to_100']}',
                    ),
                    infoAll(
                      icon: Icons.local_mall_outlined,
                      text: '${widget.info!['price']}\$ / day',
                    ),
                  ],
                ),
              ),
              locationText(),
              location(),
              SizedBox(height: 11.5.w),
              //List Container
              SizedBox(
                width: 360.0.w,
                height: 60.0.h,
                child: Row(
                  children: [
                    // one Expanded
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 18.0.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              //price
                              TextSpan(
                                text: '${widget.info!['price']}\$',
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(
                                text: '/day',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    // two Expanded
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1d1f20),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0.h),
                            bottomLeft: Radius.circular(50.0.h),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Get Car',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0.h,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container location() {
    return Container(
      margin: EdgeInsets.only(left: 15.0.h),
      child: Row(children: [
        const Icon(Icons.location_on, color: Color(0xff1d1f20)),
        Text(
          '  Toshkent Yaangiyol',
          style: TextStyle(fontSize: 14.0.h),
        ),
      ]),
    );
  }

  Container locationText() {
    return Container(
      margin: EdgeInsets.all(17.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Location',
            style: TextStyle(fontSize: 20.0.h, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Icon(
                Icons.sports_martial_arts,
                color: Colors.grey,
                size: 15.0.h,
              ),
              Text(
                '  763/m',
                style: TextStyle(
                  fontSize: 15.0.h,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container infoAll({
    required String text,
    IconData? icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1d1f20),
        borderRadius: BorderRadius.circular(20.h),
      ),
      margin: EdgeInsets.only(left: 15.h),
      width: 155.0.w,
      height: 110.0.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 35.h,
          ),
          SizedBox(height: 8.0.h),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0.h,
            ),
          ),
        ],
      ),
    );
  }
}
