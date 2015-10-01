---
title: 'I&#8217;m never going back to modern editor again.'
author: Noppanit Charassinvichai
layout: post
permalink: /im-never-going-back-to-modern-editor-again/
dsq_thread_id:
  - 3944024474
categories:
  - Knowledges
tags:
  - editor
  - vim
---
Ok, the title might be a little bit exaggerating. But let me clear this up first. I still use modern editors, TextMate, Atom.io or IntelliJ. They are pros and cons. But here&#8217;s my real answer if people ask me. I want to be the cool kid!.

I don&#8217;t know if you&#8217;re like me but I get asked almost all the time I go to a meetup or conference, &#8220;What&#8217;s your favourite editor&#8221;?. People almost always say Vim|Emacs. I tried both of them in the past and gave up more than I can remember because of all the shortcuts and plugins and I just get too frustrated to use either of them. Finally, I have made a decision that I&#8217;m going to stick with Vim for a month and let&#8217;s see if at the end of the month I still can&#8217;t use it. It&#8217;s been almost a month and I&#8217;d say I&#8217;m never going back to modern editors again (at least when I&#8217;m coding scripting languages). Here&#8217;s why.

### It&#8217;s just easier

I know it&#8217;s not really easier than TextMate or Sublime. You still have to learn a lot of shortcuts and commands. Also, bare-bone Vim just doesn&#8217;t have when you get in TextMate or Sublime (e.g, Find file, Command+T, Directory structure or code completion). However, after you powered through that learning phrase everything is just natural to you. 

If you want to clear any trailing whitespaces you just have to type **%s/\s\+$//** and hit enter. If you want to run some external command you can always do in Vim. For example, if you just want to **git status** you can install [Git wrapper][1] or you can just run **:!git status**. You don&#8217;t even need to go to your terminal which I think it&#8217;s faster. 

If you&#8217;re a good engineer, you will always do TDD. Going back and fourth between the editor and terminal, it&#8217;s just too annoying. I remember when I was coding Java I can just hit Cmd+t in IntelliJ or .NET and you see green bars. Isn&#8217;t it just awesome? I realised that TextMate and Sublime have plugins to do that as well or you can just write your own plugin or package. I tried a couple of plugins and they never work for me. In Vim, it just works!. 

### Community

If Vim|Emacs doesn&#8217;t do what you want, you will almost always find the plugin that does it for you. Currently, my standard plugins are. **NERDTree**, **CommandT**, **vim-fugitive**, **vim-rooter**, **vim-virtualenv**. All these plugins just make my Vim functions the same as Atom.io or Sublime. 

### Not for everyone

I have to admit that the first few weeks I got really frustrated. I almost banged my keyboard against the monitor. I found myself opening Atom.io every time I couldn&#8217;t do some basic editing in Vim. For example, using **vimgrep** wasn&#8217;t what I expected and I ended up googling a lot. Now I get the hang of it and I don&#8217;t use Atom anymore. The worst case is I will just use command line instead.

 [1]: https://github.com/tpope/vim-fugitive