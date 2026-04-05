# T-GOW Aduty 🛡️

> **❤️ If you appreciate my work and this script helped you, I would be incredibly grateful for a ⭐️ on this repository or a small donation via [Buy Me a Coffee](https://buymeacoffee.com/tgowscripts)! Your support helps me create more free releases for the community. Thank you!**

A modern, highly modular, and natively built FiveM Admin Duty script utilizing Discord identifiers for seamless cross-framework authentication.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Framework](https://img.shields.io/badge/framework-Standalone%20%7C%20Qbox%20%7C%20QBCore%20%7C%20ESX-brightgreen)

## 🌟 Features
- Completely **Framework Independent** (`works on ESX, QBCore, Qbox or Standalone`).
- Advanced Discord-based permission system supporting multiple distinct outfits out of the box.
- Perfectly saves and restores your **previous character clothing and props natively**.
- Clean, simple, and ultra-readable configuration.
- Optional robust webhook logging.
- Hotkey integration allowing players to set a custom key to toggle out-of-duty easily (Configurable default key).

## 🖼️ Preview
<p align="center">
  <img src="https://cdn.discordapp.com/attachments/1490185685523759134/1490237627553546281/showcase.gif?ex=69d35371&is=69d201f1&hm=885c4952e1779f96286b1677627ab00b59a22e2db553f6ded38cde148706d286&" width="80%" alt="Showcase GIF" />
</p>

**💬 Contact / Support:**  
Reach me on Discord under the name **t_gow** for bugs, suggestions, new features, improvements, or anything else.

## 📦 Dependencies
- [ox_lib](https://github.com/overextended/ox_lib) (Required for native notifications)

## ⚙️ Installation
1. Download the latest release from the repository.
2. Unzip/Extract the file.
3. Rename the folder to `tgow-aduty`.
4. Drag and drop the `tgow-aduty` folder into your FiveM `resources` directory.
5. Add `ensure tgow-aduty` to your `server.cfg` (make sure it starts after `ox_lib`).
6. Customize the `Config.lua` with your Discord IDs and Webhook details.
7. Restart your server or type `refresh` followed by `ensure tgow-aduty` in your server console.
8. Jump in-game and type `/aduty` or hit the configured Hotkey (default: `F10`)!

## 🎮 Commands & Usages
- **Command:** `/aduty` (Toggles your administrative duty outfit and saves previous clothing to return to it later).
- **Keybind:** `F10` (Adjustable in `Config.lua` and natively custom-mapable by players through the FiveM GTA Keybindings Menu under *FiveM*).

## ☕ Support
If you like my work and want to support me creating more scripts like this:  
[<img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" width="200" />](https://buymeacoffee.com/tgowscripts)

---
*Created with ❤️ by T-GOW.*
