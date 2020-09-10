---
layout: post
title: Forced to try something new
---

I use vim (specifically MacVim) for my every day coding and most of my writing.

After installing the recently released macOS Catalina, text started to be clipped below the base line which has already been reported in various open issues on [Github](https://github.com/macvim-dev/macvim/issues){:target="_blank"}. It seems like an issue that requires a MacVim update, so I started to look for an alternative as it's pretty impossible to work with all text clipped and I didn't want to spend time on figuring out a workaround.

My first resort was to reopen Sublime, but although this was my editor of choice quite a while ago, I just got too much used to vim to get anything done without constantly writing vim commands throughout the code.

Next I tried plain vim which was great and actually worked better in various areas than MacVim, but the one thing that I missed immediately, was that yanking wouldn't copy into the system clipboard (even `"*y` wouldn't work).

As that got really annoying, I gave [NeoVim](https://neovim.io){:target="_blank"} another try after I abandoned it due to some laziness in the setup process a while ago. The update to the latest version including required changes in my .vimrc file took me not more than 10-15min and I was back at work. To my surprise literally everything just worked, including yanking into the system clipboard. Haven't found a single issue yet (after a few very productive hours of coding and writing).

Wouldn't it have been for a bug in MacVim caused by the new macOS Catalina, I wouldn't have given NeoVim another go.

Sometimes we need to be forced to try out something new ;-)