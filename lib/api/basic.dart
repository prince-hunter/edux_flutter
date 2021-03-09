//TODO: this is for pltf interface

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:edux_app/model/basic/follow.dart';
import 'package:edux_app/model/basic/saved_article.dart';
import 'package:edux_app/model/error.dart';
import 'package:edux_app/utiles/logger.dart';

import '../model/basic/article.dart';
import "../model/basic/article_list.dart";
import "../model/basic/code.dart";
import "../model/basic/login.dart";
import "../model/basic/logout.dart";
import "../model/basic/user_status.dart";
import "../model/basic/thumb.dart";
import "../model/basic/save_article.dart";
import "../dioHelper/dio_helper.dart";
import "../conf/url.dart";
import "jwt.dart";

import 'dart:io';
Dio dio = DioHelper().dio;

Future<CodeResp> getCode(String phone) async {
  CodeReq req = CodeReq();
  req.phone = phone;

  try {
    Response respData;
    respData = await dio.post(
      URL.LOGIN_SMS,
      data: req.toJson(),
    );
    return CodeResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.LOGIN_SMS);
    logger.e(e.toString());
  }
}

login(String username, String code,String decideInfo) async {
  LoginReq req = LoginReq();
  LoginReqForClaim loginReqForClaim = LoginReqForClaim();
  loginReqForClaim.user_name = username;
  loginReqForClaim.code = code;
  req.user_name = username;
  req.token = JWT.createTokenString(loginReqForClaim.toJson()).token;
  req.device_info = "abcdef";

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.LOGIN,
      data: req.toJson(),
    );

    return UserStatusResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.LOGIN);
    logger.e(e.toString());
  }

  UserStatusResp loginResp = UserStatusResp();
  loginResp.err = Error() as Error;
  loginResp.err.code = 300;
  loginResp.err.desc = "连接断开";

  UserStatusResp b = UserStatusResp();
  if (b.err != null) {
    b.err.code = 0;
  }
  return loginResp;
}

logout(String token) async {
  LogoutReq req = LogoutReq();
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.LOGOUT,
      data: req.toJson(),
    );

    return LogoutResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.ARTICLE_LIST);
    logger.e(e.toString());
  }
  return LogoutResp();
}

refreshUserStatus(String userId, String token) async {
  UserStatusReq req = UserStatusReq();
  req.user_id = userId;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.USER_STATUS,
      data: req.toJson(),
    );

    return UserStatusResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.USER_STATUS);
    logger.e(e.toString());
  }

  return UserStatusResp();
}

Future<ArticleListResp> refreshArticleList(String userId, String date, String token, int count) async {
  ArticleListReq req = ArticleListReq();
  req.user_id = userId;
  req.date = date;
  req.count = count;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.ARTICLE_LIST,
      data: req.toJson(),
    );

    return ArticleListResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.USER_STATUS);
    logger.e(e.toString());
  }

  return ArticleListResp();
}

getArticle(String userId, String articleId, String token) async {
  ArticleReq req = ArticleReq();
  req.user_id = userId;
  req.article_id = articleId;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.ARTICLE,
      data: req.toJson(),
    );

    return ArticleResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.USER_STATUS);
    logger.e(e.toString());
  }

  return ArticleResp();
}

//👍
thumbUp(String userId, String articleId, String token, bool check) async {
  ThumbUp req = ThumbUp();
  req.article_id = articleId;
  req.user_id = userId;
  req.check = check;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.THUMB_UP,
      data: req.toJson(),
    );

    return ThumbResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.THUMB_UP);
    logger.e(e.toString());
  }

  return ThumbResp();
}

//👎
thumbDown(String userId, String articleId, String token, bool check) async {
  ThumbDown req = ThumbDown();
  req.article_id = articleId;
  req.user_id = userId;
  req.check = check;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.THUMB_DOWN,
      data: req.toJson(),
    );

    return ThumbResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.THUMB_DOWN);
    logger.e(e.toString());
  }

  return ThumbResp();
}


//收藏
saveArticle(String userId, String articleId, bool check) async {
  SaveArticleReq req = SaveArticleReq();
  req.article_id = articleId;
  req.user_id = userId;
  req.check = check;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.SAVE_ARTICLE,
      data: req.toJson(),
    );

    return SaveArticleResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.SAVE_ARTICLE);
    logger.e(e.toString());
  }
}

//关注
followofficialAccounts(String userId, String officialAccountsID, bool check) async {
  FollowOfficialAccountsReq req = FollowOfficialAccountsReq();
  req.official_accounts_id = officialAccountsID;
  req.user_id = userId;
  req.check = check;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.FOLLOW_OFFICIAL_ACCOUNTS,
      data: req.toJson(),
    );

    return SaveArticleResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.FOLLOW_OFFICIAL_ACCOUNTS);
    logger.e(e.toString());
  }
}

savedArticleList(String userId, String date, String token, int count) async {
  SavedArticleListReq req = SavedArticleListReq();
  req.user_id = userId;
  req.date = date;
  req.count = count;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.SAVED_ARTICLE_LIST,
      data: req.toJson(),
    );

    return SavedArticleListResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.SAVED_ARTICLE_LIST);
    logger.e(e.toString());
  }

  return ArticleListResp();
}
