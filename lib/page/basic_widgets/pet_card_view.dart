import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {

  final PetCardViewModel data;

  const PetCard({Key key, this.data}) : super(key: key);
  //封面图
  Widget renderCover(){
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8)
        ),
        child: Image.network(data.coverUrl,height: 200,fit: BoxFit.fitWidth),
      );
  }

  //用户信息
  Widget renderUserInfo(){
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFCCCCCC),
                backgroundImage: NetworkImage(data.userImgUrl),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.userName,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color:Color(0xFF333333)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    data.description,
                    style: TextStyle(
                        fontSize: 12,
                        color:Color(0xFF999999)
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            data.publishTime,
            style: TextStyle(
                fontSize: 12,
                color:Color(0xFF999999)
            ),
          )
        ],
      ),
    );
  }

  //发布信息
  Widget renderPublishContent(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFFFC600),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8)
              )
            ),
            child: Text(
              data.topic,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            data.publishContent,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13
            ),
          )
        ],
      ),
    );
  }

  //互动区域
  Widget renderInteractionArea(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          renderInteractionAreaItem(Icons.message, 15, Color(0xFF999999),'${data.replies}'),
          renderInteractionAreaItem(Icons.favorite, 15, Color(0xFFFFC660),'${data.likes}'),
          renderInteractionAreaItem(Icons.share, 15, Color(0xFF999999),'${data.shares}'),
        ],
      ),
    );
  }

  Widget renderInteractionAreaItem(IconData icon,double size,Color color,String text){
    return Row(
      children: <Widget>[
        Icon(icon,size:size,color:color,),
        Padding(padding: EdgeInsets.only(left: 6)),
        Text(text,style: TextStyle(
              fontSize: 13,
              color: Colors.black12
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(this.data.publishContent);
      },
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 4,
                  color: Color.fromARGB(20, 0, 0, 0)
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            this.renderCover(),
            this.renderUserInfo(),
            this.renderPublishContent(),
            this.renderInteractionArea()
          ],
        ),
      ),
    );
  }
}
class PetCardViewModel {
  /// 封面地址
  final String coverUrl;

  /// 用户头像地址
  final String userImgUrl;

  /// 用户名
  final String userName;

  /// 用户描述
  final String description;

  /// 话题
  final String topic;

  /// 发布时间
  final String publishTime;

  /// 发布内容
  final String publishContent;

  /// 回复数量
  final int replies;

  /// 喜欢数量
  final int likes;

  /// 分享数量
  final int shares;

  const PetCardViewModel({
    this.coverUrl,
    this.userImgUrl,
    this.userName,
    this.description,
    this.topic,
    this.publishTime,
    this.publishContent,
    this.replies,
    this.likes,
    this.shares,
  });
}

