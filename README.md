# urltrack
Simple url change tracker

## How to use it
- Append URL to `trackList.txt` (one per line)
- Setup a cron job to call your `check.sh` when you want (or use any other trigger method)

## Results explanation
- A sha256 hash is computed for each URL in `trackList.txt`
- The folder `results/<url_sha256>` is created with a `url.txt` inside (containing the human-readable url)
- A list of html files is present with the following format `YYMMDD_HHMMSS_<content_sha256>` where:
  - YYMMDD is the date
  - HHMMSS is the time
  - content_sha256 is the sha256 hash of the body

## How to read results
When you parse `results/<url_hash>`, you will quickly find when (with the date) the url has changed (different sha256).  
You can also diff the content with any difftool

## How it works
For each URL found in `trackList.txt`, a `curl` command will get the content of the URL.
From this content, it will compute the sha256 hash and store the content in the corresponding result path.
The trigger event is not handled by the script so you can use it with any kind of event.
