import { createPoll } from "ags/time";
import GLib from "gi://GLib?version=2.0";

export default function Date() {
  const date = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%a %d %b")!;
  });

  return <label label={date} />;
}
