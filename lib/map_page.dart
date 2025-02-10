import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:flutter/cupertino.dart';

class Map_page extends StatelessWidget{
  Map_page({
   super.key
});
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return PageMaquinista(tittle: Text("Mapa"), body:
        SizedBox(
          width: screenWidth,
          height: screenHeight,
          child:
          InteractiveViewer(
            child: Image(image: AssetImage("assets/img/Plano.png")),
            boundaryMargin: EdgeInsets.all(0.0), // Optional: Margin around the content
            minScale: 1.0,  // Optional: Minimum scale (zoom out)
            maxScale: 10.0,  // Optional: Maximum scale (zoom in)
            scaleEnabled: true,  // Optional: Allow scaling (zooming)

          ),
        )
    );
  }
}