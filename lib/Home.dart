import 'dart:async';
import 'dart:convert';

import 'package:customer1/Appointments.dart';
import 'package:customer1/Database/database.dart';
import 'package:customer1/Model/BusinessNames.dart';
import 'package:customer1/Models/BusinessListModel.dart';
import 'package:customer1/Models/ProfileModel.dart';
import 'package:customer1/ProductScreen.dart';
import 'package:customer1/Services.dart';
import 'package:customer1/Servicestest.dart';
import 'package:flutter/material.dart';
import 'package:customer1/Network_handler.dart';

List<String> links = [];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<BusinessName>> _businessList;

  @override
  void initState() {
    super.initState();
    _getBusinessList();
  }

  _getBusinessList(){
    setState(() {
      _businessList = DatabaseHelper.instance.getBusinessList();
    });
  }


  double selected = 50;

  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _height1 = _height * 0.5;
    Color app_primary_color = Color(0xff1C396D);
    Color link_container_color = Color(0xffECECEC);
    Color add_link_color = Color(0xff6B8BC6);
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        color: app_primary_color,
        child: Stack(
          children: <Widget>[

            Positioned(
              right: 13,
              //left: _width*0.333,
              top: 40,
              child:InkWell(
                child: Icon(
                  Icons.notifications,color: Colors.white,
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>Appointments()),);
                },
              ),
            ),
            Positioned(
              width: 185,
              height: 123,
              right: _width * 0.5 - 92.5,
              //left: _width*0.333,
              top: _height1 * 0.4 ,
              child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // border: Border.all(width: 1),
                    ),
                    child: Image(
                      //height:123 ,
                      //width: 185,
                      image: AssetImage('assets/Shoptree_Customer.png'),
                    ),
                  )),
            ),
            /*AnimatedPositioned(
                width: _width - 60,
                height: 50.0,
                right: 30,
                //left:_width*0.335,
                top: (_height1 * 0.5) + 72.5,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  child: TextField(
                      textInputAction: TextInputAction.search,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15, decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 3, 0, 3),
                          filled: true,
                          hintText: "search",
                          hintStyle:
                          TextStyle(fontSize: 20, color: Colors.grey),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 30,
                          )),
                      onTap: () {
                        setState(() {
                          selected = 30.0;
                        });
                      }),
                  /*Container(
                    child: Stack(
                      children: [
                        new Text (
                            "search",
                            style: TextStyle(
                                color: Colors.grey,fontSize: 18.0,decoration: TextDecoration.none
                            )
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                    decoration: BoxDecoration (
                        borderRadius: BorderRadius.all( Radius.circular(20)),
                        color: Colors.white,
                        //border: Border.all(width: 1),
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),*/
                )),*/
            Positioned(
              top: _height1,
              height: _height1,
              width: _width,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      //top: 10,
                      //bottom: (_height1*0.13)+7,
                        left: 13,
                        //right: 13,
                        width: (_width) - 26,
                        height: (_height1 - _height1 * 0.13),
                        child: Container(
                          /* child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage: AssetImage('assets/Group 7.png'),
                                    radius: 28.0,
                                  ) ,
                                  title: Text('Abcdef'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage: AssetImage('assets/Group 7.png'),
                                    radius: 28.0,
                                  ) ,
                                  title: Text('Abcdef'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage: AssetImage('assets/Group 7.png'),
                                    radius: 28.0,
                                  ) ,
                                  title: Text('Abcdef'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage: AssetImage('assets/Group 7.png'),
                                    radius: 28.0,
                                  ) ,
                                  title: Text('Abcdef'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage: AssetImage('assets/Group 7.png'),
                                    radius: 28.0,
                                  ) ,
                                  title: Text('Abcdef'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage: AssetImage('assets/Group 7.png'),
                                    radius: 28.0,
                                  ) ,
                                  title: Text('Abcdef'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage: AssetImage('assets/Group 7.png'),
                                    radius: 28.0,
                                  ) ,
                                  title: Text('Abcdef'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ],
                          ),
                      //color: Colors.red,
*/
                          child:FutureBuilder(
                                future: _businessList,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return snapshot.data.length == 0? Center(child: Text("No Business added yet")):ListView.builder(
                                    itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 8.0),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkHandler()
                                            .getImage(snapshot.data[index].businessName),
                                        radius: 28.0,
                                      ),
                                      title: Text(snapshot.data[index].businessName),
                                      trailing: Icon(
                                          Icons.arrow_forward_ios_rounded),
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ServiceMenu(
                                                      username: snapshot.data[index].businessName,
                                                      mobileNumber: snapshot.data[index].mobileNumber,
                                                    )),
                                                (route) => true);
                                      },
                                      onLongPress: (){
                                        setState(() {
                                          DatabaseHelper.instance.deleteBusiness(snapshot.data[index].id);
                                          _getBusinessList();
                                        });

                                      },
                                    ),
                                  );
                            },

                          );
                                }
                              ),
                        )),
                    Positioned(
                      bottom: 7,
                      left: 13,
                      height: _height1 * 0.13,
                      width: (_width) - 26,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LinkSearch(updateBusinessList: _getBusinessList),
                            ),
                          );
                        },
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)))),

                        // height:_height1*0.13,
                        //width: _width-100,
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: add_link_color,
                                  ),
                                ),
                                Text(" Add Business",
                                    style: TextStyle(
                                        color: add_link_color,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none)),
                              ],
                            )), /*
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: link_container_color),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LinkSearch extends StatefulWidget {
  final Function updateBusinessList;

  const LinkSearch({Key key, this.updateBusinessList})
      : super(key: key);
  @override
  _LinkSearchState createState() => new _LinkSearchState();
}

class _LinkSearchState extends State<LinkSearch> {
  NetworkHandler networkHandler = NetworkHandler();
  final _debouncer = DeBouncer(milliseconds: 500);
  Widget appBarTitle = new Text("Search");
  Icon actionIcon = new Icon(Icons.search);
  BusinessListModel profilelist = BusinessListModel();
  BusinessModel profileModel = BusinessModel();

  bool searching = false ;
  bool profiles = true ;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
      new AppBar(centerTitle: true,
          backgroundColor: Color(0xff1C396D) ,
          title: appBarTitle,
          actions: <Widget>[
            new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = new Icon(Icons.close);
                    this.appBarTitle = new TextField(
                      autofocus: true,
                      onChanged: (text) {
                        if(text.length!=0){
                          _debouncer.run(() async {
                            searching = true;
                            var response =
                                await networkHandler.get("/profile/search/$text");
                            setState(() {
                              profilelist =
                                  BusinessListModel.fromJson(response);
                              searching = false;
                            });
                            if (profilelist.data.length == 0) {
                              profiles = true;
                            }
                            else{profiles = false ;}
                          });
                        }
                      },
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search, color: Colors.white),
                          hintText: " Search...",
                          hintStyle: new TextStyle(color: Colors.white)),
                    );
                  } else {
                    this.actionIcon = new Icon(Icons.search);
                    this.appBarTitle = new Text("Search");
                  }
                });
              },
            ),
          ]),
      body: profilelist.data == null
          ? Center(
           child: searching ? CircularProgressIndicator(): SizedBox(),
      )
          : profiles ?Center(child: Text("No user with that name")):ListView.builder(
          itemBuilder: (context, index) {
            return
              /*InkWell(

            child: Container(
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
                              image: DecorationImage(
                                  image: NetworkHandler().getImage(profilelist.data[index].username),
                                  fit: BoxFit.contain),
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
                        child: Text(
                          profilelist.data[index].username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          xyz.add(profilelist.data[index].username);
                          /*Addbusinessmodel addbusiness = Addbusinessmodel(
                              business_name: profilelist.data[index].username
                          );

                          var response = await networkHandler.post1(
                              "/customer/Add", addbusiness.toJson());
                          print(response.body);
                          if (response.statusCode == 200 || response.statusCode == 201) {


                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                                    (route) => false);

                          }*/

                        },
                      )

                    ],
                  ),
                ],
              ),
            ),
          );*/

              Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkHandler()
                      .getImage(profilelist.data[index].username),
                  radius: 28.0,
                ),
                title: Text(profilelist.data[index].username),
                trailing: Icon(Icons.add),
                onTap: () {

                  BusinessName businessName = BusinessName(
                      businessName: profilelist.data[index].username, mobileNumber: profilelist.data[index].mobile_number);
                  DatabaseHelper.instance.insertBusiness(businessName);
                  widget.updateBusinessList();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                          (route) => false);
                },
              ),
            );
              },
        itemCount: profilelist.data == null ? 0 : profilelist.data.length,
      ),
    );
  }
}


_errorMessageDialog(BuildContext context, String label) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Attention'),
      content: Text('$label '),
      actions: [
        TextButton(
          child: Text('Ok'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    ));

class DeBouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  DeBouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
