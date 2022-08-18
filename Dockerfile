FROM hetsh/ark:8804792971477472447-1
COPY --chown="ark":"ark" "inflate" "inflate"
ARG APP_ID=346110
ARG DL_DIR="/tmp"
ARG CONTENT_DIR="$DL_DIR/steamapps/workshop/content/$APP_ID"
ARG MOD_DIR="ShooterGame/Content/Mods"
ARG JUNK_DIRS="/tmp/dumps $DL_DIR/steamapps /home/ark/.steam /home/ark/Steam"

# Olympus Map
ARG MAP_ID=970855993
ARG MAP_VER="7 Jul @ 6:03pm"
RUN SRC_DIR="$CONTENT_DIR/$MAP_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$MAP_ID" && \
    steamcmd.sh \
        +login anonymous \
        +force_install_dir "$DL_DIR" \
        +workshop_download_item "$APP_ID" "$MAP_ID" \
        +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Olympus"

# Structures Plus
ARG SP_ID=731604991
ARG SP_VER="22 Aug, 2021 @ 6:08pm"
RUN SRC_DIR="$CONTENT_DIR/$SP_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$SP_ID" && \
    steamcmd.sh \
        +login anonymous \
        +force_install_dir "$DL_DIR" \
        +workshop_download_item "$APP_ID" "$SP_ID" \
        +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Structures Plus (S+)"

# Sleepable Beds
ARG SB_ID=1650069767
ARG SB_VER="8 Mar, 2021 @ 1:53am"
RUN SRC_DIR="$CONTENT_DIR/$SB_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$SB_ID" && \
    steamcmd.sh \
        +login anonymous \
        +force_install_dir "$DL_DIR" \
        +workshop_download_item "$APP_ID" "$SB_ID" \
        +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Sleep able bed"

# Classic Flyers
ARG CF_ID=895711211
ARG CF_VER="27 Feb, 2020 @ 5:28pm"
RUN SRC_DIR="$CONTENT_DIR/$CF_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$CF_ID" && \
    steamcmd.sh \
        +login anonymous \
        +force_install_dir "$DL_DIR" \
        +workshop_download_item "$APP_ID" "$CF_ID" \
        +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Classic Flyers"

# Rare Sightings
ARG RS_ID=1300713111
ARG RS_VER="17 Apr, 2019 @ 8:11pm"
RUN SRC_DIR="$CONTENT_DIR/$RS_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$RS_ID" && \
    steamcmd.sh \
        +login anonymous \
        +force_install_dir "$DL_DIR" \
        +workshop_download_item "$APP_ID" "$RS_ID" \
        +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Rare Sightings"

# Immersive Taming
ARG IT_ID=1251632107
ARG IT_VER="18 Jul, 2021 @ 1:09pm"
RUN SRC_DIR="$CONTENT_DIR/$IT_ID/WindowsNoEditor" && \
    DEST_DIR="$MOD_DIR/$IT_ID" && \
    steamcmd.sh \
        +login anonymous \
        +force_install_dir "$DL_DIR" \
        +workshop_download_item "$APP_ID" "$IT_ID" \
        +quit && \
    find "$SRC_DIR" -type f -name "*.z" -exec inflate/inflate.sh {} \; -exec rm {} {}.uncompressed_size \; && \
    mv "$SRC_DIR" "$DEST_DIR" && \
    rm -r $JUNK_DIRS && \
    inflate/modgen.sh "$DEST_DIR" "Immersive Taming"

# Cleanup & Activation
RUN rm -r inflate && \
    INI_FILE="ShooterGame/Config/DefaultGameUserSettings.ini" && \
    echo "ActiveMapMod=$MAP_ID" >> "$INI_FILE" && \
    echo "ActiveMods=$SP_ID,$SB_ID,$CF_ID,$RS_ID,$IT_ID" >> "$INI_FILE"
