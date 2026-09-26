<#
Local secrets are not stored here. Set DISCORD_BOT_TOKEN, DISCORD_USER_ID, and
DISCORD_SERVER_ID as environment variables, or create a gitignored run.secrets.ps1
next to this script that sets them - it will be picked up automatically if present.
#>
if (Test-Path "$PSScriptRoot\run.secrets.ps1") {
    . "$PSScriptRoot\run.secrets.ps1"
}

$env:DB_PATH = "./storage"
$env:RESOURCE_PATH = "./src/main/resources"
if (-not $env:WEBSITE_BASE_URL) { $env:WEBSITE_BASE_URL = "https://ti4.thecastle.dev" }

$jar_with_deps = "./target/TI4_map_generator_discord_bot-1.0-SNAPSHOT-jar-with-dependencies.jar"

if (-not $env:DISCORD_BOT_TOKEN -or -not $env:DISCORD_USER_ID -or -not $env:DISCORD_SERVER_ID) {
    throw "DISCORD_BOT_TOKEN, DISCORD_USER_ID, and DISCORD_SERVER_ID must be set (as environment variables, or in a local run.secrets.ps1)."
}

java -jar $jar_with_deps $env:DISCORD_BOT_TOKEN $env:DISCORD_USER_ID $env:DISCORD_SERVER_ID
