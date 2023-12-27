import 'package:flutter/material.dart';

class SwipePage extends StatelessWidget {
  const SwipePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 600),
            SwipeButton(
                autoCompleteFraction: 0.7,
                tileBorderRadius: 4,
                tilewidth: screenWidth * 0.5,
                iconBgColor: const Color(0xFF0079C2),
                swipeContainerColors: const [
                  Color(0XFF006099),
                  Color(0XFF007ECC)
                ],
                amountText: 'Slide to Pay \$6,000',
                amountTileColor: const Color(0xFF1D5273)),
          ],
        ),
      ),
    );
  }
}

class SwipeButton extends StatefulWidget {
  const SwipeButton(
      {super.key,
      required this.amountText,
      required this.tilewidth,
      required this.tileBorderRadius,
      required this.amountTileColor,
      this.autoCompleteFraction = 0.7,
      required this.iconBgColor,
      required this.swipeContainerColors});

  final String amountText;
  final double tilewidth;
  final double tileBorderRadius;
  final double autoCompleteFraction;
  final Color amountTileColor;
  final Color iconBgColor;
  final List<Color> swipeContainerColors;

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  final double _tileHeight = 50;
  bool _onIconPressed = false;
  bool _isSwipeCompleted = false;

  late AnimationController _controller;
  late Animation<double> _widthTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _widthTween = Tween<double>(
      begin: 50.0,
      end: widget.tilewidth - 10,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _buttonState(bool isPressed) =>
      setState(() => _onIconPressed = isPressed);

  void _changeButtonState() {
    if (_controller.value > widget.autoCompleteFraction) {
      _controller.value = 1;
      _onSwipeCompleted();
      _debugMessage('Swipe Complete');
    } else {
      _controller.value = 0;
      _debugMessage('Moved to Initial');
      _buttonState(false);
    }
  }

  void _onSwipeCompleted() {
    setState(() {
      _isSwipeCompleted = true;
    });
  }

  void _onDragEnd(DragEndDetails? details) {
    _changeButtonState();
  }

  void _dragUpdateDetails(DragUpdateDetails details) {
    if (details.primaryDelta! > 0 && _widthTween.value < widget.tilewidth) {
      _controller.value += details.primaryDelta! / widget.tilewidth;
    }
  }

  void _debugMessage(String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double expectedwidth = screenWidth - 30;
    assert(widget.tilewidth <= expectedwidth,
        'Widget width should be lesser than screen width');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(children: [
          Container(
            height: _tileHeight,
            width: widget.tilewidth,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: widget.amountTileColor,
                borderRadius: BorderRadius.circular(widget.tileBorderRadius)),
          ),
          GestureDetector(
              onTapDown: (_) => _buttonState(true),
              onTapUp: (_) => _buttonState(false),
              onHorizontalDragEnd: _onDragEnd,
              onHorizontalDragUpdate: _dragUpdateDetails,
              child: IgnorePointer(
                  ignoring: _isSwipeCompleted,
                  child: _onIconPressed
                      ? _SwipeSliderBaseContainer(
                          borderRadius: widget.tileBorderRadius,
                          tileheight: _tileHeight,
                          swipeContainerColors: widget.swipeContainerColors,
                          controller: _controller,
                          widthTween: _widthTween)
                      : InitialStaticIcon(
                          iconBgColor: widget.iconBgColor,
                          borderRadius: widget.tileBorderRadius,
                        ))),
          _BaseTextTile(widget.amountText,
              tileHeight: _tileHeight, tileWidth: widget.tilewidth),
          if (_onIconPressed)
            _MovableIcon(
              controller: _controller,
              widthTween: _widthTween,
              borderRadius: widget.tileBorderRadius,
              iconHeight: _tileHeight,
              isSwipeCompleted: _isSwipeCompleted,
            ),
        ]),
      ],
    );
  }
}

class _SwipeSliderBaseContainer extends StatelessWidget {
  const _SwipeSliderBaseContainer(
      {required AnimationController controller,
      required Animation<double> widthTween,
      required this.tileheight,
      required this.borderRadius,
      required this.swipeContainerColors})
      : _controller = controller,
        _widthTween = widthTween;

  final AnimationController _controller;
  final Animation<double> _widthTween;
  final List<Color> swipeContainerColors;
  final double tileheight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: tileheight,
            width: _widthTween.value,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: swipeContainerColors),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          );
        });
  }
}

class _MovableIcon extends StatelessWidget {
  const _MovableIcon(
      {required AnimationController controller,
      required Animation<double> widthTween,
      required this.iconHeight,
      required this.isSwipeCompleted,
      required this.borderRadius})
      : _controller = controller,
        _widthTween = widthTween;

  final AnimationController _controller;
  final Animation<double> _widthTween;
  final double iconHeight;
  final double borderRadius;
  final bool isSwipeCompleted;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: iconHeight,
            width: 60,
            margin: EdgeInsets.only(left: _widthTween.value - 40),
            decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: isSwipeCompleted
                    ? BorderRadius.all(Radius.circular(borderRadius))
                    : BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        bottomLeft: Radius.circular(borderRadius))),
            child: const Icon(Icons.double_arrow_rounded, color: Colors.white),
          );
        });
  }
}

class _BaseTextTile extends StatelessWidget {
  const _BaseTextTile(this.text,
      {required this.tileHeight, required this.tileWidth});

  final String text;
  final double tileHeight;
  final double tileWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileWidth,
      height: tileHeight,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class InitialStaticIcon extends StatelessWidget {
  const InitialStaticIcon(
      {super.key, required this.borderRadius, required this.iconBgColor});
  final double borderRadius;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 52,
      margin: const EdgeInsets.only(left: 15, top: 5),
      decoration: BoxDecoration(
          color: iconBgColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: const Icon(Icons.double_arrow_rounded, color: Colors.white),
    );
  }
}
