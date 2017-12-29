---
title: "python-request Connection aborted and broken pipe error"
date: 2016-12-24 10:53:50 -0500
comments: true
categories:
---

Ever wondered why your long running python script just bombs out mid-way?

If you have seen this error

```python

ConnectionError: ('Connection aborted.', error(32, 'Broken pipe'))

```

It might be that the script takes longer than expected and SSL got cut off before it has the chance to finish the request. This is what I do and it seems to be working. In your `~/.ssh/config` add this to your configuration. 

```bash

Host *
    ServerAliveInterval 300
    ServerAliveCountMax 2

```

What this does is it's going to send a NULL packet to the other side every 300 seconds and give up after 2 tries.

Hope this helps everyone. 

Reference:
- [How to keep alive ssh session](https://patrickmn.com/aside/how-to-keep-alive-ssh-sessions/)
