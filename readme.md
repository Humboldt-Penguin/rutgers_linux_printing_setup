## **MUST READ:**

**YOU SHOULD NEVER RUN A RANDOM BASH SCRIPT YOU FIND ON THE INTERNET!!!!!**

Always read the code yourself, and/or run it through ChatGPT and ask:

> I found this bash script on the internet. What does it do? Are any parts suspicious/malicious? What are the potential risks of running it?

&nbsp;

---
## Purpose:

For wireless printing from your personal device, Rutgers only provides setup wizards on [Windows, MacOS, Android, and iOS](https://ithelp.rutgers.edu/sp?id=kb_article_view&sysparm_article=KB0012543&sys_kb_id=a0000a821b76b190012555b62a4bcbbc&spa=1). This script helps you configure printing (B/W and color) on Linux machines with CUPS.

&nbsp;

---
## How to use:

[Video demo](https://files.catbox.moe/3vv4yw.mp4)

```shell
git clone https://github.com/Humboldt-Penguin/rutgers_linux_printing_setup.git
cd rutgers_linux_printing_setup
bash setup_rutgers_printers.sh
```

You will be prompted with an interactive menu of choices like this (no code/commands will be run until you choose an option):

![](https://files.catbox.moe/8bmjql.png)

&nbsp;

---
## Useful links:

- Repo shortcut link:
	- [bit.ly/rutgers_linux_printing](https://bit.ly/rutgers_linux_printing)
- See your printing credits/history:
	- https://pcutapp.rad.rutgers.edu/
- Rutgers wiki:
	- Printing overview for Students, Faculty and Staff:
		- https://ithelp.rutgers.edu/sp?id=kb_article&sysparm_article=KB0012627&sys_kb_id=91c6db531bd23990727cc9d2604bcb8d&spa=1
	- List of PaperCut printers and drivers on campus:
		- https://sasit.rutgers.edu/how-to-guides/guide/70-desktop-system-support/163-printing-and-photocopying/660-list-of-papercut-printers-and-drivers
- Rutgers Linux Club Discord:
	- https://discord.gg/hUxN5Tvsgu

&nbsp;

---
## TODO/ideas:

- [x] ~~Use IPPS over HTTPS?~~
- [x] ~~Make a bitly~~
- [ ] Fuck around with the printer url some more. It's currently `ipps://${NETID}:${PASSWORD}@mobilityprint.rad.rutgers.edu:9164/printers/nb_bw`, honestly I never even tested if you need your netid/password, nor if you need the port number. [This link](https://dgsdtech.yale.edu/printing/installing-papercut-client-and-printers-on-mac/#:~:text=First%20print/enter,in%20my%20keychain%E2%80%9D) suggests you can skip the netid/password in printer URL authenticate later on?
- [ ] In `add_printers()`, we're running `lpadmin` with the flag `-m drv:///cupsfilters.drv/pwgrast.ppd` in order to add a printer with the "Generic IPP Everywhere Printer" driver. However, I only tested this on NixOS with KDE, I'm not sure if the same driver is available on Debian/Arch. I'm also not sure if this is the best driver for Rutgers printers either.

&nbsp;

---
## Contact me:

- Discord: alci6038
- Email: zain.eris.kamal@rutgers.edu

If there's an issue, message/ping me, submit an issue, or submit a pull request (you ungrateful fuck).

&nbsp;

---

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

[See You, Space Cowboy.](https://www.youtube.com/watch?v=4hhzLlclBi0)

<!-- ![](https://files.catbox.moe/tpd6dp.png) -->

<a href="https://files.catbox.moe/tpd6dp.png" target="_blank">
    <img src="https://files.catbox.moe/tpd6dp.png" width="300">
</a>

[o7](https://files.catbox.moe/svwwxa.jpg)
