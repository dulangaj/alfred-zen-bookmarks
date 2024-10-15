# <img src='Workflow/icon.png' width='45' align='center' alt='icon'> Firefox Bookmarks

Search Firefox bookmarks in Alfred

## Setup

This workflow requires [jq](https://jqlang.github.io/jq/) to function. Can be installed via Homebrew with `brew install jq`

## Usage

Search for your [Firefox](https://www.mozilla.org/firefox/) bookmarks using the `bm` keyword.

![Searching for Firefox bookmarks](Workflow/images/about/keyword.png)

Type to refine your search. Bookmarks are always filtered by Name, while filtering by URL, Tags, Keyword, and site description are configurable from the [Workflow’s Configuration](https://www.alfredapp.com/help/workflows/user-configuration/).

![Narrowing search for Firefox bookmarks](Workflow/images/about/tagFilter.png)

* <kbd>↩</kbd> Open bookmark in primary browser
* <kbd>⌘</kbd><kbd>↩</kbd> Open bookmark in secondary browser
* <kbd>⌘</kbd><kbd>C</kbd> Copy bookmark URL
* <kbd>⌘</kbd><kbd>L</kbd> View all tags and full URL in Large Type
* <kbd>⇧</kbd> Hold to show bookmark description

Firefox Development Edition and Nightly builds are also supported and [configurable](https://www.alfredapp.com/help/workflows/user-configuration/). The Workflow's icon colours will change based on the selected Release Channel.

![Searching for Firefox bookmarks using Nightly](Workflow/images/about/otherBuilds.png)

Append `::` to the configured [Keyword](https://www.alfredapp.com/help/workflows/inputs/keyword) to access other actions, including opening the [Firefox Profile Manager](https://support.mozilla.org/kb/profile-manager-create-remove-switch-firefox-profiles). Bookmarks are only indexed from the default profile, which can be changed from the Profile Manager in each Firefox build.

![Other actions](Workflow/images/about/inlineSettings.png)

Configure the [Hotkey](https://www.alfredapp.com/help/workflows/triggers/hotkey/) as a shortcut to search for your bookmarks.

Bookmarks with the tag `Exclude-Alfred` will be hidden from search. This tag is case sensitive.

**Note**: Due to a limitation of Firefox, bookmark changes may take time to appear in Alfred. Restarting Firefox will make all changes appear immediately.