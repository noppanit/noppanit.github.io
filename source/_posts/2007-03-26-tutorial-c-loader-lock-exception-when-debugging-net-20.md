---
title: 'Solution: C# Loader Lock Exception when debugging .NET 2.0'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-c-loader-lock-exception-when-debugging-net-20/
dsq_thread_id:
  - 183384696
categories:
  - .NET
  - Programming
---
I found this exception when I develop my application with barcode, but my application doesn&#8217;t concern with Microsoft DirectX.  
Anyway, The following solution can solves this problem too.

> <pre>LoaderLock was detected
Message: DLL '.......Microsoft.DirectX.Direct3D.dll' is attempting
managed execution inside OS Loader lock. Do not attempt to run
managed code inside a DllMain or image initialization function since</pre>

doing so can cause the application to hang.A [Loader lock][1] is one of the [Managed Debugging Assistants][2] (MDAs) that were added to VS2005 to help find hard to debug runtime issues. There is code in all Managed DirectX 1.1 assemblies that causes this MDA to fire. Microsoft have [confirmed][3] they are aware of the problem. However I do not expect to see a fix for MDX 1.1 since current efforts are focused on MDX2.0/XNA Framework, it **ONLY** affects code run under the debugger (i.e. it won&#8217;t happen when users run your EXE) and there is a trivial workaround. I&#8217;m not sure of exact reproduction steps &#8211; it appears to fire on some projects and not on others.

To work around the problem you have several choices:

  1. Go back to using VS2003 and .Net 1.1
  2. Use MDX 2.0. Note that MDX 2.0 will never actually ship as it is being transformed into the XNA framework.
  3. Disable the loader lock MDA. Debug/Exceptions (ctrl-D, E), Open the Managed Debugging Assistants tree node and uncheck Loader Lock. This setting is per solution so it will only affect this solution.

**[Versions][4] affected:**All .Net 1.1 Managed DirectX assemblies when used with Visual Studio 2005 and .Net 2.0.

Reference : [Link][5]

 [1]: http://msdn2.microsoft.com/en-us/library/ms172219
 [2]: http://msdn2.microsoft.com/en-us/library/d21c150d.aspx
 [3]: http://blogs.msdn.com/tmiller/archive/2005/06/12/428425.aspx
 [4]: http://www.thezbuffer.com/articles/42.aspx
 [5]: http://www.thezbuffer.com/articles/304.aspx