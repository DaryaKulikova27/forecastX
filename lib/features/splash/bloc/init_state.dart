part of 'init_bloc.dart';

sealed class InitState {}

final class InitInitial implements InitState {}

final class InitialComleted implements InitState {}

final class InitialFirstOpenComleted implements InitState {}

// final class NoNotificationPermissionState implements InitState {}

// final class NoNetworkState implements InitState {}

// final class ServerNotAwailableState implements InitState {
//   final Map<String, dynamic>? data;

//   ServerNotAwailableState({required this.data});
// }
