# Shortcuts for bro-cut
Run `mkdir -p $(date +%D)` first.
These are shortcuts for running analysis in bro, in the container.

## conn.log or general
`cat conn.log | bro-cut -d ts id.orig_h id.orig_p id.resp_h id.resp_p -F "," -c > /app/code/logs/$(date +%D)/$(date %R).bro.conn.csv`

## files.log 
 `cat files.log | bro-cut -d ts tx_hosts rx_hosts source mime_type filename total_bytes md5 sha1 sha256 extracted -F "," -c > /app/code/logs/$(date +%D)/$(date +%R).bro.files.csv`

## dns.log
`cat dns.log | bro-cut -d ts id.orig_h id.resp_h id.resp_p proto query rcode_name answers -F "," -c > /app/code/logs/$(date +%D)/$(date +%R).bro.dns.csv`

## weird.log
`cat weird.log | bro-cut -d ts id.orig_h id.orig_p id.resp_h id.resp_p name -F "," -c > /app/code/logs/$(date +%D)/$(date +%R).bro.weird.csv`
