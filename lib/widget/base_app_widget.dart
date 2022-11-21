import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/connectivity_service.dart';
import '../util/no_internet_dialog.dart';
import 'custom_progress_bar.dart';


abstract class FiduServiceFullWidget<T> extends StatefulWidget {}

abstract class FiduService<T extends FiduServiceFullWidget> extends State<T> {
  StreamSubscription? _connectionChangeStream;

  bool isOffline = false;
  @override
  void initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);

  }
  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
      _showNoInternet(isOffline);
    });
  }


  void _showNoInternet(bool isOffline) {
    if (isOffline) {
      setState(() {
        showNoInternetDialog(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  /* @override
  void dispose() {
    super.dispose();
    setDialogStatus(false);
  }*/

  Widget buildBody() {
    return Container();
  }

  showProgress(BuildContext context) {
    if (mounted) {
      setState(() {
        FiduProgressDialog.instance.showProgressDialog(context);
      });
    }
  }

  dismissProgress(BuildContext context) {
    if (mounted) {
      setState(() {
        FiduProgressDialog.instance.dismissDialog(context);
      });
    }
  }
}
