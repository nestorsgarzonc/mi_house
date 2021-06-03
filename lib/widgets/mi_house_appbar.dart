import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiHouseButton {
  final VoidCallback onPressed;
  final IconData icon;
  final String name;

  MiHouseButton(
      {required this.onPressed, required this.icon, required this.name});
}

class MiHouseAppbar extends StatelessWidget {
  final List<MiHouseButton> items = [
    MiHouseButton(
        name: 'Inicio',
        icon: Icons.home,
        onPressed: () {
          print('item 1');
        }),
    MiHouseButton(
        name: 'Reservas',
        icon: Icons.calendar_today,
        onPressed: () {
          print('item 2');
        }),
    MiHouseButton(
        name: 'otros',
        icon: Icons.settings_cell,
        onPressed: () {
          print('item 3');
        }),
    MiHouseButton(
        name: 'Mudanzas',
        icon: Icons.airport_shuttle,
        onPressed: () {
          print('item 4');
        }),
    MiHouseButton(
        name: 'Información',
        icon: Icons.info,
        onPressed: () {
          print('item 5');
        }),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height.round();
    final width = MediaQuery.of(context).size.width.round();
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => new _MiHouseProvider(),
        child: _MiHouseMenuBackground(
          width: width,
          height: height,
          child: _MiHouseItems(items),
        ),
      ),
    );
  }
}

class _MiHouseMenuBackground extends StatelessWidget {
  final int width;
  final int height;
  final Widget child;

  _MiHouseMenuBackground(
      {required this.width, required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: width * 0.20,
      height: height * 1.0,
      decoration: BoxDecoration(
          color: Color(0xff0288d1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0))),
    );
  }
}

class _MiHouseItems extends StatelessWidget {
  final List<MiHouseButton> mihouseitems;

  _MiHouseItems(this.mihouseitems);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(mihouseitems.length,
            (index) => _MiHouseMenuButton(index, mihouseitems[index])));
  }
}

class _MiHouseMenuButton extends StatelessWidget {
  final int index;
  final MiHouseButton item;

  _MiHouseMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado =
        Provider.of<_MiHouseProvider>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MiHouseProvider>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          color: (itemSeleccionado == index) ? Color(0xffb2ebf2) : Colors.white,
          size: (itemSeleccionado == index) ? 40 : 35,
        ),
      ),
    );
  }
}

class _MiHouseProvider with ChangeNotifier {
  int _itemSeleccionado = 0;
  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}
