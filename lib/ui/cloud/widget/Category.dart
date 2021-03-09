import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double tpx = MediaQuery.of(context).size.height / 750;
    return Container(
      padding: EdgeInsets.all(20 * rpx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KindBtn(
                image: "assets/images/hot.png",
                type: 1,
                icon: "assets/images/liuxing.png",
                title: "流行",
              ),
              KindBtn(
                image: "assets/images/game.png",
                type: 2,
                icon: "assets/images/youxi.png",
                title: "游戏",
              ),
              KindBtn(
                image: "assets/images/fashion.png",
                type: 3,
                icon: "assets/images/shishang.png",
                title: "时尚",
              ),
              KindBtn(
                image: "assets/images/show.png",
                type: 4,
                icon: "assets/images/zhibo.png",
                title: "直播",
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KindBtn(
                image: "assets/images/music.png",
                type: 5,
                icon: "assets/images/yinle.png",
                title: "音乐",
              ),
              KindBtn(
                image: "assets/images/news.png",
                type: 6,
                icon: "assets/images/xinwen.png",
                title: "新闻",
              ),
              KindBtn(
                image: "assets/images/learning.png",
                type: 7,
                icon: "assets/images/xuexi.png",
                title: "学习",
              ),
              KindBtn(
                image: "assets/images/sport.png",
                type: 8,
                icon: "assets/images/tiyu.png",
                title: "体育",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class KindBtn extends StatefulWidget {
  final String image;
  final int type;
  final String icon;
  final String title;

  const KindBtn({Key key, this.image, this.type, this.icon, this.title})
      : super(key: key);

  @override
  _KindBtnState createState() => _KindBtnState();
}

class _KindBtnState extends State<KindBtn> {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double tpx = MediaQuery.of(context).size.height / 750;
    return Container(
      height: 50 * tpx,
      width: 345 * rpx,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(widget.image),
          )),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(icon: Image.asset(widget.icon), onPressed: null),
              SizedBox(width: 30 * rpx),
              Text(widget.title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 30 * rpx),
            ],
          )),
    );
  }
}
