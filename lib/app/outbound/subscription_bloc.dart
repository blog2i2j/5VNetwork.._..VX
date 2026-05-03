// Copyright (C) 2026 5V Network LLC <5vnetwork@proton.me>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift/remote.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vx/app/outbound/outbound_repo.dart';
import 'package:vx/app/outbound/subscription.dart';
import 'package:vx/data/database.dart';
import 'package:vx/main.dart';
import 'package:vx/utils/logger.dart';
import 'package:vx/utils/random.dart';

sealed class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();

  @override
  List<Object> get props => [];
}

class UpdateSubscriptionsButtonClickedEvent extends SubscriptionEvent {}

class UpdateSubscriptionEvent extends SubscriptionEvent {
  const UpdateSubscriptionEvent(this.sub);
  final Subscription sub;
}

class AddSubscriptionEvent extends SubscriptionEvent {
  const AddSubscriptionEvent(this.name, this.link);
  final String name;
  final String link;
}

class SubscriptionEditedEvent extends SubscriptionEvent {
  const SubscriptionEditedEvent({
    required this.id,
    this.name,
    this.link,
    this.shareLinkQueryExtra,
  });
  final int id;
  final String? name;
  final String? link;
  final String? shareLinkQueryExtra;
}

class SubscriptionState extends Equatable {
  const SubscriptionState({
    this.updatingAll = false,
    this.updatingSubs = const {},
  });

  SubscriptionState copyWith({bool? updatingAll, Set<int>? updatingSubs}) {
    return SubscriptionState(
      updatingAll: updatingAll ?? this.updatingAll,
      updatingSubs: updatingSubs ?? this.updatingSubs,
    );
  }

  @override
  List<Object> get props => [updatingAll, updatingSubs];

  final bool updatingAll;
  final Set<int> updatingSubs;
}

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc(this._outboundRepo, this._subscriptionUpdater)
    : super(const SubscriptionState()) {
    on<AddSubscriptionEvent>(_addSubscirption);
    on<SubscriptionEditedEvent>(_subEditted);
    on<UpdateSubscriptionsButtonClickedEvent>(_updateAllSubs);
    on<UpdateSubscriptionEvent>(_updateSub);
  }

  final OutboundRepo _outboundRepo;
  final AutoSubscriptionUpdater _subscriptionUpdater;

  Future<void> _subEditted(
    SubscriptionEditedEvent e,
    Emitter<SubscriptionState> emit,
  ) async {
    final newSub = await _outboundRepo.updateSubscription(
      e.id,
      name: e.name,
      link: e.link,
      shareLinkQueryExtra: e.shareLinkQueryExtra,
    );
    if (e.link != null || e.shareLinkQueryExtra != null) {
      final newSet = Set<int>.from(state.updatingSubs);
      emit(state.copyWith(updatingSubs: newSet..add(e.id)));
      try {
        await _subscriptionUpdater.updateSub(newSub.id);
      } finally {
        final newSet = Set<int>.from(state.updatingSubs);
        emit(state.copyWith(updatingSubs: newSet..remove(e.id)));
      }
    }
  }

  Future<void> _updateSub(
    UpdateSubscriptionEvent e,
    Emitter<SubscriptionState> emit,
  ) async {
    final newSet = Set<int>.from(state.updatingSubs);
    emit(state.copyWith(updatingSubs: newSet..add(e.sub.id)));
    try {
      await _subscriptionUpdater.updateSub(e.sub.id);
    } finally {
      final newSet = Set<int>.from(state.updatingSubs);
      emit(state.copyWith(updatingSubs: newSet..remove(e.sub.id)));
    }
  }

  Future<void> _updateAllSubs(
    UpdateSubscriptionsButtonClickedEvent e,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(state.copyWith(updatingAll: true));
    try {
      await _subscriptionUpdater.updateAllSubs();
    } finally {
      emit(state.copyWith(updatingAll: false));
    }
  }

  Future<void> _addSubscirption(
    AddSubscriptionEvent e,
    Emitter<SubscriptionState> emit,
  ) async {
    final s = SubscriptionsCompanion(
      id: Value(SnowflakeId.generate()),
      name: Value(e.name),
      link: Value(e.link),
      website: const Value(""),
      description: const Value(""),
      lastUpdate: const Value(0),
      lastSuccessUpdate: const Value(0),
    );
    Subscription? sub;
    try {
      sub = await _outboundRepo.insertSubscription(s);
      final newSet = Set<int>.from(state.updatingSubs);
      emit(state.copyWith(updatingSubs: newSet..add(sub.id)));
      await _subscriptionUpdater.updateSub(sub.id);
    } on DriftRemoteException catch (e) {
      if (e.remoteCause is SqliteException &&
          (e.remoteCause as SqliteException).extendedResultCode == 2067) {
        snack(rootLocalizations()?.failedToAddSubscription);
      }
    } catch (e) {
      logger.d('addSubscirption error', error: e);
    } finally {
      final newSet = Set<int>.from(state.updatingSubs);
      emit(state.copyWith(updatingSubs: newSet..remove(sub?.id)));
    }
  }
}
