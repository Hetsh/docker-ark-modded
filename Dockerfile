FROM hetsh/ark:7329082409271706020-1
ADD inflate inflate
ARG APP_ID=346110
ARG TMP_DIR="/tmp"
ARG CONTENT_DIR="$TMP_DIR/steamapps/workshop/content/$APP_ID"
ARG MOD_DIR="ShooterGame/Content/Mods"

# Structures Plus
ARG SP_ID=731604991
ARG SP_VER="10 Jun @ 7:34pm"
RUN SRC_DIR="$CONTENT_DIR/$SP_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$SP_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$TMP_DIR" +workshop_download_item "$APP_ID" "$SP_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r "$TMP_DIR/steamapps" && \
    inflate/modgen.sh "$DEST_DIR" "Structures Plus (Open Source)"

# Bridge
ARG BRIDGE_ID=558651608
ARG BRIDGE_VER="23 Mar, 2018 @ 1:50pm"
RUN SRC_DIR="$CONTENT_DIR/$BRIDGE_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$BRIDGE_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$TMP_DIR" +workshop_download_item "$APP_ID" "$BRIDGE_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r "$TMP_DIR/steamapps" && \
    inflate/modgen.sh "$DEST_DIR" "Bridge"

# Cleanup and activation
RUN echo "ActiveMods=$SP_ID,$BRIDGE_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini"
