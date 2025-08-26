import app from "ags/gtk4/app";
import { Astal, Gdk } from "ags/gtk4";
import { exec, subprocess } from "ags/process";
import { createState } from "ags";
import Battery from "./Battery";
import Clock from "./Clock";
import Date from "./Date"
import Mpris from "./Mpris";
import Audio from "./Audio";
import Tray from "./Tray";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;
  const [focusedWindow, setFocusedWindow] = createState("");

  subprocess("bash -c 'niri msg -j event-stream'", (_) => {
    const fwinStr = exec("niri msg -j focused-window");
    if (fwinStr === "null") {
      setFocusedWindow("");
      return;
    }

    const fwinMsg = JSON.parse(fwinStr);
    setFocusedWindow(fwinMsg.title);
  });

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox cssName="centerbox">
        <box $type="start">
          <Tray />
        </box>
        <box $type="center">
          <label label={focusedWindow} />
        </box>
        <box $type="end" spacing={8}>
          <Mpris />
          <Audio />
          <Battery />
          <Date />
          <Clock />
        </box>
      </centerbox>
    </window>
  );
}
