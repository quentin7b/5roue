import 'package:five_wheel/services/auth.service.dart';
import 'package:five_wheel/services/game.service.dart';
import 'package:five_wheel/services/session.service.dart';
import 'package:five_wheel/services/supabase/supabase_auth.service.dart';
import 'package:five_wheel/services/supabase/supabase_game.service.dart';
import 'package:five_wheel/services/supabase/supabase_session.service.dart';
import 'package:five_wheel/services/supabase/supabase_user.service.dart';
import 'package:five_wheel/services/user.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final _supabaseClientProvider = StateProvider(
  (ref) => Supabase.instance.client,
);

final authServiceProvider = StateProvider<AuthService>(
  (ref) => SupabaseAuthService(ref.read(_supabaseClientProvider)),
);

final userServiceProvider = Provider<UserService>(
  (ref) => SupabaseUserService(ref.read(_supabaseClientProvider)),
);

final gameServiceProvider = Provider<GameService>(
  (ref) => SupabaseGameService(ref.read(_supabaseClientProvider)),
);

final sessionServiceProvider = Provider<SessionService>(
  (ref) => SupabaseSessionService(ref.read(_supabaseClientProvider)),
);
