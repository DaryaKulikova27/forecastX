part of 'init_bloc.dart';

sealed class InitEvent {}

final class InitAppEvent extends InitEvent {}

final class InitShowLoaderEvent extends InitEvent {}
