import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //! to get screen's height and width
    // MediaQuery.sizeOf(context).width;
    // MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: Text('Container widget')),
      body: Center(
        child: Container(
          //! to set the Container's height
          height: 300,
          //! to set the Container's width
          width: 300,
          //! to set [padding] for content inside Container
          // padding: EdgeInsets.all(20),
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 20),
          //! to set [margin] outside Container
          margin: EdgeInsets.all(20),
          //! to set alignment for the Container's child
          alignment: Alignment.center,
          //! to set decoration like (border, radius, color...etc)
          decoration: BoxDecoration(
            //! Assets or Network
            // image: DecorationImage(
            //   fit: BoxFit.scaleDown, //! maximum size = it's size, it can be smaller
            //   opacity: 1,
            //   image: AssetImage(AppImages.garden),
            // ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://www.bhg.com/thmb/NH1GNLelBIaF3dSqp_jR3-S61Ww=/1100x0/filters:no_upscale():strip_icc()/garden-path-leading-underneath-trellis-roses-ccab4820-bf659328e5044d0ba639f1c48c3ab66a.jpg",
              ),
            ),
            //! to set the Container's color
            color: Colors.red,
            //! you can use it for [gradient], you have [Radial & Linear] gradient
            // gradient: LinearGradient(
            //   colors: [Colors.red, Colors.blue, Colors.green],
            // ),
            gradient: RadialGradient(
              colors: [Colors.red, Colors.blue, Colors.green],
            ),
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey, spreadRadius: 10),
              BoxShadow(blurRadius: 5, color: Colors.blue, spreadRadius: 5),
            ],
            //! for [raduis] you can use [BorderRadius] like this:
            //! [BorderRadius.circular] for [all] sides
            //! [BorderRadius.horizontal] for [right] side and [left] side
            //! [BorderRadius.vertical] for [top] side and [bottom] side
            //! [BorderRadius.only] for any side alone
            borderRadius: BorderRadius.circular(15),
            // borderRadius: BorderRadius.horizontal(
            //   left: Radius.circular(30),
            //   right: Radius.circular(10),
            // ),
            // borderRadius: BorderRadius.vertical(
            //   top: Radius.circular(30),
            //   bottom: Radius.circular(10),
            // ),
            // borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            // borderRadius: BorderRadius.all(Radius.circular(15)),
            //! to set [border] you can use [Border] like this:
            //! [Border.all] for [all] sides
            //! [Border.symmetric] for [horizontal] side and [vertical] side
            //! [Border()] for any side alone
            border: Border.all(color: Colors.black, width: 2),
            // border: Border.symmetric()
            // border: Border(
            //   bottom: BorderSide(color: Colors.blue, width: 3),
            //   top: BorderSide(color: Colors.black, width: 3),
            //   left: BorderSide(),
            //   right: BorderSide(),
            // ),
            //! if you want the Container  to be [circle] or [rectangle]
            // shape: BoxShape.circle,
          ),
          // child: Container(color: Colors.deepOrange, height: 200, width: 200),
        ),
      ),
    );
  }
}
