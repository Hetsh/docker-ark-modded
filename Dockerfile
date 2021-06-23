FROM hetsh/ark:2657385958587878602-2
ADD --chown=ark:ark inflate inflate
ARG APP_ID=346110
ARG DL_DIR="/tmp"
ARG CONTENT_DIR="$DL_DIR/steamapps/workshop/content/$APP_ID"
ARG MOD_DIR="ShooterGame/Content/Mods"
ARG JUNK_DIRS="/tmp/dumps $DL_DIR/steamapps /home/ark/.steam /home/ark/Steam"

# Olympus Map
ARG OLYMPUS_ID=970855993
ARG OLYMPUS_VER="1 Dec, 2020 @ 9:06am"
RUN SRC_DIR="$CONTENT_DIR/$OLYMPUS_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$OLYMPUS_ID" && \
    steamcmd.sh \
        +login anonymous \
        +force_install_dir "$DL_DIR" \
        +workshop_download_item "$APP_ID" "$OLYMPUS_ID" \
        +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Olympus"
ENV MAP="Olympus"

# Cleanup & Activation
RUN rm -r inflate && \
    echo "ActiveMapMod=$OLYMPUS_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini"
