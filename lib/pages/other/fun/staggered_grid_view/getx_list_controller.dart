import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class GetxListController extends GetxController {
  /// 列表数据
  List data = [];

  /// 刷新控制器
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  /// 页码
  var page = 1;

  /// 下拉刷新
  onRefresh() {
    page = 1;
    queryData();
  }

  /// 上拉加载
  onLoading() {
    page++;
    queryData();
  }

  /// 网络请求方法
  queryData();

  /// 请求成功方法
  successActionWithObjects(List data) {
    // 下拉刷新
    if (page == 1) {
      if (data.isEmpty) {
        // refreshController.loadNoData();
        refreshController.refreshCompleted();
      } else {
        this.data = data;
        update();
        refreshController.refreshCompleted();
      }
      refreshController.resetNoData();
    }
    // 上拉加载
    else {
      if (data.isEmpty) {
        refreshController.loadNoData();
      } else {
        this.data.addAll(data);
        update();
        refreshController.loadComplete();
      }
    }
  }

  /// 请求失败方法
  failureAction() {
    if (page == 1) {
      refreshController.refreshFailed();
    } else {
      refreshController.loadFailed();
      page--;
    }
  }
}
