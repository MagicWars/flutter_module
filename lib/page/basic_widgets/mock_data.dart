import 'package:flutter/material.dart';
import 'credit_card.dart';
import 'pet_card_view.dart';

/// 信用卡mock数据
const CreditCardViewModel creditCardData = CreditCardViewModel(
  bankName: '招商银行',
  bankLogoUrl: 'assets/pics/bank_zs.png',
  cardType: '储蓄卡',
  cardNumber: '6210  ****  ****  1426',
  cardColors: [Color(0xFFF17B68), Color(0xFFE95F66)],
  validDate: '10/27',
);

const PetCardViewModel petCardViewModel = PetCardViewModel(
  coverUrl: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1425538345,901220022&fm=26&gp=0.jpg',
  userImgUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg',
  userName: '大米要煮小米粥',
  description: '小米 | 我家的小仓鼠',
  publishTime: '2020年7月30日16:20:52',
  topic: '# 萌宠小屋',
  publishContent: '今天带着小VIVI去了爪子生活体验馆，好多好玩的小东西都想带回家！哪里的人说话又好听，哎哟个个都是人才，超喜欢他们的就跟回家一样。',
  replies: 356,
  likes: 258,
  shares: 126,
);
