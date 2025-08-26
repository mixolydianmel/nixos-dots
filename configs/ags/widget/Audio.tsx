import { createBinding } from "ags";
import { Gtk } from "ags/gtk4";
import AstalWp from "gi://AstalWp";

export default function Audio() {
  const { defaultSpeaker: speaker } = AstalWp.get_default();

  return (
    <menubutton>
      <image iconName={createBinding(speaker, "volumeIcon")} pixel_size={24} />
      <popover>
        <box orientation={Gtk.Orientation.VERTICAL}>
          <label css="font-weight: 700; padding-left: 1rem;" label="Volume" halign={Gtk.Align.START} />
          <slider
            width_request={260}
            onChangeValue={({ value }) => speaker.set_volume(value)}
            value={createBinding(speaker, "volume")}
          />
        </box>
      </popover>
    </menubutton>
  );
}
