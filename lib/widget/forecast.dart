import 'package:flutter/material.dart';

//forecast widget
class forecast extends StatelessWidget {
  forecast(this.date,this.icon,this.temp);
  late String date;
  late Image icon;
  late String temp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20,left: 15),
      child: Container(
        decoration: BoxDecoration(
            color:Color(0xff3E76F2),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(date,style: TextStyle(
                  color: Color(0xffBED0FA),
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 10,),
              //Icon(Icons.cloud_queue_sharp,size: 30,color: Colors.white,),
              icon,
              SizedBox(height: 10,),
              Text("$temp°C",style: TextStyle(
                  color: Color(0xffBED0FA),
                  fontWeight: FontWeight.w500
              ))

            ],
          ),
        ),
      ),
    );
  }
}
