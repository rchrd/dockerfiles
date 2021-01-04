#!/bin/sh

set -e

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
checkVar() { if [ -z "$1" ]; then info "Environment variable '$2' missing"; exit 1; fi }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

# check if all env vars have been set
checkVar "$ARCHIVE_NAME" "ARCHIVE_NAME"
checkVar "$SRC_PATH" "SRC_PATH"
checkVar "$BORG_REPO" "BORG_REPO"
checkVar "$BORG_PASSPHRASE" "BORG_PASSPHRASE"

DATE=$(date +%Y-%m-%d-%s)

info "Starting backup"

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    --compression zlib              \
    --exclude-caches                \
    ::"$ARCHIVE_NAME-$DATE"         \
    "$SRC_PATH"

backup_exit=$?

info "Pruning repository"

borg prune                          \
    --list                          \
    --prefix "$ARCHIVE_NAME-"       \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   5               \
    --keep-monthly  12              \
    --keep-yearly   3

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
else
    info "Backup and/or Prune finished with errors"
    info "Not uploading resulting backup to Backblaze B2"
    exit ${global_exit}
fi

# info "Uploading resulting backup to Backblaze B2"
