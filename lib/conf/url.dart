
abstract class URL {

  //官网
  static const String HOST = "https://irocn.cn";
  static const String DB_HOST ="http://db.irocn.com";


  //BaseURls
  static const String BASE_URL = "http://192.168.2.6:7890/api/";
//  static const String BASE_URL="http://192.168.1.140:8888/api/";
  static const String BASE_URL1 = "http://elastic:irocn.com@db.irocn.com:9001";

  static const String BASE_URL3 = "http://192.168.99.181:8899/api/";


  //获取登陆验证码
  static const String LOGIN_CODE = "/loginbycodeSms";

  //获取注册验证码
  static const String REGISTER_CODE = "/getRegSms";

  //获取重置密码验证码
  static const String PASSWORD_RESET_CODE = "/resetPwdSms";

  //获取注册验证码
  static const String LOGIN_SMS = "/getLoginSms";
  //账号密码登陆
  static const String LOGIN = "/login";
  //退出
  static const String LOGOUT = '/logout';
  //获得文章
  static const String ARTICLE = "/article";
  //获得文章列表
  static const String ARTICLE_LIST = "/articleList";
  //点👍
  static const String THUMB_UP = "/thumbUp";
  //点👎
  static const String THUMB_DOWN = "/thumbDown";
  //收藏文章
  static const String SAVE_ARTICLE = "/saveArticle";
  //关注公众号
  static const String FOLLOW_OFFICIAL_ACCOUNTS = "/followofficialAccounts";
  //刷新用户状态
  static const String USER_STATUS = "/userStatus";
  //获得ss配置
  static const String SS_CONFIG = "/ssConfig";
  //用户收藏列表
  static const String SAVED_ARTICLE_LIST = "/savedArticleList";
  //用户IP产品列表
  static const String IP_PRODUCT_LIST = "/ipProductList";
  //用户IP产品购买记录
  static const String PAY_LIST_IP_PRODUCT = "/payListIpProduct";
  //微信预支付请求
  static const String PRE_ORDER_REQ = "/preOrderReq";
  //微信预支付请求
  static const String QUERY_ORDER = "/queryOrder";
  //ss有效验证
  static const String SS_VALID_CHECK = "/ssValidCheck";


  //短消息登陆
  static const String LOGIN_BY_SMS = "/loginbycode";

  //注册
  static const String REGISTER = "/reg";

  //重置密码
  static const String PASSWORD_RESET = "/resetPwd";

  //用户信息
  static const String USER_INFO = "/getUserInfo";

  //矿机信息
  static const String MINER_INFO = "/getMinerInfo";

  //单台矿机信息
  static const String SINGLE_MINER_INFO = "/getSingleMinerInfo";

  //修改矿机信息
  static const String MINER_INFO_MODIFY = "/updateMinerInfo";

  //添加矿机
  static const String MINER_ADD = "/addMiner";

  //删除矿机
  static const String MINER_DEL = "/deleteMiner";

  //获得用户矿机数量
  static const String MINER_COUNT = "/getMinerCount";

  //获得用户收益
  static const String USER_INCOMING = "/getIncoming";

  //用户信息修改
  static const String USER_INFO_MODEFY = "/changeUserInfo";

  //运行信息
  static const String MINER_RUN_INFO = "/getRunInfo";

  //提现
  static const String WITHDRAW = "/getWithdraw";

  //获取平台推送
  static const String PLAT_NOTICE= "/getNotice";

  //获取filecoin信息
  static const String FILECOIN_INFO = "/getIndustryInfo";

  static const String FILECOIN_PRICE = "/getFileCoinPrice";

  static const String FILECOIN_AMOUNT = "/getFileCoinAmount";

}
