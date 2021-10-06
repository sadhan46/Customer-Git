import 'package:customer1/Home.dart';
import 'package:customer1/Models/ProductAppointment.dart';
import 'package:customer1/Models/ServiceAppointment.dart';
import 'package:customer1/Models/ProductListModel.dart';
import 'package:customer1/Models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:customer1/Network_handler.dart';
import 'package:intl/intl.dart';

class ProductScreenTest extends StatefulWidget {
  final String username;

  const ProductScreenTest({Key key, this.username}) : super(key: key);

  @override
  _ProductScreenTestState createState() => _ProductScreenTestState();
}

class _ProductScreenTestState extends State<ProductScreenTest> {
  NetworkHandler networkHandler = NetworkHandler();

  //List<bool> addproduct =[] ;
  //List<int> counter =[];
  ProductListModel listModel = ProductListModel();
  ProductListModel cartModel = ProductListModel();
  List<ProductModel> _cart = List<ProductModel>();
  //ProductListModel cartProducts =ProductListModel();
  ProductAppointment cartProduct = ProductAppointment();

  ProductAppointment timing = ProductAppointment();

  DateTime date = DateTime.now();
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  DateTime date3 = DateTime.now();
  DateTime date4 = DateTime.now();
  DateTime date5 = DateTime.now();
  DateTime date6 = DateTime.now();
  DateTime date7 = DateTime.now();
  DateTime date8 = DateTime.now();
  DateTime date9 = DateTime.now();
  DateTime date10 = DateTime.now();
  double sum = 0;


  var _date;
  var _slot;
  bool _time=false;
  List<String> slot=[];
  //int d;
  int y;

  TimeOfDay Total_Time=TimeOfDay(hour: 0, minute: 15);
  String appointment_start_time;
  String appointment_end_time;

  TextStyle headingStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff1C396D));
  TextStyle contentStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'sfpro');

  @override
  void initState() {
    super.initState();
    //cartProducts.cart_=List<ProductModel>();
    cartProduct.cart_products=List<ProductModel>();
    cartModel.data=List<ProductModel>();
    fetchData();
    // _addproduct();
  }

  void fetchData() async {
    var response = await networkHandler.get("/add_product/${widget.username}");
    setState(() {
      listModel = ProductListModel.fromJson(response);
    });
  }

  void fetchTimings(d) async {
    var response = await networkHandler.get(
        "/add_appointment/getappointment/${widget.username}/${DateFormat('y-M-d').format(date1.add(Duration(days: d))).toString()}");

    setState(() {
      timing = ProductAppointment.fromJson(response["data"]);
      _time= timing != null ? true : false;
    });
  }



  @override
  Widget build(BuildContext context) {
    TimeOfDay slot_1_starting_time = timing.slot_1_starting_time == null ? null : stringToTime (timing.slot_1_starting_time);
    TimeOfDay slot_1_ending_time = timing.slot_1_ending_time == null ? null : stringToTime(timing.slot_1_ending_time);
    TimeOfDay slot_2_starting_time = timing.slot_2_starting_time == null ? null : stringToTime(timing.slot_2_starting_time);
    TimeOfDay slot_2_ending_time = timing.slot_2_ending_time == null ? null : stringToTime(timing.slot_2_ending_time);
    TimeOfDay slot_3_starting_time = timing.slot_3_starting_time == null ? null : stringToTime(timing.slot_3_starting_time);
    TimeOfDay slot_3_ending_time = timing.slot_3_ending_time == null ? null : stringToTime(timing.slot_3_ending_time);
    TimeOfDay slot_4_starting_time = timing.slot_4_starting_time == null ? null : stringToTime(timing.slot_4_starting_time);
    TimeOfDay slot_4_ending_time = timing.slot_4_ending_time == null ? null : stringToTime(timing.slot_4_ending_time);
    TimeOfDay slot_5_starting_time = timing.slot_5_starting_time == null ? null : stringToTime(timing.slot_5_starting_time);
    TimeOfDay slot_5_ending_time = timing.slot_5_ending_time == null ? null : stringToTime(timing.slot_5_ending_time);
    TimeOfDay slot_6_starting_time = timing.slot_6_starting_time == null ? null : stringToTime(timing.slot_6_starting_time);
    TimeOfDay slot_6_ending_time = timing.slot_6_ending_time == null ? null : stringToTime(timing.slot_6_ending_time);

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _height1 = _height * 0.5;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C396D),
          bottom: TabBar(
            //indicatorColor: Color(0xff6B8BC6),
            tabs: [
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Cart",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            listModel.data == null
                ? Center(
                    child: Text("We don't have any Products Yet"),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {

                      return Container(
                        height: 150,
                        padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 110,
                                  width: 100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: NetworkHandler().getImage(listModel.data[index].id), fit: BoxFit.contain),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        )),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //productname (),
                                      Text(
                                        listModel.data[index].product_name,
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "${listModel.data[index].quantity} ${listModel.data[index].unit}",
                                          style: TextStyle(fontSize: 15,),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: MediaQuery.of(context).size.width - 120,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            if (listModel.data[index].sp != "")
                                              Container(
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '${listModel.data[index].currency}${listModel.data[index].sp}',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '${listModel.data[index].currency}${listModel.data[index].mrp}',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.normal,
                                                            decoration: TextDecoration.lineThrough,
                                                            color: Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            else
                                              Text(
                                                "${listModel.data[index].currency}${listModel.data[index].mrp}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            Container(
                                                child:
                                                    listModel.data[index].addProduct
                                                        ? Container(
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors.blue),
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(4),
                                                                bottomLeft: Radius.circular(4),
                                                                topRight: Radius.circular(4),
                                                                bottomRight: Radius.circular(4),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    if (listModel.data[index].counter == 1) {

                                                                      setState(() {

                                                                        _cart.remove(listModel.data[index]);

                                                                        sum = sum - (listModel.data[index].sp == ""
                                                                                ? (listModel.data[index].counter * double.parse(listModel.data[index].mrp))
                                                                                : (listModel.data[index].counter * double.parse(listModel.data[index].sp)));
                                                                        listModel.data[index].addProduct = false;
                                                                      });
                                                                    }
                                                                    else {
                                                                      setState(
                                                                          () {
                                                                        sum = sum - (listModel.data[index].sp == ""
                                                                                ? (listModel.data[index].counter * double.parse(listModel.data[index].mrp))
                                                                                : (listModel.data[index].counter * double.parse(listModel.data[index].sp)));

                                                                        listModel.data[index].counter--;

                                                                        sum = sum + (listModel.data[index].sp == ""
                                                                                ? (listModel.data[index].counter * double.parse(listModel.data[index].mrp))
                                                                                : (listModel.data[index].counter * double.parse(listModel.data[index].sp)));
                                                                      });
                                                                    }
                                                                  },
                                                                  child: Container(
                                                                    height: 18,
                                                                    width: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(4),
                                                                          bottomLeft: Radius.circular(4),
                                                                        ),
                                                                        //border: Border.all(color: Colors.blueAccent),

                                                                        shape: BoxShape.rectangle,
                                                                        color: Colors.white),
                                                                    child: Center(
                                                                      child: Text("-", style: TextStyle(
                                                                            color: Colors.blueAccent,
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 18,
                                                                  width: 25,
                                                                  child: Center(
                                                                    child: Text(
                                                                      listModel.data[index].counter.toString(),
                                                                      style: TextStyle(
                                                                        color: Colors.blueAccent,
                                                                        fontSize: 16,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    if (listModel.data[index].counter <= 99) {
                                                                      //_cart.remove(listModel.data[index]);
                                                                      setState(() {
                                                                        sum = sum - (listModel.data[index].sp == ""
                                                                                ? (listModel.data[index].counter * double.parse(listModel.data[index].mrp))
                                                                                : (listModel.data[index].counter * double.parse(listModel.data[index].sp)));

                                                                        listModel.data[index].counter++;

                                                                        sum = sum + (listModel.data[index].sp == ""
                                                                                ? (listModel.data[index].counter * double.parse(listModel.data[index].mrp))
                                                                                : (listModel.data[index].counter * double.parse(listModel.data[index].sp)));

                                                                        //listModel.data[index].counter++;
                                                                        /* sum=sum+(listModel.data[index].sp
                                                        ==""?(listModel.data[index].counter++*double.parse(listModel.data[index].mrp)):(listModel.data[index].counter++*double.parse(listModel.data[index].sp)));
                                                  */
                                                                      });
                                                                      //_cart.add(listModel.data[index]);
                                                                    }
                                                                  },
                                                                  child: Container(
                                                                    height: 18,
                                                                    width: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                          topRight: Radius.circular(4),
                                                                          bottomRight: Radius.circular(4),
                                                                        ),
                                                                        shape: BoxShape.rectangle,
                                                                        color: Colors.white),
                                                                    child: Center(
                                                                      child: Text("+",
                                                                        style: TextStyle(
                                                                            color: Colors.blueAccent,
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            height: 20,
                                                            child: OutlineButton(
                                                                    onPressed: () {
                                                                      sum = sum +
                                                                          (listModel.data[index].sp == ""
                                                                              ? (listModel.data[index].counter * double.parse(listModel.data[index].mrp))
                                                                              : (listModel.data[index].counter * double.parse(listModel.data[index].sp)));
                                                                      _cart.add(listModel.data[index]);
                                                                      setState(() {
                                                                        listModel.data[index].addProduct = true;
                                                                      });
                                                                    },
                                                                    borderSide: BorderSide(color: Colors.blue),
                                                                    //color: Colors.blueAccent,
                                                                    //disabledBorderColor: Colors.blueAccent,
                                                                    child: Text("ADD +",
                                                                      style: TextStyle(
                                                                          color: Colors.blue,
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.normal),
                                                                    )),
                                                          ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount:
                        listModel.data == null ? 0 : listModel.data.length,
                    shrinkWrap: true,
                  ),
            Container(
              padding: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pick up Date",
                            style: headingStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:
                                /*ListView.builder(itemBuilder: (context,index)

                            {
                              var _date=1;
                              return
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      _date=index+1;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date == index+1 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: index+1))).toString(), style: contentStyle.copyWith(
                                            color: _date == index+1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 1))).toString(), style: contentStyle.copyWith(
                                            color: _date == index+1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                );
                            },
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              shrinkWrap: true,
                            )*/
                                /* Row(
                              children: [
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      _date=1;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date==1 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: 1))).toString(), style: contentStyle.copyWith(
                                            color: _date==1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 1))).toString(), style: contentStyle.copyWith(
                                            color: _date==1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      _date=2;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date==2 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: 2))).toString(), style: contentStyle.copyWith(
                                            color: _date==2 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 2))).toString(), style: contentStyle.copyWith(
                                            color: _date==2 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      _date=3;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date==3 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: 3))).toString(), style: contentStyle.copyWith(
                                            color: _date==3 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 3))).toString(), style: contentStyle.copyWith(
                                            color: _date==3 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                            */

                                Row(
                              children: [
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 1))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 1))).toString(), 1),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 2))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 2))).toString(), 2),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 3))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 3))).toString(), 3),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 4))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 4))).toString(), 4),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 5))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 5))).toString(), 5),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 6))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 6))).toString(), 6),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 7))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 7))).toString(), 7),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 8))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 8))).toString(), 8),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 9))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 9))).toString(), 9),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 10))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 10))).toString(), 10),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Pick up Time",
                            style: headingStyle,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _time == true?
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _time == true ? appointmentPermit(slot_1_starting_time, slot_1_ending_time, Total_Time)
                                        ? appoint_start_side(slot_1_starting_time, Total_Time, 0)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true ? appointmentPermit(slot_1_starting_time, slot_1_ending_time, Total_Time)
                                    ? appoint_end_side(slot_1_ending_time, Total_Time, 1)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot_2_starting_time, slot_2_ending_time, Total_Time)
                                    ? appoint_start_side(
                                    slot_2_starting_time, Total_Time, 2)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot_2_starting_time, slot_2_ending_time, Total_Time)
                                    ? appoint_end_side(
                                    slot_2_ending_time, Total_Time, 3)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot_3_starting_time, slot_3_ending_time, Total_Time)
                                    ? appoint_start_side(
                                    slot_3_starting_time, Total_Time, 4)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot_3_starting_time, slot_3_ending_time, Total_Time)
                                    ? appoint_end_side(
                                    slot_3_ending_time, Total_Time, 5)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot_4_starting_time, slot_4_ending_time, Total_Time)
                                    ? appoint_start_side(
                                    slot_4_starting_time, Total_Time, 6)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot_4_starting_time, slot_4_ending_time, Total_Time)
                                    ? appoint_end_side(
                                    slot_4_ending_time, Total_Time, 7)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot_5_starting_time, slot_5_ending_time, Total_Time)
                                    ? appoint_start_side(
                                    slot_5_starting_time, Total_Time, 8)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot_5_starting_time, slot_5_ending_time, Total_Time)
                                    ? appoint_end_side(
                                    slot_5_ending_time, Total_Time, 9)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot_6_starting_time, slot_6_ending_time, Total_Time)
                                    ? appoint_start_side(
                                    slot_6_starting_time, Total_Time, 10)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot_6_starting_time, slot_6_ending_time, Total_Time)
                                    ? appoint_end_side(
                                    slot_6_ending_time, Total_Time, 11)
                                    : SizedBox()
                                    : SizedBox(),

                              ],
                            ),
                          ):SizedBox(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Container(
                          child: ListView.builder(
                        itemBuilder: (context, index) {
                          for (var i = 0; i == _cart.length; i++) {}
                          return Container(
                            height: 150,
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    /*SizedBox(
                                             height: 110,
                                             width: 100,
                                             child: Container(
                                               decoration: BoxDecoration(
                                                   image: DecorationImage(
                                                       image: NetworkHandler().getImage(listModel.data[index].id),
                                                       fit: BoxFit.contain),
                                                   color: Colors.white,
                                                   borderRadius: BorderRadius.only(
                                                     topLeft: Radius.circular(12),
                                                     bottomLeft: Radius.circular(12),
                                                     topRight: Radius.circular(12),
                                                     bottomRight: Radius.circular(12),
                                                   )),
                                             ),
                                           ),*/
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          //productname (),
                                          Text(
                                            _cart[index].product_name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),

                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              "${_cart[index].quantity} ${_cart[index].unit}",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: MediaQuery.of(context).size.width - 120,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                if (_cart[index].sp != "")
                                                  Container(
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '${_cart[index].currency}${_cart[index].sp}',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black),
                                                          ),
                                                          TextSpan(
                                                            text: '${_cart[index].currency}${_cart[index].mrp}',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.normal,
                                                                decoration: TextDecoration.lineThrough,
                                                                color: Colors.black54),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                else
                                                  Text(
                                                    "${_cart[index].currency}${_cart[index].mrp}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                Container(
                                                    child: //_cart[index].addProduct?
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: Colors.blue),
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(4),
                                                              bottomLeft: Radius.circular(4),
                                                              topRight: Radius.circular(4),
                                                              bottomRight: Radius.circular(4),
                                                            ),
                                                          ),
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          if (_cart[index].counter == 1) {
                                                            setState(() {
                                                              sum = sum - (_cart[index].sp == ""
                                                                      ? ((_cart[index].counter) * double.parse(_cart[index].mrp))
                                                                      : ((_cart[index].counter) * double.parse(_cart[index].sp)));
                                                              _cart[index].addProduct = false;
                                                              _cart.remove(_cart[index]);
                                                              //listModel.data.
                                                            });
                                                          } else {
                                                            setState(() {
                                                              sum = sum - (_cart[index].sp == ""
                                                                      ? ((_cart[index].counter) * double.parse(_cart[index].mrp))
                                                                      : ((_cart[index].counter) * double.parse(_cart[index].sp)));
                                                              _cart[index].counter--;
                                                              sum = sum + (_cart[index].sp == ""
                                                                      ? ((_cart[index].counter) * double.parse(_cart[index].mrp))
                                                                      : ((_cart[index].counter) * double.parse(_cart[index].sp)));
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 18,
                                                          width: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(4),
                                                                    bottomLeft: Radius.circular(4),
                                                                  ),
                                                                  //border: Border.all(color: Colors.blueAccent),
                                                                  shape: BoxShape.rectangle,
                                                                  color: Colors.white),
                                                          child: Center(
                                                            child: Text("-",
                                                              style: TextStyle(
                                                                  color: Colors.blueAccent,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 18,
                                                        width: 25,
                                                        child: Center(
                                                          child: Text(_cart[index].counter.toString(),
                                                            style: TextStyle(
                                                              color: Colors.blueAccent,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          if (_cart[index].counter <= 99) {
                                                            setState(() {
                                                              sum = sum - (_cart[index].sp == ""
                                                                      ? (_cart[index].counter * double.parse(_cart[index].mrp))
                                                                      : (_cart[index].counter * double.parse(_cart[index].sp)));
                                                              _cart[index].counter++;
                                                              sum = sum + (_cart[index].sp == ""
                                                                      ? (_cart[index].counter * double.parse(_cart[index].mrp))
                                                                      : (_cart[index].counter * double.parse(_cart[index].sp)));

                                                              /* sum=sum+(_cart[index].sp
                                                                         ==""?((_cart[index].counter)*double.parse(_cart[index].mrp)):((_cart[index].counter)*double.parse(_cart[index].sp)));
                                                                     sum=sum-(_cart[index].sp
                                                                         ==""?((_cart[index].counter++)*double.parse(_cart[index].mrp)):((_cart[index].counter++)*double.parse(_cart[index].sp)));
                                                                     //_cart[index].counter++;
                                                                      */
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 18,
                                                          width: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(4),
                                                                    bottomRight: Radius.circular(4),
                                                                  ),
                                                                  shape: BoxShape.rectangle,
                                                                  color: Colors.white
                                                              ),
                                                          child: Center(
                                                            child: Text(
                                                              "+",
                                                              style: TextStyle(
                                                                  color: Colors.blueAccent,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ) /*:
                                                       Container(
                                                         height: 20,
                                                         child: OutlineButton(
                                                             onPressed: (){

                                                               _cart.add(listModel.data[index]);

                                                               setState(() {
                                                                 listModel.data[index].addProduct=true;
                                                               });
                                                             },
                                                             borderSide: BorderSide(color: Colors.blue),
                                                             //color: Colors.blueAccent,
                                                             //disabledBorderColor: Colors.blueAccent,
                                                             child: Text("ADD +",style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.normal),
                                                             )
                                                         ),
                                                       )*/
                                                    )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: _cart.length,
                        shrinkWrap: true,
                      ))
                    ],
                  ),
                  Positioned(
                    bottom: 7,
                    left: 13,
                    height: _height1 * 0.13,
                    width: (_width) - 26,
                    child: ElevatedButton(
                      onPressed: () async{
                        print(1);
                        cartProduct.username = widget.username;
                        cartProduct.slot_1_starting_time = slot[0];
                        cartProduct.slot_1_ending_time = slot[1];
                        cartProduct.slot_2_starting_time = slot[2];
                        cartProduct.slot_2_ending_time = slot[3];
                        cartProduct.slot_3_starting_time = slot[4];
                        cartProduct.slot_3_ending_time = slot[5];
                        cartProduct.slot_4_starting_time = slot[6];
                        cartProduct.slot_4_ending_time = slot[7];
                        cartProduct.slot_5_starting_time = slot[8];
                        cartProduct.slot_5_ending_time = slot[9];
                        cartProduct.slot_6_starting_time = slot[10];
                        cartProduct.slot_6_ending_time = slot[11];
                        print(1.1);
                        cartProduct.close_days = timing.close_days;
                        //print(DateFormat('y-M-d').format(date1.add(Duration(days: d))));
                        print(2);
                        print(y);
                        cartProduct.date = DateFormat('y-M-d').format(date1.add(Duration(days: y))).toString();
                        print(3);
                        cartProduct.customer_name = "${TimeOfDay.now().toString()}";
                        print(4);
                        cartProduct.cart_products = _cart;
                        print(5);
                        cartProduct.start_time=appointment_start_time;
                        cartProduct.end_time=appointment_end_time;

                        cartProduct.customer_address = "zyz";
                        cartProduct.customer_contact_number = "vdc";
                        cartProduct.pin_Code = "svc";
                        cartProduct.total = sum.toString();

                        var response = await networkHandler.post1(
                            "/add_appointment/Add", cartProduct.toJson());
                        if (response.statusCode == 200 ||
                            response.statusCode == 201) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                                  (route) => false);
                        }

                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),

                      // height:_height1*0.13,
                      //width: _width-100,
                      child: Center(
                          child: Text("Total $sum",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration
                                      .none))), /*
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),

                            ),
                            color: Colors.white),*/
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  appoint_start_side(TimeOfDay starting_time, TimeOfDay total_time, int t) {

    var xtime= DateTime(0,0,0,starting_time.hour,starting_time.minute);
    var ytime= DateTime(0,0,0,total_time.hour,total_time.minute);
    Duration add = xtime.difference(ytime);

   int add_minute = add.inMinutes-(add.inHours*60);


    //int totalMinutes = starting_time.minute+total_time.minute;
    //int add_hour =  starting_time.hour+total_time.hour+ totalMinutes ~/ 60 ;
    //int add_minute= (totalMinutes)-(totalMinutes ~/ 60)*60;

    TimeOfDay ending_time=TimeOfDay(hour: add.inHours, minute: add_minute);

    String _starting_time = starting_time.period == DayPeriod.am
        ? "${starting_time.hour}:${starting_time.minute} AM"
        : "${starting_time.hour}:${starting_time.minute} PM";

    String _ending_time = ending_time.period == DayPeriod.am
        ? "${ending_time.hour}:${ending_time.minute} AM"
        : "${ending_time.hour}:${ending_time.minute} PM";
    return InkWell(
      onTap: () {
        setState(() {
          _slot = t;
          slot.clear();
          slot.add(timing.slot_1_starting_time);
          slot.add(timing.slot_1_ending_time);
          slot.add(timing.slot_2_starting_time);
          slot.add(timing.slot_2_ending_time);
          slot.add(timing.slot_3_starting_time);
          slot.add(timing.slot_3_ending_time);
          slot.add(timing.slot_4_starting_time);
          slot.add(timing.slot_4_ending_time);
          slot.add(timing.slot_5_starting_time);
          slot.add(timing.slot_5_ending_time);
          slot.add(timing.slot_6_starting_time);
          slot.add(timing.slot_6_ending_time);
          if(t==0||t==2||t==4||t==6||t==8||t==10){
            slot[t]="${ending_time.hour}:${ending_time.minute}";
            appointment_start_time="${starting_time.hour}:${starting_time.minute}";
            appointment_end_time="${ending_time.hour}:${ending_time.minute}";
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color:
            _slot == t ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_starting_time} to ${_ending_time} ",
              style: contentStyle.copyWith(
                color: _slot == t ? Colors.white : Color(0xff1C396D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  appoint_end_side(TimeOfDay ending_time, TimeOfDay total_time, int t) {
    var xtime= DateTime(0,0,0,ending_time.hour,ending_time.minute);
    var ytime= DateTime(0,0,0,total_time.hour,total_time.minute);
    Duration subtract = xtime.difference(ytime);

    //int totalMinutes = ending_time.minute + total_time.minute; // subtract minutes
    //int subtract_hour = (ending_time.hour-total_time.hour-(totalMinutes/60)).toInt();
    //int subtract_minute = 60 - ((totalMinutes)-((totalMinutes ~/ 60)*60));

    int subtract_minute = subtract.inMinutes-(subtract.inHours*60);


    TimeOfDay starting_time=TimeOfDay(hour: subtract.inHours, minute: subtract_minute);


    String _starting_time = starting_time.period == DayPeriod.am
        ? "${starting_time.hour}:${starting_time.minute} AM"
        : "${starting_time.hour}:${starting_time.minute} PM";

    String _ending_time = ending_time.period == DayPeriod.am
        ? "${ending_time.hour}:${ending_time.minute} AM"
        : "${ending_time.hour}:${ending_time.minute} PM";
    return InkWell(
      onTap: () {
        setState(() {
          _slot = t;
          slot.clear();
          slot.add(timing.slot_1_starting_time);
          slot.add(timing.slot_1_ending_time);
          slot.add(timing.slot_2_starting_time);
          slot.add(timing.slot_2_ending_time);
          slot.add(timing.slot_3_starting_time);
          slot.add(timing.slot_3_ending_time);
          slot.add(timing.slot_4_starting_time);
          slot.add(timing.slot_4_ending_time);
          slot.add(timing.slot_5_starting_time);
          slot.add(timing.slot_5_ending_time);
          slot.add(timing.slot_6_starting_time);
          slot.add(timing.slot_6_ending_time);
          if(t==1||t==3||t==5||t==7||t==9||t==11){
            slot[t]="${starting_time.hour}:${starting_time.minute}";
            appointment_start_time="${starting_time.hour}:${starting_time.minute}";
            appointment_end_time="${ending_time.hour}:${ending_time.minute}";

          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color:
            _slot == t ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_starting_time} to ${_ending_time} ",
              style: contentStyle.copyWith(
                color: _slot == t ? Colors.white : Color(0xff1C396D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dateWidget(String day, String date, d) {
    return InkWell(
      onTap: () {
        setState(() {
          y=d;
          _date = d;
          fetchTimings(d);
        });
      },
      child: Container(
        height: 68,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color:
                _date == d ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: contentStyle.copyWith(
                  color: _date == d ? Colors.white : Color(0xff1C396D),
                  fontSize: 23),
            ),
            Text(
              date,
              style: contentStyle.copyWith(
                  color: _date == d ? Colors.white : Color(0xff1C396D),
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  stringToTime(String slotTime){
    return slotTime=="null"?null:TimeOfDay(
        hour: int.parse(slotTime.split(":")[0]),
        minute: int.parse(slotTime.split(":")[1]));
  }

  appointmentPermit(TimeOfDay slotStartTime,TimeOfDay slotEndTime,TimeOfDay totalTime){
    if(slotStartTime==null || slotEndTime==null || totalTime==null) {
      return false;
    }
    else{
      return
      ((slotEndTime.hour.toDouble() +
          slotEndTime.minute
              .toDouble() /
              60.0) -
          (slotStartTime.hour
              .toDouble() +
              slotStartTime.minute
                  .toDouble() /
                  60.0)) >
          (totalTime.hour.toDouble() +
              totalTime.minute.toDouble() /
                  60.0)? true:false;
    }
  }

  Container timeWidget(String time, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (isActive) ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: contentStyle.copyWith(
              color: (isActive) ? Colors.white : Color(0xff1C396D),
            ),
          ),
        ],
      ),
    );
  }
}
