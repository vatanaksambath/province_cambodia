import 'package:flutter/material.dart';
import 'package:province_cambodia/model/provinceContent.dart';
import 'package:province_cambodia/screen/districtDetail.dart';

class ProvinceDetail extends StatefulWidget {
  final provinceName;
  final east;
  final west;
  final south;
  final north;
  final indexNum;
  final image;

  ProvinceDetail(
      {Key key,
      this.provinceName,
      this.east,
      this.south,
      this.west,
      this.north,
      this.indexNum,
      this.image})
      : super(key: key);

  @override
  _ProvinceDetailState createState() => _ProvinceDetailState();
}

class _ProvinceDetailState extends State<ProvinceDetail> {
  var save = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Province Detail',
          ),
        ),
        body: ListView(
          children: [
            _imageHeader(),
            _provinceTitle(),
            _provinceDetail(),
            _boundaryDetail(),
            _districtDetail(),
          ],
        )
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => DistrictDetail(
        //             index: 1,
        //           ),
        //         ),
        //       );
        //     },
        //     child: Text('asd'),
        //   ),
        // ),
        );
  }

  Widget _imageHeader() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 260,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        save < 1
                            ? Container(
                                width: 42,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Center(
                                  child: IconButton(
                                    iconSize: 26.0,
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        save = 1;
                                      });
                                    },
                                  ),
                                ),
                              )
                            : Container(
                                width: 42,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: IconButton(
                                  iconSize: 26.0,
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      save = 0;
                                    });
                                  },
                                ),
                              ),
                      ],
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }

  Widget _provinceTitle() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          //box shadow of login button
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.location_on,
                size: 35,
                color: Color(0xff4C9BE2),
              )),
          SizedBox(
            width: 20,
          ),
          Text(
            widget.provinceName,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.grey[800],),
          ),
        ],
      ),
    );
  }

  Widget _provinceDetail() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          //box shadow of login button
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 12.0, top: 12.0),
                        child: Icon(
                          Icons.description,
                          size: 30,
                          color: Color(0xff4C9BE2),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 12.0, top: 12.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1.5,
            indent: 8,
            endIndent: 8,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Banteay Meanchey is a province of Cambodia located in the far northwest. It borders the provinces of Oddar Meanchey and Siem Reap to the east, Battambang to the south, and shares an international border with Thailand to the west. Its capital and largest city is Serei Saophoan.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boundaryDetail() {
    return Container(
        //color: Theme.of(context).accentColor,
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: <BoxShadow>[
            //box shadow of login button
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.explore_sharp,
                    size: 35,
                    color: Color(0xff4C9BE2),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Boundary',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1.5,
              indent: 8,
              endIndent: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.explore_outlined,
                        size: 24,
                        color: Color(0xff4C9BE2),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'East',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.explore_outlined,
                        size: 24,
                        color: Color(0xff4C9BE2),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'West',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.east,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.west,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 18.0, right: 10.0),
                      child: Icon(
                        Icons.explore_outlined,
                        size: 24,
                        color: Color(0xff4C9BE2),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'South',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 16.5, top: 10.0, bottom: 10.0, right: 10.0),
                      child: Icon(
                        Icons.explore_outlined,
                        size: 24,
                        color: Color(0xff4C9BE2),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'North',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.south,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.north,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1.5,
              indent: 8,
              endIndent: 8,
            ),
          ],
        ));
  }

  Widget _districtDetail() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          //box shadow of login button
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          var num = int.parse(widget.indexNum);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DistrictDetail(
                index: num - 1,
                provinceName: widget.provinceName,
              ),
            ),
          );
          // print(num);
          // print(num - 1);
        },
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 10.0),
          child: Row(
            children: [
              Row(
                children: [
                  // Icon(Icons.location_on_outlined, size: 40, color: Color(0xff263882),),
                  Text(
                    'View district of ' + widget.provinceName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_right_alt,
                size: 40,
                color: Color(0xff263882),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
