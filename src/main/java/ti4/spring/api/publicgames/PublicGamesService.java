package ti4.spring.api.publicgames;

import java.util.List;
import org.springframework.stereotype.Service;
import ti4.game.persistence.GameManager;
import ti4.game.persistence.ManagedGame;

@Service
class PublicGamesService {

    static List<PublicGameSummary> getPublicGames() {
        return GameManager.getManagedGames().stream()
                .filter(ManagedGame::isActive)
                .filter(managedGame -> !managedGame.isFowMode())
                .map(managedGame -> new PublicGameSummary(managedGame.getName()))
                .toList();
    }
}
