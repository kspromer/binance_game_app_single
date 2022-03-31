// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:binance_game_app_single/binance_game_app/constant/theme_colors.dart';
// import 'package:binance_game_app_single/binance_game_app/handler/message_handler.dart';
// import 'package:binance_game_app_single/binance_game_app/model/ws/invocation_model.dart';
// import 'package:binance_game_app_single/binance_game_app/model/ws/message/countdown_request.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_assets/home_assets_pages.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_bet_record/home_bet_record_pages.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_btc/home_btc_pages.dart';
// import 'package:binance_game_app_single/binance_game_app/pages/home_eth/home_eth_pages.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/auth/auth_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/btc/btc_lucky_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/eth/eth_lucky_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/user/user_view_model.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/countdown_response_handler.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/heartbeat_response_handler.dart';
// import 'package:binance_game_app_single/binance_game_app/view_model/ws/ws_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
//
// class HomePages extends StatefulWidget {
//
//   static const routeName = '/homePages';
//
//   const HomePages({Key key}) : super(key: key);
//
//   @override
//   _HomePagesState createState() => _HomePagesState();
// }
//
// class _HomePagesState extends State<HomePages> {
//
//   int _current = 3;
//
//
//
//
//
//
//   List<Widget> _body;
//   HomeBtcPages _homeBtcPages;
//   HomeEthPages _homeEthPages;
//   HomeBetRecordPages _homeBetRecordPages;
//   HomeAssetsPages _homeAssetsPages;
//
//   List<Function> _appbars;
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_){
//       AuthViewModel authViewModel = Provider.of<AuthViewModel>(context,listen: false);
//       authViewModel.accountById();
//
//       UserViewModel userViewModel = Provider.of<UserViewModel>(context,listen: false);
//       userViewModel.user();
//
//       BtcLuckyViewModel btcLuckyViewModel = Provider.of<BtcLuckyViewModel>(context,listen: false);
//       btcLuckyViewModel.btcLuckyBanker();
//       btcLuckyViewModel.btcLuckyBetType();
//       btcLuckyViewModel.btcLuckyCurrentIssueData();
//       btcLuckyViewModel.btcLuckyHistory();
//
//
//       EthLuckyViewModel ethLuckyViewModel = Provider.of<EthLuckyViewModel>(context,listen: false);
//       ethLuckyViewModel.ethLuckyBanker();
//       // ethLuckyViewModel.ethLuckyBetType();
//       // ethLuckyViewModel.ethLuckyCurrentIssueData();
//       // ethLuckyViewModel.ethLuckyHistory();
//
//       WsViewModel _wsViewModel = Provider.of<WsViewModel>(context,listen: false);
//       _wsViewModel.initWebSocket(
//           onOpen: (){
//             _wsViewModel.initHeartBeat();
//             //handler容器
//             WsViewModel.handlers = Map();
//             HeartbeatResponseHandler handler = Provider.of<HeartbeatResponseHandler>(context,listen: false);
//             CountdownResponseHandler countdownResponseHandler = Provider.of<CountdownResponseHandler>(context,listen: false);
//             //设置handler
//             WsViewModel.handlers[handler.getType()] = handler;
//             WsViewModel.handlers[countdownResponseHandler.getType()] = countdownResponseHandler;
//
//             countdownResponseHandler.streamController.stream.listen((event) {
//               if(event == 1) {
//                 Future.delayed(Duration(seconds: 6),(){
//                   btcLuckyViewModel.btcLuckyBanker();
//                   btcLuckyViewModel.btcLuckyBetType();
//                   btcLuckyViewModel.btcLuckyCurrentIssueData();
//                   btcLuckyViewModel.btcLuckyHistory();
//                 });
//               }
//             });
//             InvocationModel invocationModel = InvocationModel()..type = CountdownRequest.TYPE;
//             _wsViewModel.sendMessage(invocationModel.toJson().toString());
//           },
//           onMessage: (data) {
//             debugPrint(data);
//             InvocationModel invocationModel = InvocationModel.fromJson(jsonDecode(data));
//             MessageHandler handler = WsViewModel.handlers[invocationModel.type];
//             handler.execute(_wsViewModel,invocationModel.message);
//           }
//       );
//     });
//
//     _homeBtcPages = HomeBtcPages();
//     _homeEthPages = HomeEthPages();
//     _homeBetRecordPages = HomeBetRecordPages();
//     _homeAssetsPages = HomeAssetsPages();
//
//     _body  = [
//       _homeBtcPages,
//       _homeEthPages,
//       _homeBetRecordPages,
//       _homeAssetsPages,
//     ];
//     _appbars = [
//       _homeBtcPages.appBar,
//       _homeEthPages.appBar,
//       _homeBetRecordPages.appBar,
//       _homeAssetsPages.appBar,
//     ];
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appbars[_current](context),
//       backgroundColor: ThemeColors.COLOR_F7F7F7,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _current,
//         onTap: (index) {
//           setState(() {
//             _current = index;
//           });
//         },
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             label: "比特币",
//             icon: Image.asset("binance_game_app_assets/images/btc_nav_icon.png"),
//             activeIcon: Image.asset("binance_game_app_assets/images/btc_nav_on_icon.png"),
//           ),
//           BottomNavigationBarItem(
//             label: "以太坊",
//             icon: Image.asset("binance_game_app_assets/images/eth_nav_icon.png"),
//             activeIcon: Image.asset("binance_game_app_assets/images/eth_nav_on_icon.png"),
//           ),
//           BottomNavigationBarItem(
//             label: "注单",
//             icon: Image.asset("binance_game_app_assets/images/bet_record_nav_icon.png"),
//             activeIcon: Image.asset("binance_game_app_assets/images/bet_record_nav_on_icon.png"),
//           ),
//           BottomNavigationBarItem(
//             label: "资产",
//             icon: Image.asset("binance_game_app_assets/images/assets_nav_icon.png"),
//             activeIcon: Image.asset("binance_game_app_assets/images/assets_nav_on_icon.png"),
//           ),
//         ],
//       ),
//       body: _body[_current],
//     );
//   }
// }
