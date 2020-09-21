FROM hetsh/ark
ADD inflate inflate

# Structures Plus
ARG SP_ID=731604991
ARG MOD_UPDATE="10 June @ 7:34pm"
RUN MOD_DIR="ShooterGame/Content/Mods/$SP_ID" && \
    DL_DIR="steamapps/workshop/content/$APP_ID/$SP_ID/WindowsNoEditor" && \
    steamcmd.sh +login anonymous +force_install_dir "$(pwd)" +workshop_download_item "$APP_ID" "$SP_ID" +quit && \
    find "$DL_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$DL_DIR" "$MOD_DIR" && \
    inflate/modgen.sh "$MOD_DIR"

RUN rm -r "steamapps" && \
    echo "ActiveMods=$SP_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini"
