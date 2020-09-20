FROM hetsh/ark

# Mods
ARG APP_ID=346110
ARG MOD_ID=731604991
RUN steamcmd.sh +login anonymous +force_install_dir "$(pwd)" +workshop_download_item "$APP_ID" "$MOD_ID" +quit

ADD --chown=ark:ark 731604991.mod ShooterGame/Content/Mods/731604991.mod
ADD inflate/inflate.sh inflate.sh
RUN TMP_DIR="steamapps/workshop/content/$APP_ID/$MOD_ID/WindowsNoEditor" && \
    find "$TMP_DIR" -type f -name "*.z" -exec ./inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$TMP_DIR" "ShooterGame/Content/Mods/$MOD_ID" && \
    rm -r "steamapps" && \
    echo "ActiveMods=$MOD_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini" 
    
