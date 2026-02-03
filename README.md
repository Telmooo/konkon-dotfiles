<div align="center">

<h1>🦊 konkon-dotfiles</h1>

<table><tr><td>

        ❄️                                           ❄️
              />   フ
             |  _   _ l
            /` ミ_x ノ  こんこん。。。
           /       |         🌸 welcome to my den 🌸
          /   ヽ   ノ
         /    |  | |    🎹 one soul, many forms 🎻
        │     | | |
       / ￣|   | | |
      │ ( ￣ヽ__ヽ_)__)
       \二つ

    ═══════════════════════════════════════════════════

</td></tr></table>

</div>

<div align="center">

[![Static Badge](https://img.shields.io/badge/Arch%20Linux-1793d1?style=for-the-badge&logo=archlinux&logoColor=white&logoSize=auto)](https://archlinux.org/)
[![License: MIT](https://img.shields.io/github/license/Telmooo/konkon-dotfiles?style=for-the-badge&color=yellow)](LICENSE)

</div>

## Quick Start

These steps will guide to set up and install these dotfiles on your machine.

### Prerequisites

[Chezmoi](https://www.chezmoi.io/) is used to manage these dotfiles, so you'll need to install it.

```bash
yarn -S --needed chezmoi
```

### Applying the dotfiles

1. Clone the repository

```bash
chezmoi init https://github.com/Telmooo/konkon-dotfiles.git
```

2. (Optional) Check what changes will be made

```bash
chezmoi diff
```

3. Apply the changes

```
chezmoi apply -v
```

## License

konkon-dotfiles is released under the [MIT License](https://opensource.org/license/MIT).
