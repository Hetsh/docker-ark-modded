FROM hetsh/ark

# Mods
ARG APP_ID=346110
ARG MOD_ID=731604991
RUN steamcmd.sh +login anonymous +force_install_dir "$(pwd)" +workshop_download_item "$APP_ID" "$MOD_ID" +quit && \
    mv "steamapps/workshop/content/$APP_ID/$MOD_ID" "ShooterGame/Content/Mods" && \
    rm -r "steamapps" && \
    echo "ActiveMods=$MOD_ID" > "ShooterGame/Config/DefaultGameUserSettings.ini"
