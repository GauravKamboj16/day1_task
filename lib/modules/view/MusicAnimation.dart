 
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class MusicVisulaizer extends StatelessWidget{
  List<Color> colors=[Colors.redAccent,Colors.blueAccent,Colors.greenAccent,Colors.amberAccent,Colors.white];
  List<int> duration=[700,900,600,400,600];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Music waves animation'),
        centerTitle: true,
        
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:List<Widget>.generate(10, (index) => MusicAnimation(color:colors[index%5] , duration: duration[index%5],)),
          ),
          SizedBox(height: 22,),
          Image.network('https://th.bing.com/th/id/OIP.jAnCeU5gASh3ZxOO6A1FTgHaHw?pid=ImgDet&w=840&h=880&rs=1',
          height: 300,
          width: 300,),
          SizedBox(height: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:List<Widget>.generate(10, (index) => MusicAnimation(color:colors[index%5] , duration: duration[index%5],)),
          ),
        ],
      ),
    );
  }

}

class MusicAnimation extends StatefulWidget  {
  final int duration;
  final Color color;
  const MusicAnimation({super.key, required this.duration, required this.color});

  @override
  State<MusicAnimation> createState() => _MusicAnimationState();
}

class _MusicAnimationState extends State<MusicAnimation> with SingleTickerProviderStateMixin{
  Animation<double>? animation;
  late AnimationController animController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController=AnimationController(duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation=CurvedAnimation(parent: animController, curve: Curves.easeIn);

    animation=Tween<double>(begin: 0,end: 100).animate(curvedAnimation)..addListener(() {
      setState(() {
      });
     });
     animController.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: animation!.value,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(22)
      ),
    );
  }
}