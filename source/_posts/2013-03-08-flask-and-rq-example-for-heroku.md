---
title: Flask and RQ example for Heroku
author: Noppanit Charassinvichai
layout: post
permalink: /flask-and-rq-example-for-heroku/
dsq_thread_id:
  - 1126068755
categories:
  - Python
tags:
  - heroku
  - long-polling
  - python
  - rq
---
I have been struggling to find any example on the Internet on how to do long polling on Heroku with Flask and RQ. I know it&#8217;s relatively easy, but I just want to make it clear for my future self. 

It&#8217;s really simple.

``` python
@app.route('/get_word_count', methods=['POST'])
def get_word_count():
    data_json = json.loads(request.data)
    job = q.enqueue(word_counter.count_words, data_json["sentence"])
    return job.key

@app.route("/get_word_count_result/<job_key>", methods=['GET'])
def get_word_count_result(job_key):
    job_key = job_key.replace("rq:job:", "")
    job = Job.fetch(job_key, connection=conn)

    if(not job.is_finished):
        return "Not yet", 202
    else:
        return str(job.result), 200
```

The key is here

``` python
job = Job.fetch(job_key, connection=conn)
```

The fetch command is used to get the job by job_id, you can also use

``` python
get_current_job()
```

as well, but I just want to make it clear that if there are more concurrent requests coming in, I&#8217;ll get the right result back. 

I posted an example here. [https://github.com/noppanit/heroku-flask-rq-worker][1]

 [1]: https://github.com/noppanit/heroku-flask-rq-worker "Python with RQ on Heroku"
