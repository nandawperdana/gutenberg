import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) =>
      events.debounce(duration, leading: true).switchMap(mapper);
}

EventTransformer<Event> throttle<Event>(
  Duration duration, {
  bool trailing = false,
}) =>
    (events, mapper) => events
        .throttle(duration, trailing: trailing)
        .distinct()
        .switchMap(mapper);
