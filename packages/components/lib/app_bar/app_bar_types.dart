part of components;

class AppBarTypes {
  static PreferredSize appBarBack({
    List<double> iconMargin = const [0,10],
    List<double> titleMargin = const [0],
    String title = "",
    Color titleColor = textColor,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w600,
    required VoidCallback onPressed,
    String? fontFamily,
    List<Widget> children = const []
  }) {
    return PreferredSize(
      preferredSize: const Size(double.infinity,110),
      child: Box(
        bgColor: white,
        height:80,
        padding: const [0,0,20,0],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Box(
                margin: iconMargin,
                width: 50,
                child: Material(
                  color: white,
                  child: IconButton(icon: const Icon(Icons.arrow_back,color: iconColor,),onPressed: onPressed,),
                )
            ),
            Expanded(
              child: Label(
                margin: titleMargin,
                label: title,
                mainAxisAlignment: mainStart,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                color: titleColor,
              ),
            ),
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: children,
            )
          ],
        )
      )
    );
  }

  static Widget appBarEmpty() {
    return PreferredSize(
        preferredSize: const Size(double.infinity,300),
        child: Container(
          color: white,
          height: 100,
        )
    );
  }
}
