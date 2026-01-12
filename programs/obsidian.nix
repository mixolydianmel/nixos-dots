{ config, pkgs, ... }:
{
  programs.obsidian = {
    enable = true;
    defaultSettings = {
      app = {
        showLineNumber = false;
        focusNewTab = true;
        defaultViewMode = "source";
        livePreview = true;
        readableLineLength = true;
        strictLineBreaks = false;
        propertiesInDocument = "visible";
        foldHeading = true;
        foldIndent = true;
        showIndentGuide = true;
        rightToLeft = false;
        spellcheck = true;
        autoPairBrackets = true;
        autoPairMarkdown = true;
        smartIndentList = true;
        useTab = true;
        tabSize = 4;
        autoConvertHtml = true;
        vimMode = true;
        promptDelete = true;
        trashOption = "none";
        alwaysUpdateLinks = false;
        newFileLocation = "root";
        newLinkFormat = "shortest";
        useMarkdownLinks = false;
        showUnsupportedFiles = false;
        attachmentFolderPath = "/";
        uriCallbacks = false;
        showInlineTitle = true;
      };

      appearance = {
        theme = "system";
        accentColor = "#569cd6";
        interfaceFontFamily = "JetBrainsMono Nerd Font";
        textFontFamily = "JetBrainsMono Nerd Font";
        monospaceFontFamily = "JetBrainsMono Nerd Font";
        baseFontSize = 24;
        baseFontSizeAction = true;
        showViewHeader = true;
        showRibbon = true;
        nativeMenus = false;
      };

      corePlugins = [
        "file-explorer"
        "global-search"
        "switcher"
        "graph"
        "backlink"
        "canvas"
        "outgoing-link"
        "tag-pane"
        # "properties"
        "page-preview"
        "daily-notes"
        "templates"
        "note-composer"
        "command-palette"
        "slash-command"
        "editor-status"
        "bookmarks"
        # "markdown-importer"
        # "zk-prefixer"
        # "random-note"
        "outline"
        "word-count"
        # "slides"
        "audio-recorder"
        "workspaces"
        "file-recovery"
        # "publish"
        "sync"
        "webviewer"
      ];
    };

    vaults = {
      personal = {
        target = "Documents/obsidian/personal";
        enable = true;
        settings = {
          corePlugins = [
            "file-explorer"
            "global-search"
            "switcher"
            "graph"
            "backlink"
            "canvas"
            "outgoing-link"
            "tag-pane"
            # "properties"
            "page-preview"
            {
              name = "daily-notes";
              settings = {
                autorun = true;
                folder = "06 - Dailies";
                template = "06 - Dailies/Template";
              };
            }
            "templates"
            "note-composer"
            "command-palette"
            "slash-command"
            "editor-status"
            "bookmarks"
            # "markdown-importer"
            # "zk-prefixer"
            # "random-note"
            "outline"
            "word-count"
            # "slides"
            "audio-recorder"
            "workspaces"
            "file-recovery"
            # "publish"
            "sync"
          ];
        };
      };
    };
  };
}
