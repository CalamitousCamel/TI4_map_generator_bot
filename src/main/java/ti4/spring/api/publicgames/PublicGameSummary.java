package ti4.spring.api.publicgames;

import com.fasterxml.jackson.annotation.JsonProperty;

public record PublicGameSummary(@JsonProperty("MapName") String mapName) {}
