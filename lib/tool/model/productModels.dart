class ProductModel{
  String title;
  String description;
  String img;
  String price;
  String tag;
  bool isBatery;

  ProductModel(this.title, this.description, this.img, this.price, this.tag, this.isBatery);

}

List<ProductModel> products = [
  ProductModel("IPV6校园网体验套餐 (只能购买一次)",
      "IPV6校园网体验套餐，7天流量随便用，并赠送5点积分！",
      "assets/images/5.png", "5.00",
      "img1",
      false
  ),

  ProductModel("IPV6校园网高级套餐 (流量不限制)",
      "IPV6校园网高级套餐，30天流量随便用，并赠送30点积分！",
      "assets/images/25.png", "25.00",
      "img2",
      false
  ),

  ProductModel("IPV6校园网至尊套餐 (流量不限制)",
      "IPV6校园网至尊套餐，季度流量随便用，并赠送90点积分！",
      "assets/images/65.png", "65.00",
      "img3",
      false),

  ProductModel("VPN网络高级套餐",
      "VPN网络高级套餐，30天随意翻墙！不想被墙？那就试试吧！并赠送20点积分",
      "assets/images/65.png", "20.00",
      "img4",
      false),

  ProductModel("VPN网络至尊套餐",
      "VPN网络至尊套餐，3个月随意翻墙！不想被墙？那就试试吧！并赠送60点积分",
      "assets/images/65.png", "50.00",
      "img5",
      false),
];