# Hyperland Dotfiles

Meine persönliche Hyperland-Konfiguration für ein minimalistisches und produktives Desktop-Setup meines Laptops.

## 📦 Enthaltene Konfigurationen

Diese Repository enthält Konfigurationsdateien für:

- Hyperland (Wayland Compositor)
- Waybar (Status Bar)
- Walker (Application Launcher)
- Ghostty (Terminal Emulator)
- Dunst (Notification Daemon)
- Hyprpaper (Wallpaper)
- WLogout (Logout Menu)
- Hypridle ()
- Hyprclip (Clipboard Manager)
- Wayshot (Screenshot tool)

## 🚀 Installation

### Automatische Installation (In Entwicklung)

Ein Installationsskript ist derzeit in Entwicklung und wird in Zukunft verfügbar sein. Es wird die Installation und Konfiguration automatisieren.

### Manuelle Installation

1. Klone das Repository:
```bash
git clone https://github.com/XsnilzX/hyperland-dotfiles.git
cd hyperland-dotfiles
```

2. Erstelle Backup deiner existierenden Konfigurationen:
```bash
mkdir ~/dotfiles-backup
cp -r ~/.config/hypr ~/.config/waybar ~/.config/walker ~/dotfiles-backup
```

3. Kopiere die Konfigurationsdateien:
```bash
cd dotfiles
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r walker ~/.config/
# Weitere Konfigurationsdateien nach Bedarf kopieren
```

## ⚙️ Voraussetzungen

Stelle sicher, dass folgende Pakete installiert sind:

- hyperland
- waybar
- walker
- ghostty
- dunst
- wlogout
- hyprpaper
- hypridle
- hyprclip
- wayshot

Für Arch Linux:
```bash
paru -S hyperland waybar walker-bin ghostty dunst wlogout hyprpaper wayshot
```

## 🎨 Anpassung

Die wichtigsten Konfigurationsdateien findest du hier:

- Hyperland: `~/.config/hypr/hyprland.conf`
- Waybar: `~/.config/waybar/config`
- Walker: `~/.config/walker/config`

## 📷 Screenshots

[Screenshots folgen]

## 🔑 Tastenkombinationen

| Tastenkombination | Aktion |
|------------------|--------|
| SUPER + Q    | Terminal öffnen |
| SUPER + C        | Fenster schließen |
| SUPER + SPACE    | Walker starten |
| SUPER + [1-9]    | Workspace wechseln |
| SUPER + S    | Screenshot mit auswahl  |
| SUPER + M    | Logout |
| [weitere Shortcuts] |

## 🤝 Beitragen

Fühl dich frei, Issues zu erstellen oder Pull Requests einzureichen, wenn du Verbesserungsvorschläge hast.

## 📝 Lizenz

Dieses Projekt ist unter der GNU General Public License v3.0 (GPL-3.0) lizenziert - siehe [LICENSE](LICENSE) Datei für Details.

Die vollständige Lizenz kann unter [https://www.gnu.org/licenses/gpl-3.0.en.html](https://www.gnu.org/licenses/gpl-3.0.en.html) eingesehen werden.
