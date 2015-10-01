---
title: 'Git &#8211; Interrupted workflow, what will you do?'
author: Noppanit Charassinvichai
layout: post
permalink: /git-interrupted-workflow-what-will-you-do/
dsq_thread_id:
  - 266929628
categories:
  - Knowledges
---
When you&#8217;re working on something intensively and you haven&#8217;t finished the thing, suddenly somebody just wants you to do something again which is more important. Normally, what you will do is to create a new branch and commit your changes to the new branch and switch back to the master branch and do the other thing and reset the working directory. 

or something like this. I&#8217;ve taken this example from <http://www.kernel.org/pub/software/scm/git/docs/git-stash.html>

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="co0"># ... hack hack hack ...</span><br /> <span class="kw2">git checkout</span> <span class="re5">-b</span> my_wip<br /> <span class="kw2">git commit</span> <span class="re5">-a</span> <span class="re5">-m</span> <span class="st0">"WIP"</span><br /> <span class="kw2">git checkout</span> master<br /> edit emergency fix<br /> <span class="kw2">git commit</span> <span class="re5">-a</span> <span class="re5">-m</span> <span class="st0">"Fix in a hurry"</span><br /> <span class="kw2">git checkout</span> my_wip<br /> <span class="kw2">git reset</span> <span class="re5">--soft</span> HEAD^<br /> <span class="co0"># ... continue hacking ...</span>
        </div>
      </td>
    </tr>
  </table>
</div>

But there is other way to do this by using git stash. Or something like this

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="co0"># ... hack hack hack ...</span><br /> <span class="kw2">git stash</span><br /> edit emergency fix<br /> <span class="kw2">git commit</span> <span class="re5">-a</span> <span class="re5">-m</span> <span class="st0">"Fix in a hurry"</span><br /> <span class="kw2">git stash</span> pop<br /> <span class="co0"># ... continue hacking ...</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Well, I just wanted to give an example of git stash so you can get more understanding of what is happening in git stash

first you need a clean directory to start git

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">mkdir</span> gitstash <span class="sy0">&&</span> <span class="kw3">cd</span> gitstash <span class="sy0">&&</span> <span class="kw2">git init</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now you create a new file to work on

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">touch</span> main
        </div>
      </td>
    </tr>
  </table>
</div>

And you edit the file main like you&#8217;re working with something

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          I'm working on something important.
        </div>
      </td>
    </tr>
  </table>
</div>

And you use git add to track the file

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">git add</span> .
        </div>
      </td>
    </tr>
  </table>
</div>

And you commit your change

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">git commit</span> <span class="re5">-m</span> <span class="st0">"Initial Revision"</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You will see something like this

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          [master (root-commit) 95616b9] Initial Revision<br /> &nbsp;1 files changed, 1 insertions(+), 0 deletions(-)<br /> &nbsp;create mode 100644 main
        </div>
      </td>
    </tr>
  </table>
</div>

Then you keep working of the file main, so the file main would look like this

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          I'm working on something important.<br /> <br /> Something which is also important.
        </div>
      </td>
    </tr>
  </table>
</div>

Then somebody just interrupted you and asked you to fix something which is might impact the work that you&#8217;re working on right now. So, what you need to do is to use git stash to clean your working directory.

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">git stash</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You would see something like this to confirm that you have saved the working directory

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          Saved working directory and index state WIP on master: 95616b9 Initial Revision<br /> HEAD is now at 95616b9 Initial Revision
        </div>
      </td>
    </tr>
  </table>
</div>

Now you&#8217;re main file would look something like this. It&#8217;s like the file main is rolled back to the HEAD commit

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          I'm working on something important.
        </div>
      </td>
    </tr>
  </table>
</div>

Now you edit the file main to be something like this.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          I'm working on something important. Something which is very very important.
        </div>
      </td>
    </tr>
  </table>
</div>

And you commit this change

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">git commit</span> <span class="re5">-am</span> <span class="st0">"Fixed something"</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now you can go back and keep working on what you&#8217;ve left off by using this command

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">git stash</span> pop
        </div>
      </td>
    </tr>
  </table>
</div>

You will see something like this

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          Auto-merging main<br /> CONFLICT (content): Merge conflict in main
        </div>
      </td>
    </tr>
  </table>
</div>

Git will try and merge the change for you, if Git cannot merge the file for you, you have to merge it by yourself manually. In this case, the main file has to be merge manually. I just use vimdiff to merge. 

Now you&#8217;re main file will look something like this

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          I'm working on something important. Something which is very very important.<br /> <br /> Something which is also important.
        </div>
      </td>
    </tr>
  </table>
</div>