# Projects:
  - Graph of Internet Speedtest over time
  - Markdown Viewer (Realtime, Github Formatting)
  - Local Reverse Proxy/Port Redirection
  - Terminal-based Chat with: Slack, Hangouts, Facebook Chat, IRC, XMPP, Twitter.
  - VIM IDE with Golang Autocompletion
  - Unlock Protected PDF (avoid forcibly using Adobe Software)
  - 2FA/Gauth One Time Passcode Generator
  - Config File In-Memory Decryption Utility
  - Code Pattern to Cleanup after SIGTERM
  - Utility debugger/”Toolbox”
  - DynDNS on CloudFlare (in Golang)
  - GoPresent/This slide deck
  - Domain Availablity Checker

### TODO:
  - Rendering markdown as pdf - md2pdf
  - Terminal-based file downloader from dropbox
  - Terminal-based dropbox file structure browser
  - https://github.com/stevemcquaid/veracrypt


### pdf-title-rename
#### Purpose
I hoard ebooks. Often times the filename is mislabeled.  Have an easy way to rename large archives of ebooks. Batch renaming pdfs using metadata for title and author
#### Challenges
Find the right solution prebuilt. Then Dockerize it. Create bindings to pass in files to docker container.
#### Learnings/Solutions
Using someone else's work is awesome!

### pdf-unlocker
#### Purpose
Need to sign document, but it requires Adobe Software to edit.
#### Challenges
Volume mounting. Bindings to enable future use easily
#### Learnings/Solutions
Using someone else's work is awesome! Streamlining the "Dockerization" process helps to save time!


### haproxy
https://github.com/stevemcquaid/haproxy
#### Purpose
Be able to redirect traffic at will. (Reverse Proxy)
#### Challenges
Forward traffic to a different ip/port, Easily mapping to/from ports in a simple manner
#### Learnings/Solutions
Use haproxy in a docker container. Use simple config file
