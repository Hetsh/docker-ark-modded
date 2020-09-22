FROM hetsh/ark:313.35-1
ADD inflate inflate

ARG APP_ID=346110
ARG TMP_DIR="/tmp"
ARG MOD_DIR="ShooterGame/Content/Mods"
ARG CONTENT_DIR="$TMP_DIR/steamapps/workshop/content/$APP_ID"

# Structures Plus
ARG SP_ID=731604991
ARG SP_VER="10 Jun @ 7:34pm"
RUN SRC_DIR="$CONTENT_DIR/$SP_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$SP_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$TMP_DIR" +workshop_download_item "$APP_ID" "$SP_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \&\& rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    inflate/modgen.sh "$DEST_DIR"

RUN echo "ActiveMods=$SP_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini"
