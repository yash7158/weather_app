import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intership_weather_app/controller/get_weather.dart';
import 'package:intership_weather_app/model/weather_model.dart';
import 'package:intership_weather_app/view/loadingPage.dart';
import 'package:intership_weather_app/widget/searchDialog.dart';

class mainPage extends StatefulWidget {
  mainPage(this.w1);
  late weatherData w1;
  bool isloading = false;
  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    //update the data
    Future<void> update(String city) async {
      widget.isloading = true;
      setState(() {
      });
      widget.w1 = await getCurrentWeather(city);
      widget.isloading = false;
      setState(() {
      });
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xff4278F2),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [GestureDetector(
                          onTap: () async {
                            showInputPopup(context,update);
                          },
                          child: Icon(Icons.search_rounded,color:Color(0xffFCFDFF),))],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.w1.city},",style: TextStyle(
                                  color: Color(0xffF9FAFE),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),),
                              SizedBox(height: 5,),
                              Text("${widget.w1.country}",style: TextStyle(
                                  color: Color(0xffF9FAFE),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              )),
                              SizedBox(height: 10,),
                              Text("${widget.w1.date}",style: TextStyle(
                                  color: Color(0xffBED0FA),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.w1.today,style: TextStyle(
                                        color: Color(0xffF9FAFE),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25
                                    ),),
                                    SizedBox(height: 10,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        //Icon(Icons.wb_sunny_outlined,color: Color(0xffFBFC28),size: 50,),
                                        widget.w1.iconImage,
                                        SizedBox(width: 10,),
                                        Text("${widget.w1.temp}°C",style: TextStyle(
                                            color: Color(0xffF9FAFE),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Text("${widget.w1.weatherAbout}",style: TextStyle(
                                        color: Color(0xffBED0FA),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text("Forecast",style:TextStyle(
                                            color: Color(0xffF9FAFE),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15
                                        )),
                                      ),
                                      Container(
                                        height: 220,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.white.withOpacity(0.15)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: widget.w1.forecast
                                              )
                                            ],

                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if(widget.isloading)
            loading()
        ],
      ),
    );
  }
}
