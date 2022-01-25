class CurvedUI {
  static const String code = '''
class BackGroundUI extends StatelessWidget {
  const BackGroundUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const CustomeAppBar(
         pageName: "",
         uiCode: "",
       ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(color: AppColor.blurGrey),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(88),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.70,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(color: AppColor.whiteColor),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColor.blurGrey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(88),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
  ''';
}
