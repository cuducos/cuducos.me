---
layout: post
title: Do not share a terminal screenshot when asking for help
---

I have a few open-source projects that are <abbr title="Command-line interface">CLI</abbr> tools — the most well-known one is [Minha Receita](https://github.com/cuducos/minha-receita). I also participate (less than before, but still do) in some communities that support beginners in programming, whether in a specific language or in the open data field. Both are situations where I often encounter people asking for help.

And what I want to say is: sharing a terminal screenshot when asking for help _does not help us help you_.

## Why Not Share a Terminal Screenshot?

There are several reasons, but I'll group them into two categories: completeness, reproducibility and searchability.

### Completeness

Often, the terminal output contains more than what fits on the screen. For example, the command you typed might have scrolled out of view, or you might have scrolled to read something in the middle or beginning of the output, and the screenshot omitted the end of the output. This limits the ability of others to help you, as they won't have access to all the information that didn't fit on the screen.

Ah, but the output is too long, someone might argue. Great! That information is exactly what can help others help you! If you're opening an issue on GitHub, you can, for example, [collapse text blocks](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/organizing-information-with-collapsed-sections) using `<details>` and `</details>` if you don't want to clutter the post too much. Or you can simply use a service like [Gist](https://gist.github.com) and share the complete output with a URL.

The point is, share everything: from the command you typed, to the end of the output. This helps us help you!

### Reproducibility

Often, the information on your screen helps me reproduce your scenario: a specific URL, an error name, a file path with a line number. If I can read this information in an image but cannot select the text, copy it, and paste it into my environment to test, to try to reproduce the situation you're facing, you're not helping me help you.

An error I've never seen before might prompt me to copy and paste it to search online or in the source code, for example. A part of the error with a long file path and a line number might help me open the code editor exactly at that file and line. A long URL with keys and alphanumeric identifiers might be important for me to access and see if I get the same error.

And manually copying all of this is very error-prone. If the person trying to help you makes a mistake with a single character, they might encounter a different error or no error at all. Allowing people to copy & paste helps them help you!

### Searchability

Your question might be the same as many others: now, in the past, or even in the future. And our search engines (still) work much better with text than with images. So, sharing your issue as text helps a lot in helping others! If someone has, for example, the same error as you, they can (more) easily find your post on a forum, GitHub, or chat if it's in text format instead of an image.

## <abbr title="Too Long, Don't Read">TLDR</abbr>

Are you going to ask for help about something that happened in the terminal?

1. Select everything, from the command you typed to the last line of the output.
2. Paste it into a text-sharing platform.
3. If available, use monospaced font formatting, like [Markdown code blocks](https://spec.commonmark.org/0.31.2/#fenced-code-blocks) with ```.
4. Share 💜
