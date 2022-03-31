import 'dart:async';
import 'dart:convert';

import 'package:binance_game_app_single/binance_game_app/constant/constant.dart';
import 'package:binance_game_app_single/binance_game_app/handler/message_handler.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/invocation_model.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/countdown_request.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/heartbeat_request.dart';
import 'package:binance_game_app_single/binance_game_app/model/ws/message/heartbeat_response.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/base/base_view_model.dart';
import 'package:binance_game_app_single/binance_game_app/view_model/ws/handler/countdown_response_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'handler/heartbeat_response_handler.dart';

// WebSocket地址
final String _SOCKET_URL = 'ws://${Constant.domainUrl}:8888/ws';

/// WebSocket状态
enum SocketStatus {
  SocketStatusConnected, // 已连接
  SocketStatusFailed, // 失败
  SocketStatusClosed, // 连接关闭
}


class WsViewModel extends BaseViewModel {


  /// 单例对象
  static WsViewModel _wsViewModel;

  static Map<String,MessageHandler> handlers;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  WsViewModel._();

  /// 获取单例内部方法
  factory WsViewModel() {
    // 只能有一个实例
    if (_wsViewModel == null) {
      _wsViewModel = new WsViewModel._();
    }
    return _wsViewModel;
  }




  IOWebSocketChannel _webSocket; // WebSocket
  SocketStatus _socketStatus; // socket状态
  Timer _heartBeat; // 心跳定时器
  num _heartTimes = 10000; // 心跳间隔(毫秒)
  num _reconnectCount = 10; // 重连次数，默认60次
  num _reconnectTimes = 0; // 重连计数器
  Timer _reconnectTimer; // 重连定时器
  Function onError; // 连接错误回调
  Function onOpen; // 连接开启回调
  Function onMessage; // 接收消息回调



  /// 初始化WebSocket
  void initWebSocket({Function onOpen, Function onMessage, Function onError}) {
    this.onOpen = onOpen;
    this.onMessage = onMessage;
    this.onError = onError;
    openSocket();
  }


  /// 开启WebSocket连接
  void openSocket() {
    closeSocket();
    _webSocket = IOWebSocketChannel.connect("ws://${Constant.domainUrl}:8888/ws");
    print('WebSocket连接成功: ws://${Constant.domainUrl}:8888/ws');
    // 连接成功，返回WebSocket实例
    _socketStatus = SocketStatus.SocketStatusConnected;
    // 连接成功，重置重连计数器
    _reconnectTimes = 0;
    if (_reconnectTimer != null) {
      _reconnectTimer.cancel();
      _reconnectTimer = null;
    }
    onOpen();
    // 接收消息
    _webSocket.stream.listen((data) => webSocketOnMessage(data),
        onError: webSocketOnError, onDone: webSocketOnDone);
  }




  /// WebSocket接收消息回调
  webSocketOnMessage(data) {
    onMessage(data);
  }

  /// WebSocket关闭连接回调
  webSocketOnDone() {
    print('closed');
    reconnect();
  }

  /// WebSocket连接错误回调
  webSocketOnError(e) {
    WebSocketChannelException ex = e;
    _socketStatus = SocketStatus.SocketStatusFailed;
    onError(ex.message);
    closeSocket();
  }

  /// 初始化心跳
  void initHeartBeat() {
    destroyHeartBeat();
    _heartBeat =
    new Timer.periodic(Duration(milliseconds: _heartTimes), (timer) {
      sentHeart();
    });
  }

  /// 心跳
  void sentHeart() {
    HeartbeatRequest heartbeatRequest = HeartbeatRequest();
    InvocationModel invocationModel = InvocationModel(
      type: HeartbeatRequest.TYPE,
      message: heartbeatRequest
    );
    sendMessage(invocationModel.toJson().toString());
  }

  /// 销毁心跳
  void destroyHeartBeat() {
    if (_heartBeat != null) {
      _heartBeat.cancel();
      _heartBeat = null;
    }
  }

  /// 关闭WebSocket
  void closeSocket() {
    if (_webSocket != null) {
      print('WebSocket连接关闭');
      _webSocket.sink.close();
      destroyHeartBeat();
      _socketStatus = SocketStatus.SocketStatusClosed;
    }
  }

  /// 发送WebSocket消息
  void sendMessage(message) {
    if (_webSocket != null) {
      switch (_socketStatus) {
        case SocketStatus.SocketStatusConnected:
          print('发送中：' + message);
          _webSocket.sink.add(message);
          break;
        case SocketStatus.SocketStatusClosed:
          print('连接已关闭');
          break;
        case SocketStatus.SocketStatusFailed:
          print('发送失败');
          break;
        default:
          break;
      }
    }
  }

  /// 重连机制
  void reconnect() {
    if (_reconnectTimes < _reconnectCount) {
      _reconnectTimes++;
      _reconnectTimer =
      new Timer.periodic(Duration(milliseconds: _heartTimes), (timer) {
        openSocket();
      });
    } else {
      if (_reconnectTimer != null) {
        print('重连次数超过最大次数');
        _reconnectTimer.cancel();
        _reconnectTimer = null;
      }
      return;
    }
  }













}
