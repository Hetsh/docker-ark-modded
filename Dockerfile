FROM hetsh/ark:313.35-1
ADD inflate inflate

ARG APP_ID=346110
ARG TMP_DIR="/tmp"
ARG MOD_DIR="ShooterGame/Content/Mods"
ARG CONTENT_DIR="$TMP_DIR/steamapps/workshop/content/$APP_ID"

# Structures Plus
ARG SP_ID=731604991
ARG SP_VER="20 Jun @ 7:34pm"
RUN steamcmd.sh +login anonymous +force_install_dir "$TMP_DIR" +workshop_download_item "$APP_ID" "$SP_ID" +quit && \
    find "$CONTENT_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \&\& rm {} {}.uncompressed_size \; && \
    mv "$CONTENT_DIR/$SP_ID" "$MOD_DIR/$SP_ID" && \
    inflate/modgen.sh "$MOD_DIR/$SP_ID"

RUN echo "ActiveMods=$SP_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini"
