---
title: "Wrkhorse, Day 1: Getting My Assistant to Talk to a Local Model"
comments: true
author: Noppanit Charassinvichai
categories:
  - Blog
tags:
  - ai
  - wrkhorse
---

Welp! I’ve been learning something [Wrkhorse](https://github.com/noppanit/wrkhorse).

## Why bother?

I pay for Claude, ChatGPT and Grok. After a recent change, usage went up a lot for everyone. On my $30 plan, I'd used about 90% of my weekly usage by day four, and that came from only about three pull requests. (They did correct it and resetted my weekly limit after a lot of people saying the same thing on X)

Here's [the reset announcement from Grok Bot](https://x.com/bot/status/2119871982946971659): "We've reset weekly limits for all Grok Bot users."

{% include tweet.html
   url="https://x.com/bot/status/2119871982946971659"
   author="Grok Bot (@bot)"
   date="November 9, 2026"
   text="We've reset weekly limits for all Grok Bot users.<br><br>Enjoy!" %}

That's what started this project. The idea is to keep the paid agent tools as the orchestration layer for heavy work and send small, trivial coding tasks to a local model. If that works, less of my paid usage goes to work a small model can handle.

The first test was deliberately small:

> Reply with exactly: local model reached

The response came back:

> local model reached

Not an impressive answer by itself. But it confirmed that the connection worked: I could ask my existing assistant to call my own service, which could then reach a local model.

One thing I'm watching for later: [Tailscale announced private MCP access](https://x.com/tailscale/status/2119892081581682974), which could let my assistant reach Wrkhorse over a private network instead of the public internet.

{% include tweet.html
   url="https://x.com/tailscale/status/2119892081581682974"
   author="Tailscale (@Tailscale)"
   date="November 9, 2026"
   widgets=true
   text='<a href="https://x.com/bot">@bot</a> can now connect to private MCP servers on your tailnet without exposing them to the public internet.<br><br>Powered by Tailscale OAuth apps, now GA, so you can build secure agent integrations, too.<br><br>Read more here: <a href="https://t.co/cmn8tpM6w7">https://t.co/cmn8tpM6w7</a>' %}

## The setup

Wrkhorse is a Python service that exposes tools through MCP, or Model Context Protocol. In plain English, MCP gives an assistant a defined set of tools it can call on another service.

For this setup, the path was:

**Oddy calls Wrkhorse, and Wrkhorse calls a model served locally through Ollama.**

The model was `qwen2.5-coder:1.5b`. Wrkhorse exposed five tools:

- `ask_local_model` sends a text prompt to the model.
- `get_project_status` reports the service’s current state.
- `submit_task` queues a supported task.
- `get_task_status` checks its progress.
- `get_task_result` retrieves the result.

The chat tool only accepts a prompt. It cannot access files or execute code.

## Authentication was the first hurdle

Connecting it took more than entering the MCP endpoint.

Wrkhorse sits behind Cloudflare Access using Managed OAuth. That meant getting the OAuth callback allowlisted and configuring an access policy for my email.

At one point, the sign-in flow returned:

> That account does not have access.

After configuring the email-specific Allow policy, the connector successfully connected. A status check confirmed that the worker was connected and the local model was available for chat.

That got me to the first successful prompt and response.

## Where day 1 ended

The next thing to investigate is authentication: why the connection needed authorization again, and whether reconnecting reliably restores it.

For now, the result is small but concrete. My assistant reached a local model through Wrkhorse and got a text response back.

That’s day 1. Not an autonomous coding worker yet, but a working first connection.
