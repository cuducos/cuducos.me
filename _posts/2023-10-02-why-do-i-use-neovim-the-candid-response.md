---
layout: post
title: Why do I use Neovim? The candid response
---

If you are in a hurry, the short answer is: I am more productive using [Neovim](https://neovim.io). You might not be, and that is okay. You use whatever makes you feel good and effective. In my case, it is Neovim.

If you are not in a hurry, this happened the other day. I was doing a pair programming session at work. For those who don’t know, pair programming is when you share your computer screen with a teammate, typically someone who also codes, to work on something together. One person drives the development while the other contributes, asking questions, finding errors, suggesting improvements, and more. I was the pilot, my coworker, the copilot.

Towards the end of the session, this person told me something like:

> You’re the most efficient with Neovim that I’ve seen. I had heard about Neovim but had never seen someone use it so efficiently like that.

I could have responded, “Wow, join the Neovim world; it’s awesome!” But my actual response was quite the opposite. It was more like:

> Well, thanks for the compliment, I guess. But what you’re praising is essentially knowing your tool well.

Deep down, proficiency with our work tool matters, which is possible with many other options—and surely not only Neovim. We started discussing the things that impressed this person.

Part of that, in my setup, was a couple of functions provided by LSP ([Language Server Protocol](https://microsoft.github.io/language-server-protocol/)), like going to a function or class definition or quickly checking the signature of a method. I mentioned that [LSP was first developed for VS Code](https://en.wikipedia.org/wiki/Language_Server_Protocol#History) — and hacked into Neovim later by the community.

On top of that, I mentioned that other coworkers had the same features working on their IDEs. I said I wasn’t sure whether JetBrains also used LSP under the hood or offered the same possibilities with a completely different implementation.

Another point the person asked about was when I edited multiple parts of the code with a few keystrokes. In our case, it was a mixture of LSP’s rename feature and a combination of a [macro](https://neovim.io/doc/user/repeat.html#multi-repeat) and [“normal” command](https://neovim.io/doc/user/various.html#%3Anormal) in Neovim. I shared that people usually had multiple cursor features on other code editors for that combo and that mastering that would be as efficient as we’ve seen on Neovim.

Finally, we explored our source code using another powerful pair: [Telescope](https://github.com/nvim-telescope/telescope.nvim), [`rg`](https://github.com/BurntSushi/ripgrep) and [`fd`](https://github.com/sharkdp/fd). That bit was mostly a fuzzy finder looking for a pattern in the file’s contents and names in our project. I mentioned it was 100% possible in all modern editors, even if I didn’t know how to do it. I also showed how this is achievable in the terminal, even with tools that probably come with most UNIX-based operational systems like `grep` and `find`—demystifying any possible magic underneath the what happened during the pairing session.

In other words, all the time I put studying Neovim and personalizing it to my own needs would probably have made it productive in VS Code or any of the JetBrains IDEs, for example. Maybe the only difference is that Neovim is a tradition, a long-term software and a community. If I had started studying another editor ten years ago (when I started using Vim), it would have been something different: Sublime Text, if Atom wasn’t around yet. Those editors are not heavily used anymore, and the community around them probably shifted to VS Code or JetBrains. So I would probably have restarted my learning once or twice on these breaking changes. By staying on Vim and Neovim, it has a constant learning throughout all these years.

Instead of going to the easy way of “yeah, Neovim is great,” I opted for a more candid conversation. Even If I think Neovim is excellent, I understand it might not be great for other users with different preferences and focuses. Regardless, I believe people should spend time learning and mastering the code editing tools they use. That is what can make us more efficient while getting things done.
