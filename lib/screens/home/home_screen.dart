import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final items = [
    _ListItem( Color(0xff02253D)), //0xff6EB5FF
    _ListItem( Color(0xff7498B6)), //0xffACE7FF
    _ListItem( Color(0xff365B77)), //0xff85E3FF
    _ListItem( Color(0xff94B8D7)), //0xffC4FAF8
    _ListItem( Color(0xff02253D)),
    _ListItem( Color(0xff7498B6)),
    _ListItem( Color(0xff365B77)),
    _ListItem( Color(0xff94B8D7)),
    _ListItem( Color(0xff02253D)),
    _ListItem( Color(0xff7498B6)),
    _ListItem( Color(0xff365B77)),
    _ListItem( Color(0xff94B8D7)),
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView (
          slivers:<Widget>[
            SliverPersistentHeader(
              floating: true,
              delegate: _SliverAppBar(
                minHeight: 150,
                maxHeight: 200,
                child: Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        ExactAssetImage('assets/images/home/bienvenido.png'),
                        fit: BoxFit.cover,
                  ),
                )
                )
              )
            ),

            SliverList(
              delegate: SliverChildListDelegate(items
              ) 
            )

          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF02152B), //e1f5fe
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_stories,
                size: 35,
                color: Colors.white,
              ),
              label: '',
              ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apartment,
                size: 35,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
              Icons.assignment_rounded,
              size: 35,
              color: Colors.white,
              ),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget{

  final items = [
    _ListItem( Color(0xff02253D)),
    _ListItem( Color(0xff7498B6)),
    _ListItem( Color(0xff365B77)),
    _ListItem( Color(0xff94B8D7)),
    _ListItem( Color(0xff02253D)),
    _ListItem( Color(0xff7498B6)),
    _ListItem( Color(0xff365B77)),
    _ListItem( Color(0xff94B8D7)),
    _ListItem( Color(0xff02253D)),
    _ListItem( Color(0xff7498B6)),
    _ListItem( Color(0xff365B77)),
    _ListItem( Color(0xff94B8D7)),
  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>items[index]
);
  }
}

class _ListItem extends StatelessWidget {
  
  final Color color;

  const _ListItem(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width : 100,
      margin : EdgeInsets.all(10),
      decoration: BoxDecoration(
        color : color,
        borderRadius: BorderRadius.circular(20)
      ),
      
    );
  }
}

class _SliverAppBar extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;
  
  
  _SliverAppBar({required this.minHeight, required this.maxHeight, required this.child});


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      // TODO: implement build
      return SizedBox.expand(child: child);
    }
  
    @override
    // TODO: implement maxExtent
    double get maxExtent => maxHeight;
  
    @override
    // TODO: implement minExtent
    double get minExtent => minHeight;
  
    @override
    bool shouldRebuild(_SliverAppBar  oldDelegate) {
      return maxHeight != oldDelegate.maxHeight ||
            minHeight != oldDelegate.minHeight ||
             child != oldDelegate.child;
    }
}