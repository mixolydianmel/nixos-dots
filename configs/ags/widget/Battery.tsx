import { createBinding, With } from "ags";
import { Gtk } from "ags/gtk4";
import AstalBattery from "gi://AstalBattery";

export default function Battery() {
  const WIDTH = 33;

  const battery = AstalBattery.get_default();
  const percent = createBinding(
    battery,
    "percentage",
  )((p) => Math.floor(p * 100));

  const formatTime = (time: number, suffix: string) => {
    const hours = Math.floor(time / 3600);
    const minutes = Math.floor((time % 3600) / 60);
    const seconds = Math.floor(time % 60);

    return "" + hours + "h " + minutes + "m " + seconds + "s " + suffix;
  };
  const charging = createBinding(battery, "charging");
  const timeToEmpty = createBinding(
    battery,
    "timeToEmpty",
  )((t) => formatTime(t, "to empty"));
  const timeToFull = createBinding(battery, "timeToFull")((t) => formatTime(t, "to full"));

  return (
    <menubutton>
      <box class="battery">
        <box>
          <With value={percent}>
            {(percent) => <label label={"" + percent + "%"} />}
          </With>
        </box>
        <box
          class="batteryBody"
          width_request={WIDTH}
          overflow={Gtk.Overflow.HIDDEN}
          valign={Gtk.Align.CENTER}
          height_request={16}
        >
          <With value={percent}>
            {(percent) => (
              <box
                class={percent > 25 ? "full" : "low"}
                width_request={percent * (WIDTH / 100)}
              />
            )}
          </With>
        </box>
        <box
          class="batteryEnd"
          vexpand={false}
          valign={Gtk.Align.CENTER}
          height_request={8}
          width_request={2}
          margin_start={3}
        />
      </box>
      <popover>
        <box orientation={Gtk.Orientation.VERTICAL}>
          <box>
            <With value={charging}>
              {(charging) => (
                <label label={charging ? timeToFull : timeToEmpty} />
              )}
            </With>
          </box>
        </box>
      </popover>
    </menubutton>
  );
}
