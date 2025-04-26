while true; do
    NOW=`date '+%F_%H:%M:%S'`;
    echo "Starting backup at $NOW"
    mongodump --gzip --archive="$NOW.archive" --uri="$MONGO_URI"
    echo "Dump completed at $NOW"
    curl -F 'payload_json={"content": "Backup complete"}' -F "file1=@$NOW.archive" "$WEBHOOK_URL"
    echo "File uploaded to Discord at $NOW"
    rm "$NOW.archive"
    echo "Backup and upload completed at $NOW"
    sleep 86400
done