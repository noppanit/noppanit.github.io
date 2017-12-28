---
title: 'DIY : Run RSpec test inside Sublime Text 2'
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /diy-run-rspec-test-inside-sublime-text-2/
dsq_thread_id:
  - 1000089978
categories:
  - Ruby
  - Sublime Text2
tags:
  - sublime text 2
---
I guess everybody loves Sublime Text2. I switched from TextMate to Sublime Text 2 and I absolutely love it. Now, when you are writing some tests and want to run it immediately rather than keep switching windows to your terminal you can run your spec inside Sublime Text 2. 

There are lots of Packages out there you can just install and use it, but I just wanted to show another way of doing it. You could write your own little Package as well.

Sublime Text 2 comes with a nice functionality called [Build System][1] where you can create your own command and run it by using **cmb+b** (If you are a MAC user).

First thing first, I hope you use **rvm** so if you haven&#8217;t done this already you need to create symbolic link like [this page][2]. Then if you want to open your project you can just do this command inside your project. This way, sublime will hook up with rvm nicely.

``` bash
subl .
```

Then you go to **Tools > Build System > New Build System**. It will open a new editor then you place this code.

``` json
{
  "cmd": ["rspec", "-I ${file_path}", "$file"],
  "file_regex": "# ([A-Za-z:0-9_./ ]+rb):([0-9]+)",
  "working_dir": "${project_path:${folder:${file_path}}}",
  "selector": "source.ruby",

  "windows":
  {
    "cmd": ["rspec.bat", "-I ${file_path}", "$file"]
  }
}
```

Then you choose the new Build System you just created and hit this combo **cmd+b**. Hooray!

 [1]: http://docs.sublimetext.info/en/latest/file_processing/build_systems.html "Sublime Text 2 build system"
 [2]: http://www.sublimetext.com/docs/2/osx_command_line.html
