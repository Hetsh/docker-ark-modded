FROM hetsh/ark

# Mods
ARG APP_ID=346110
ARG MOD_ID=731604991
RUN steamcmd.sh +login anonymous +force_install_dir "$(pwd)" +workshop_download_item "$APP_ID" "$MOD_ID" +quit

ADD inflate inflate
RUN TMP_DIR="steamapps/workshop/content/$APP_ID/$MOD_ID/WindowsNoEditor" && \
    find "$TMP_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    MOD_DIR="ShooterGame/Content/Mods/$MOD_ID" && \
    mv "$TMP_DIR" "$MOD_DIR" && \
    inflate/modgen.sh "$MOD_DIR" && \
    echo "ActiveMods=$MOD_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini" && \
    rm -r "steamapps"
