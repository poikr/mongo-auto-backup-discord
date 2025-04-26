while true; do
    sleep 86400
    NOW=`date '+%F_%H:%M:%S'`;
    mongodump --gzip --archive="$NOW.archive" --uri="$MONGO_URI"
    curl \
        -F 'payload_json={"content": ""}' \
        -F "file1=@$NOW.archive" \
        $WEBHOOK_URL
    rm "$NOW.archive"
    echo "Backup and upload completed at $NOW"
done