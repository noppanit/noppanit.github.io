---
title: 'Git &#8211; Interrupted workflow, what will you do?'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 266929628
categories:
  - Knowledges
---
When you&#8217;re working on something intensively and you haven&#8217;t finished the thing, suddenly somebody just wants you to do something again which is more important. Normally, what you will do is to create a new branch and commit your changes to the new branch and switch back to the master branch and do the other thing and reset the working directory. 

or something like this. I&#8217;ve taken this example from <http://www.kernel.org/pub/software/scm/git/docs/git-stash.html>

``` bash
# ... hack hack hack ...
git checkout -b my_wip
git commit -a -m "WIP"
git checkout master
edit emergency fix
git commit -a -m "Fix in a hurry"
git checkout my_wip
git reset --soft HEAD^
# ... continue hacking ...
```

But there is other way to do this by using git stash. Or something like this

``` bash
# ... hack hack hack ...
git stash
edit emergency fix
git commit -a -m "Fix in a hurry"
git stash pop
# ... continue hacking ...
```

Well, I just wanted to give an example of git stash so you can get more understanding of what is happening in git stash

first you need a clean directory to start git

``` bash
mkdir gitstash && cd gitstash && git init
```


Now you create a new file to work on

``` bash
touch main
```

And you edit the file main like you&#8217;re working with something

```
I'm working on something important.
```

And you use git add to track the file

``` bash
git add .
```

And you commit your change

``` bash
git commit -m "Initial Revision"
```

You will see something like this

```
[master (root-commit) 95616b9] Initial Revision
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 main
```

Then you keep working of the file main, so the file main would look like this

```
I'm working on something important.

Something which is also important.
```

Then somebody just interrupted you and asked you to fix something which is might impact the work that you&#8217;re working on right now. So, what you need to do is to use git stash to clean your working directory.

``` bash
git stash
```

You would see something like this to confirm that you have saved the working directory

```
Saved working directory and index state WIP on master: 95616b9 Initial Revision
HEAD is now at 95616b9 Initial Revision
```

Now you&#8217;re main file would look something like this. It&#8217;s like the file main is rolled back to the HEAD commit

```
I'm working on something important.
```

Now you edit the file main to be something like this.

```
I'm working on something important. Something which is very very important.
```

And you commit this change

``` bash
git commit -am "Fixed something"
```

Now you can go back and keep working on what you&#8217;ve left off by using this command

``` bash
git stash pop
```

You will see something like this

```
Auto-merging main
CONFLICT (content): Merge conflict in main
```

Git will try and merge the change for you, if Git cannot merge the file for you, you have to merge it by yourself manually. In this case, the main file has to be merge manually. I just use vimdiff to merge. 

Now you&#8217;re main file will look something like this

```
I'm working on something important. Something which is very very important.

Something which is also important.
```
