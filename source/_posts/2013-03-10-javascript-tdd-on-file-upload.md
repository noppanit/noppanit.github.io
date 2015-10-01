---
title: JavaScript TDD on on file upload.
author: Noppanit Charassinvichai
layout: post
permalink: /javascript-tdd-on-file-upload/
dsq_thread_id:
  - 1127763222
categories:
  - Javascript
tags:
  - html5
  - javascript
  - tdd
---
Right now, I&#8217;m trying to do HTML5 file upload but I also want to write some test as well. So, I just want to post it here. <http://postposttechnical.com/2011/03/spying-with-jasmine/> This blog post really inspires me on how to use Jasmine to drive JavaScript test. Maybe my code is wrong, but any feedback is welcome. 

So, I have this code

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />38<br />39<br />40<br />41<br />42<br />43<br />44<br />45<br />46<br />47<br />48<br />49<br />50<br />51<br />52<br />53<br />54<br />55<br />56<br />57<br />58<br />59<br />60<br />61<br />62<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">function</span> Uploader<span class="br0">&#40;</span>file<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">this</span>.<span class="me1">file</span> <span class="sy0">=</span> file<span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          Uploader.<span class="me1">prototype</span> <span class="sy0">=</span> &nbsp;<span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          <br />
          &nbsp; <span class="kw2">function</span> upload_file<span class="br0">&#40;</span>file<span class="sy0">,</span> file_content<span class="sy0">,</span> options<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; &nbsp; <span class="kw2">var</span> file_data <span class="sy0">=</span> <span class="kw2">new</span> FormData<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; file_data.<span class="me1">append</span><span class="br0">&#40;</span><span class="st0">'filename'</span><span class="sy0">,</span> file.<span class="kw3">name</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; file_data.<span class="me1">append</span><span class="br0">&#40;</span><span class="st0">'mimetype'</span><span class="sy0">,</span> file.<span class="me1">type</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; file_data.<span class="me1">append</span><span class="br0">&#40;</span><span class="st0">'data'</span><span class="sy0">,</span> file_content<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; file_data.<span class="me1">append</span><span class="br0">&#40;</span><span class="st0">'size'</span><span class="sy0">,</span> file.<span class="me1">size</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; $.<span class="me1">ajax</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; url<span class="sy0">:</span> <span class="st0">"/upload/file"</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type<span class="sy0">:</span> <span class="st0">"POST"</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data<span class="sy0">:</span> file_content<span class="sy0">,</span> &nbsp; &nbsp; &nbsp; &nbsp; <br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; contentType<span class="sy0">:</span> file.<span class="me1">type</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; success<span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error<span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#123;</span><br />
          <br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xhr<span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; myXhr <span class="sy0">=</span> $.<span class="me1">ajaxSettings</span>.<span class="me1">xhr</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>myXhr.<span class="me1">upload</span><span class="br0">&#41;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; myXhr.<span class="me1">upload</span>.<span class="me1">addEventListener</span><span class="br0">&#40;</span><span class="st0">'progress'</span><span class="sy0">,</span> options.<span class="me1">progressbar</span><span class="sy0">,</span> <span class="kw2">false</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span> <span class="kw1">else</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span><span class="st0">"Upload progress is not supported."</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> myXhr<span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          <br />
          &nbsp; <span class="kw2">function</span> showPreview<span class="br0">&#40;</span>file_content<span class="sy0">,</span> thumbnailDiv<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw2">var</span> image <span class="sy0">=</span> document.<span class="me1">createElement</span><span class="br0">&#40;</span><span class="st0">"img"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; image.<span class="me1">src</span> <span class="sy0">=</span> &nbsp;file_content<span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; thumbnailDiv.<span class="me1">append</span><span class="br0">&#40;</span>image<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          <br />
          &nbsp; <span class="kw1">return</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; upload <span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span>options<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="kw2">var</span> self <span class="sy0">=</span> <span class="kw1">this</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; file_content <span class="sy0">=</span> <span class="br0">&#123;</span><span class="br0">&#125;</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; reader <span class="sy0">=</span> <span class="kw2">new</span> FileReader<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; <br />
          &nbsp; &nbsp; &nbsp; reader.<span class="me1">addEventListener</span><span class="br0">&#40;</span><span class="st0">"load"</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span>e<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; file_content <span class="sy0">=</span> e.<span class="me1">target</span>.<span class="me1">result</span>.<span class="me1">split</span><span class="br0">&#40;</span><span class="st0">','</span><span class="br0">&#41;</span><span class="br0">&#91;</span><span class="nu0">1</span><span class="br0">&#93;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; &nbsp; &nbsp; showPreview<span class="br0">&#40;</span>e.<span class="me1">target</span>.<span class="me1">result</span><span class="sy0">,</span> options.<span class="me1">thumbnailDiv</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; upload_file<span class="br0">&#40;</span>self.<span class="me1">file</span><span class="sy0">,</span> file_content<span class="sy0">,</span> options<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><span class="sy0">,</span> <span class="kw2">false</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; <br />
          <br />
          &nbsp; &nbsp; &nbsp; reader.<span class="me1">readAsDataURL</span><span class="br0">&#40;</span>self.<span class="me1">file</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

And this is my test

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />38<br />39<br />40<br />41<br />42<br />43<br />44<br />45<br />46<br />47<br />48<br />49<br />50<br />51<br />52<br />53<br />54<br />55<br />56<br />57<br />58<br />59<br />60<br />61<br />62<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          describe<span class="br0">&#40;</span><span class="st0">"Uploader"</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw2">var</span> eventListener<span class="sy0">,</span><br />
          &nbsp; &nbsp; fakeFile <span class="sy0">=</span> <span class="br0">&#123;</span><span class="br0">&#125;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; beforeEach<span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; spyOn<span class="br0">&#40;</span>$<span class="sy0">,</span> <span class="st0">"ajax"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; eventListener <span class="sy0">=</span> jasmine.<span class="me1">createSpy</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; spyOn<span class="br0">&#40;</span>window<span class="sy0">,</span> <span class="st0">"FileReader"</span><span class="br0">&#41;</span>.<span class="me1">andReturn</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; addEventListener<span class="sy0">:</span> eventListener<span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; readAsDataURL <span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span>file<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="co1">// do nothing.</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; uploader <span class="sy0">=</span> <span class="kw2">new</span> Uploader<span class="br0">&#40;</span>fakeFile<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; it<span class="br0">&#40;</span><span class="st0">"should upload a file successfully"</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; thumbnailElement <span class="sy0">=</span> $<span class="br0">&#40;</span><span class="st0">"&lt;div&gt;&lt;/div&gt;"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; uploader.<span class="me1">upload</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; progressbar <span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          <br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; thumbnailDiv <span class="sy0">:</span> thumbnailElement<br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; expect<span class="br0">&#40;</span>eventListener.<span class="me1">mostRecentCall</span>.<span class="me1">args</span><span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><span class="br0">&#41;</span>.<span class="me1">toEqual</span><span class="br0">&#40;</span><span class="st0">'load'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; &nbsp; eventListener.<span class="me1">mostRecentCall</span>.<span class="me1">args</span><span class="br0">&#91;</span><span class="nu0">1</span><span class="br0">&#93;</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; target <span class="sy0">:</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; result <span class="sy0">:</span> <span class="st0">'file content'</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; expect<span class="br0">&#40;</span>$.<span class="me1">ajax</span>.<span class="me1">mostRecentCall</span>.<span class="me1">args</span><span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><span class="br0">&#91;</span><span class="st0">"url"</span><span class="br0">&#93;</span><span class="br0">&#41;</span>.<span class="me1">toEqual</span><span class="br0">&#40;</span><span class="st0">"/upload/file"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; expect<span class="br0">&#40;</span>$.<span class="me1">ajax</span>.<span class="me1">mostRecentCall</span>.<span class="me1">args</span><span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><span class="br0">&#91;</span><span class="st0">"type"</span><span class="br0">&#93;</span><span class="br0">&#41;</span>.<span class="me1">toEqual</span><span class="br0">&#40;</span><span class="st0">"POST"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; it<span class="br0">&#40;</span><span class="st0">"should show a preview image"</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw2">var</span> thumbnailElement <span class="sy0">=</span> <span class="br0">&#123;</span><span class="br0">&#125;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; thumbnailElement.<span class="me1">append</span> <span class="sy0">=</span> jasmine.<span class="me1">createSpy</span><span class="br0">&#40;</span><span class="st0">"fake thumbnail div"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; uploader.<span class="me1">upload</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; progressbar <span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          <br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><span class="sy0">,</span><br />
          &nbsp; &nbsp; &nbsp; thumbnailDiv <span class="sy0">:</span> thumbnailElement<br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; eventListener.<span class="me1">mostRecentCall</span>.<span class="me1">args</span><span class="br0">&#91;</span><span class="nu0">1</span><span class="br0">&#93;</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; target <span class="sy0">:</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; result <span class="sy0">:</span> <span class="st0">'file_content'</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; expect<span class="br0">&#40;</span>thumbnailElement.<span class="me1">append</span><span class="br0">&#41;</span>.<span class="me1">toHaveBeenCalled</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; hasFileSrc <span class="sy0">=</span> thumbnailElement.<span class="me1">append</span>.<span class="me1">mostRecentCall</span>.<span class="me1">args</span><span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span>.<span class="me1">src</span>.<span class="me1">indexOf</span><span class="br0">&#40;</span><span class="st0">"file_content"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; expect<span class="br0">&#40;</span>hasFileSrc<span class="br0">&#41;</span>.<span class="me1">toNotEqual</span><span class="br0">&#40;</span><span class="sy0">-</span><span class="nu0">1</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

I had to spy on FileReader in order to test it. But it really help me improve my code.