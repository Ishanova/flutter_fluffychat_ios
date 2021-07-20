import 'package:flutter/cupertino.dart';


class TabIndicator extends Decoration {
  final BoxPainter _painter;

  TabIndicator({@required Color color, @required double radius})
      : _painter = _IndicatorPainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _IndicatorPainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _IndicatorPainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Rect rectangle = Rect.fromCenter(center: offset +
        Offset(
            cfg.size.width / 2,
            cfg.size.height - 2
        ),
        width: cfg.size.width - 32,
        height: 2);
    canvas.drawRRect(RRect.fromRectXY(rectangle, 2, 2), _paint);
  }
}