import 'package:jogadores_da_copa/app/core/modules/jogadores_da_copa_module.dart';
import 'package:jogadores_da_copa/app/modules/home/home_controller.dart';
import 'package:jogadores_da_copa/app/modules/home/home_page.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository_impl.dart';
import 'package:jogadores_da_copa/app/services/player/player_service.dart';
import 'package:jogadores_da_copa/app/services/player/player_service_impl.dart';
import 'package:provider/provider.dart';

class HomeModule extends JogadoresDaCopaModule {
  HomeModule()
      : super(
          bindings: [
            Provider<PlayerRepository>(
              create: (context) => PlayerRepositoryImpl(
                restClient: context.read(),
                log: context.read(),
              ),
            ),
            Provider<PlayerService>(
              create: (context) => PlayerServiceImpl(
                playerRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => HomeController(
                playerService: context.read(),
              ),
            ),
          ],
          routers: {
            '/home': (context) => HomePage(
                  homeController: context.read(),
                ),
          },
        );
}
