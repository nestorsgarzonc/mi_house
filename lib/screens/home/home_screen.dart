import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mi_house/widgets/mi_house_appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height.round();
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: width * 0.20,
                child: MiHouseAppbar(),
              ),
              Container(
                width: width * 0.80,
                child: MenuHouse(),
                /** 
                child: GridView.count(
                  crossAxisCount: 1,
                  children: <Widget>[
                    Container(
                      child: Text('Holi'),
                    )
                  ],
                ),*/
              )
            ],
          ),
        ),
        //body: MenuHouse(),
      ),
    );
  }
}

class MenuHouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) => new Container(
          margin: EdgeInsets.all(5.5),
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: new Center(
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('$index'),
            ),
          )),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2.5 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
