FROM hetsh/ark:8956532803988215674-1
ADD --chown=ark:ark inflate inflate
ARG APP_ID=346110
ARG DL_DIR="/tmp"
ARG CONTENT_DIR="$DL_DIR/steamapps/workshop/content/$APP_ID"
ARG MOD_DIR="ShooterGame/Content/Mods"
ARG JUNK_DIRS="/tmp/dumps $DL_DIR/steamapps /home/ark/.steam /home/ark/Steam"

# Structures Plus
ARG SP_ID=731604991
ARG SP_VER="7 Jan @ 6:01pm"
RUN SRC_DIR="$CONTENT_DIR/$SP_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$SP_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$SP_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Structures Plus (Open Source)"

# Bridge
ARG BRIDGE_ID=558651608
ARG BRIDGE_VER="23 Mar, 2018 @ 1:50pm"
RUN SRC_DIR="$CONTENT_DIR/$BRIDGE_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$BRIDGE_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$BRIDGE_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Bridge"

# Castles, Keeps and Forts: Remastered
ARG CKFR_ID=1814953878
ARG CKFR_VER="28 Feb, 2020 @ 2:11pm"
RUN SRC_DIR="$CONTENT_DIR/$CKFR_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$CKFR_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$CKFR_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Castles, Keeps, and Forts: Remastered"

# Castles, Keeps and Forts: Science Fiction
ARG CKFSF_ID=2121156303
ARG CKFSF_VER="8 Jun, 2020 @ 7:52pm"
RUN SRC_DIR="$CONTENT_DIR/$CKFSF_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$CKFSF_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$CKFSF_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Castles, Keeps, and Forts: Science Fiction"

# Super Spyglass
ARG SSG_ID=793605978
ARG SSG_VER="24 Jan, 2018 @ 1:15pm"
RUN SRC_DIR="$CONTENT_DIR/$SSG_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$SSG_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$SSG_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Super Spyglass (Open Source)"

# eco's Trees
ARG ET_ID=670764308
ARG ET_VER="18 Aug, 2020 @ 7:18am"
RUN SRC_DIR="$CONTENT_DIR/$ET_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$ET_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$ET_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "eco Trees"

# eco's Garden Decor
ARG EGD_ID=880871931
ARG EGD_VER="25 Oct, 2020 @ 8:50am"
RUN SRC_DIR="$CONTENT_DIR/$EGD_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$EGD_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$EGD_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "eco's Garden Decor"

# eco's Role Play Decor
ARG ERPD_ID=741203089
ARG ERPD_VER="21 Oct, 2020 @ 7:58am"
RUN SRC_DIR="$CONTENT_DIR/$ERPD_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$ERPD_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$ERPD_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "eco's RP Decor"

# Rare Sightings
ARG RS_ID=1300713111
ARG RS_VER="17 Apr, 2019 @ 8:11pm"
RUN SRC_DIR="$CONTENT_DIR/$RS_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$RS_ID" && \
    steamcmd.sh +login anonymous +force_install_dir "$DL_DIR" +workshop_download_item "$APP_ID" "$RS_ID" +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Rare Sightings"

# Cleanup & Activation
RUN rm -r inflate && \
    echo "ActiveMods=$SP_ID,$BRIDGE_ID,$CKFR_ID,$CKFSF_ID,$SSG_ID,$ET_ID,$EGD_ID,$ERPD_ID,$RS_ID" >> "ShooterGame/Config/DefaultGameUserSettings.ini"
