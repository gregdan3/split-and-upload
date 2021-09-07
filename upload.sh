#!/bin/bash
# https://github.com/tokland/youtube-upload/
PLAYLIST="The Bee Movie But Split Into Four Second Segments"

readarray -t TO_UPLOAD <<<"$(ls -tr ./out/)"
IFS='.' # magic var called Internal Field Separator

for INPUT in "${TO_UPLOAD[@]}"; do
	read -ra SPLIT <<<"$INPUT"
	TITLE="${SPLIT[0]}"
	echo "$TITLE"
	youtube-upload \
		--title="$TITLE" \
		--description="$PLAYLIST" \
		--category="" \
		--tags="" \
		--default-language="en" \
		--default-audio-language="en" \
		--client-secrets="./client_secrets.json" \
		--playlist="$PLAYLIST" \
		--embeddable=True \
		"./out/$INPUT"
	sleep 3
done

# --credentials-file="./credentials.json" \
