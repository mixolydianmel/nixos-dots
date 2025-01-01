const hyprland = await Service.import("hyprland")
const audio = await Service.import("audio")
const battery = await Service.import("battery")

const date = Variable("", {
  poll: [1000, 'date "+%H:%M:%S %a. %d %b %y"'],
})

function Workspaces() {
  const activeId = hyprland.active.workspace.bind("id")
  const workspaces = Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Box({
    vpack: "fill",
    hpack: "fill",
    hexpand: true,
    vexpand: true,
    class_name: activeId.as(j => `${i === j ? "focused" : ""}`),
    child: Widget.Button({
      vpack: "center",
      hpack: "fill",
      child: Widget.Label({
        label: `${i}`,
        hexpand: true,
      }),
      on_clicked: () => hyprland.messageAsync(`dispatch workspace ${i}`),
    })
  }))

  return Widget.Box({
    vertical: true,
    homogeneous: true,
    hexpand: false,
    hpack: "end",
    class_name: "workspaces",
    children: workspaces,
  })
}

/**
 * @param {string} char
 * @param {string} class_name
 */
function Logo(char, class_name) {
  return Widget.Label({
    label: char,
    class_name: class_name,
    wrap: false,
    use_markup: true,
    justification: "center",
    truncate: "none",
  })
}

function Battery() {
  const battery_level_icons = ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"];
  const charging_level_icons = ["󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"];

  const value = battery.bind("percent").as(p => Math.floor(Math.max(p, 0) / 10))
  const charging = battery.bind("charging")
  const valicon = Utils.merge([value, charging], (v, c) => c ?
    charging_level_icons[v] : battery_level_icons[v])

  return Widget.Box({
    class_name: "battery",
    children: [
      Widget.Label({
        label: battery.bind("percent").as(p => "" + p + "%"),
        class_name: "battery_level"
      }),
      Widget.Label({
        label: valicon,
        class_name: "battery_icon"
      }),
      Widget.LevelBar({
        widthRequest: 200,
        vpack: "center",
        value: battery.bind("percent").as(p => Math.max(p, 0) / 100)
      })
    ]
  })
}

function Volume() {
  const icons = {
    101: "󰝝",
    67: "󰕾",
    34: "󰖀",
    1: "󰕿",
    0: "󰸈",
  }

  function getIcon() {
    const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
      threshold => threshold <= audio.speaker.volume * 100)

    return icons[icon]
  }

  const icon = Widget.Label({
    label: Utils.watch(getIcon(), audio.speaker, getIcon),
    class_name: "volicon",
  })

  const slider = Widget.LevelBar({
    widthRequest: 50,
    vpack: "center",
    bar_mode: "discrete",
    max_value: 50,
    setup: self => self.hook(audio.speaker, () => {
      self.value = audio.speaker.volume * 50 || 0
    }),
  })

  return Widget.Box({
    vexpand: false,
    class_name: "volume",
    css: "min-width: 180px",
    children: [icon, slider],
  })
}

const divide = ([total, free]) => free / total

const cpu = Variable(0, {
  poll: [2000, 'top -b -n 1', out => divide([100, out.split('\n')
    .find(line => line.includes('Cpu(s)'))
    .split(/\s+/)[1]
    .replace(',', '.')])],
})

const ram = Variable(0, {
  poll: [2000, 'free', out => divide(out.split('\n')
    .find(line => line.includes('Mem:'))
    .split(/\s+/)
    .splice(1, 2))],
})

const disk = Variable(0, {
  poll: [2000, 'df', out => divide([100, out.split('\n')
    .find(line => line.includes('/dev/nvme0n1p2'))
    .split(/\s+/)[4]
    .replace('%', '')])]
})

const cpu_progress = Widget.CircularProgress({
  css: 'font-size: 0.6rem;'
    + 'min-width: 5rem;'
    + 'background-color: #5c6370;',
  startAt: 0.51,
  endAt: 0.49,
  value: cpu.bind()
})

const ram_progress = Widget.CircularProgress({
  css: 'font-size: 0.6rem;'
    + 'min-width: 5rem;'
    + 'background-color: #5c6370;',
  startAt: 0.51,
  endAt: 0.49,
  value: ram.bind()
})

const disk_progress = Widget.CircularProgress({
  css: 'font-size: 0.6rem;'
    + 'min-width: 5rem;'
    + 'background-color: #5c6370;',
  startAt: 0.51,
  endAt: 0.49,
  value: disk.bind()
})

/**
 * @param {any} widget
 * @param {string} glyph
 * @param {string} class_name
 */
function OverlayGlyph(widget, glyph, class_name) {
  return Widget.Overlay({
    child: widget,
    class_name: class_name,
    overlays: [
      Widget.Label(glyph)
    ]
  })
}

const cpu_module = OverlayGlyph(cpu_progress, "", "cpu")
const ram_module = OverlayGlyph(ram_progress, "󰧑", "ram")
const disk_module = OverlayGlyph(disk_progress, "󰉕", "disk")

const top_bar = Widget.CenterBox({
  class_name: "topbar",
  spacing: 5,
  startWidget: Widget.Box({
    children: [
      Logo('󰝚', "mainlogo"),
      Widget.Box({
        vexpand: false,
        vpack: "center",
        class_name: "maintitle",
        children: [
          Widget.Label({
            label: '   ',
            class_name: "mainple",
          }),
          Widget.Label({
            label: 'Mixolydian.OS',
            class_name: "maintext",
          }),
          Widget.Label({
            label: '',
            class_name: "mainple",
          }),
          Widget.Box({
            vexpand: false,
            vpack: "center",
            class_name: "maincursor",
          })
        ],
      })
    ]
  }),
  centerWidget: Widget.Box({
    hpack: "fill",
    hexpand: true,
    spacing: 50,
    children: [
      disk_module,
      cpu_module,
      ram_module,
    ],
  }),
  endWidget: Widget.Box({
    hpack: "end",
    spacing: 15,
    children: [
      Volume(),
      Battery(),
      Widget.Label({
        label: date.bind(),
        class_name: "datetime"
      })
    ]
  }),
})

const focusedTitle = Widget.Label({
  hexpand: true,
  label: hyprland.active.client.bind('title'),
  visible: hyprland.active.client.bind('address')
    .as(addr => !!addr),
})

const bottom_bar = Widget.Box({
  class_name: "bottombar",
  hexpand: true,
  hpack: "fill",
  child: focusedTitle,
})

const app_area = Widget.Box({
  hexpand: true,
  vexpand: true,
  hpack: "center",
  vpack: "center",
})

function Dash(monitor = 0) {
  return Widget.Window({
    name: `dash-${monitor}`,
    class_name: "dash",
    monitor,
    anchor: ["left", "right", "top", "bottom"],
    exclusivity: "ignore",
    layer: "background",
    child: Widget.Box({
      vertical: true,
      hexpand: true,
      children: [
        top_bar,
        Widget.Box({
          children: [
            Workspaces(),
            Widget.Box({
              vertical: true,
              children: [
                app_area,
                bottom_bar,
              ]
            })
          ]
        })
      ]
    }),
  })
}

App.config({
  style: "./style.css",
  windows: [
    Dash(0),
  ],
})

export { }
