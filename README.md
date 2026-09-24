# DI Lab website

Plain static site for GitHub Pages — no build step needed.

| File | Page |
|---|---|
| `index.html` | Home (hero, photo slideshow, news) |
| `research.html` | Research |
| `team.html` | Team |
| `gallery.html` | Gallery |
| `join.html` | Join |
| `styles.css` | Shared styles for every page |
| `img/` | Figures used on the Research, Team and Gallery pages |
| `slideshow/` | **Pictures for the home-page slideshow** |

## Home-page slideshow

Every picture in the `slideshow/` folder is shown on the home page.

- **Add a picture:** put a `.jpg`, `.jpeg`, `.png`, `.webp`, `.gif` or `.avif` file into `slideshow/` and commit/push it (or drag it into the folder on github.com with *Add file → Upload files*).
- **Caption:** the file name, without the extension. `Mangrove field study.jpg` is captioned "Mangrove field study". Underscores become spaces.
- **Order:** alphabetical by file name. Start names with a number to set the order — `01 `, `02 `, … — the number is not shown in the caption.
- **Remove a picture:** delete it from `slideshow/`.
- Landscape pictures around 4:3 look best; they're cropped to fill the frame. Keep each under ~500 KB so the page loads fast.

How it works: the page reads the list of pictures from `slideshow/slides.json`. A GitHub Action (`.github/workflows/slideshow.yml`) rebuilds that list automatically every time something in `slideshow/` changes, so you never edit it by hand. Within a minute or two of your push, the Action commits the new list and GitHub Pages republishes the site.

### One-time setup
1. Make sure the hidden `.github` folder is in your repository (macOS Finder hides it — press **Cmd+Shift+.** to show it, or upload with `git`). If you only use the github.com uploader, create the file there instead: *Add file → Create new file*, name it `.github/workflows/slideshow.yml`, and paste in the contents from this zip.
2. In the repo on github.com, open **Settings → Actions → General** and, under *Workflow permissions*, choose **Read and write permissions**, then Save. This lets the Action commit the updated list.

### Previewing on your own computer
A browser can't look inside a folder on your disk, so when you open `index.html` straight from your computer the slideshow uses the saved list. After adding, renaming or deleting pictures, refresh that list:

- **Mac:** double-click `update-slideshow.command` in the site folder, then reload the page. (The first time, macOS may block it — right-click it → **Open** → **Open**.)
- **Any computer:** open a terminal in the site folder and run `python3 update_slideshow.py`.

It rewrites `slideshow/slides.json` and `slideshow/slides.js`. On GitHub this happens automatically, so you only need it for local previews — or when not using the GitHub Action, in which case commit those two files along with your pictures.
