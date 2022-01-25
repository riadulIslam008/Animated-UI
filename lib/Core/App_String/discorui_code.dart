// ignore: file_names
class Discordui {
  static const String code = '''
class DiscordUI extends StatefulWidget {
  const DiscordUI({Key? key}) : super(key: key);

  @override
  State<DiscordUI> createState() => _DiscordUIState();
}

class _DiscordUIState extends State<DiscordUI> {
  bool isStateChange = false;
  bool opacity = true;
  bool settingAction = false;
  Offset _offset = Offset(Get.width * 0.85, 0);
  double rightSidePadding = -Get.width * 0.85;
  bool _visiable = false;
  double dragStart = 0;
  double dragEnd = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyColor300,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Visibility(
                  visible: !_visiable,
                  child: AnimatedPositioned(
                    left: 0,
                    top: 0,
                    child: Container(
                        alignment: Alignment.center,
                        height: constraints.maxHeight,
                        width: constraints.maxWidth * 0.80,
                        decoration: const BoxDecoration(
                          color: AppColor.greyColor300,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child:
                            const Text("🤓", style: TextStyle(fontSize: 50))),
                    duration: const Duration(seconds: 2),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Stack(
                    children: [
                      Visibility(
                        visible: _visiable,
                        child: AnimatedPositioned(
                            left: constraints.maxWidth -
                                constraints.maxWidth *
                                    0.70, //constraints.maxWidth * 0.30
                            top: _offset.dy,
                            right: 0,
                            child: Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth * 0.70,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Text(
                                  "😋",
                                  style: TextStyle(fontSize: 50),
                                ),
                              ),
                            ),
                            duration: const Duration(milliseconds: 300)),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  left: _offset.dx,
                  top: 0,
                  right: -_offset.dx,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () {
                      if (_offset != Offset.zero) {
                        setState(() {
                          isStateChange = true;
                          rightSidePadding = 0;
                          _offset = Offset.zero;
                          settingAction = false;
                          opacity = false;
                        });
                        Future.delayed(const Duration(milliseconds: 320), () {
                          setState(() {
                            _visiable = false;
                          });
                        });
                      }
                    },
                    onHorizontalDragStart: (details) {
                      dragStart = details.globalPosition.dx;
                      setState(() {
                        opacity = false;
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      if (dragEnd <= dragStart && settingAction) {
                        setState(() {
                          rightSidePadding = constraints.maxWidth * 0.80;
                          _offset = Offset(-rightSidePadding, 0);
                          _visiable = true;
                        });
                        Future.delayed(const Duration(milliseconds: 350), () {
                          setState(() {
                            opacity = true;
                          });
                        });
                      } else if (_offset >=
                          Offset(constraints.maxWidth / 2, 0)) {
                        settingAction = false;
                        _visiable = false;
                        setState(() {
                          _offset = Offset(constraints.maxWidth * 0.85, 0);
                        });
                        Future.delayed(const Duration(milliseconds: 320), () {
                          setState(() {
                            opacity = true;
                          });
                        });
                        isStateChange = false;
                      } else if (_offset <=
                          Offset(constraints.maxWidth / 2, 0)) {
                        setState(() {
                          _offset = Offset.zero;
                          rightSidePadding = _offset.dx;
                          rightSidePadding = constraints.maxWidth * 0.80;

                          _visiable = false;
                        });
                        isStateChange = true;
                        Future.delayed(const Duration(milliseconds: 400), () {
                          settingAction = true;
                        });
                      }
                    },
                    onHorizontalDragUpdate: (details) {
                      dragEnd = details.globalPosition.dx;

                      setState(() {
                        if (details.globalPosition.dx <=
                            constraints.maxWidth * 0.85) {
                          _offset = Offset(details.globalPosition.dx, 0);
                        }
                      });
                    },
                    child: Opacity(
                      opacity: opacity ? 0.5 : 1,
                      child: Card(
                        elevation: isStateChange ? 10 : 0,
                        child: Container(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (!isStateChange) {
                                            opacity = false;
                                            _offset = const Offset(0, 0);
                                            rightSidePadding = _offset.dx;
                                            isStateChange = !isStateChange;
                                            opacity = false;
                                          } else {
                                            _offset =
                                                Offset(Get.width * 0.85, 0);
                                            rightSidePadding = _offset.dx;
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 350), () {
                                              setState(() {
                                                opacity = true;
                                              });
                                            });
                                            isStateChange = !isStateChange;
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                          AppIcon.menuIcon), //Icons.menu
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: IconButton(
                                        onPressed: () {
                                          if (!settingAction) {
                                            settingAction = true;
                                            setState(() {
                                              rightSidePadding =
                                                  constraints.maxWidth * 0.80;
                                              _offset =
                                                  Offset(-rightSidePadding, 0);
                                              _visiable = true;
                                            });
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 350), () {
                                              setState(() {
                                                opacity = true;
                                              });
                                            });
                                          } else {
                                            setState(() {
                                              rightSidePadding = 0;
                                              _offset = Offset.zero;
                                              settingAction = false;
                                              opacity = false;
                                            });
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 320), () {
                                              setState(() {
                                                _visiable = false;
                                              });
                                            });
                                          }
                                        },
                                        icon: const Icon(
                                            AppIcon.peopleIcon), //Icons.people
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: constraints.maxHeight / 2 - 80,
                                ),
                                const Text(
                                  "🤟",
                                  style: TextStyle(fontSize: 50),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: !isStateChange
          ? AnimatedSize(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.home),
                    Icon(Icons.home),
                    Icon(Icons.home),
                    Icon(Icons.home),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
  ''';
}
