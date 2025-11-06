// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//
// If you have dependencies that try to import CSS, esbuild will generate a separate `app.css` file.
// To load it, simply add a second `<link>` to your `root.html.heex` file.

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import {hooks as colocatedHooks} from "phoenix-colocated/ashui"
import topbar from "../vendor/topbar"
import {RichTextEditorHook} from "./rich_text_editor_hook"
import {CarouselHook} from "./carousel_hook"
import {ResizablePanelsHook} from "./resizable_panels_hook"
import {FilterPanelHook} from "./filter_panel_hook"
import {AutocompleteHook} from "./autocomplete_hook"
import {SortableListHook} from "./sortable_list_hook"
import {LiveChatHook} from "./live_chat_hook"
import {LiveFeedHook} from "./live_feed_hook"
import {CountdownHook} from "./countdown_hook"
import {ThemeToggleHook} from "./theme_toggle_hook"
import {KeyboardNavigationHook} from "./keyboard_navigation_hook"
import {AnimatedChartHook} from "./animated_chart_hook"
import {MasonryGridHook} from "./masonry_grid_hook"
import {TagInputHook} from "./tag_input_hook"
import {SignaturePadHook} from "./signature_pad_hook"
import {ColorPickerHook} from "./color_picker_hook"
import {PasswordStrengthMeterHook} from "./password_strength_meter_hook"
import {ConditionalFormHook} from "./conditional_form_hook"
import {TimelineHook} from "./timeline_hook"
import {KanbanHook} from "./kanban_hook"
import {GanttHook} from "./gantt_hook"
import {LiveDataTableHook, VirtualScrollHook} from "./live_data_table_hook"

const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
const liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken},
          hooks: {
            ...colocatedHooks,
            RichTextEditorHook: RichTextEditorHook,
            CarouselHook: CarouselHook,
            ResizablePanelsHook: ResizablePanelsHook,
            FilterPanelHook: FilterPanelHook,
            AutocompleteHook: AutocompleteHook,
            SortableListHook: SortableListHook,
            LiveChatHook: LiveChatHook,
            LiveFeedHook: LiveFeedHook,
            CountdownHook: CountdownHook,
            ThemeToggleHook: ThemeToggleHook,
            KeyboardNavigationHook: KeyboardNavigationHook,
            AnimatedChartHook: AnimatedChartHook,
            MasonryGridHook: MasonryGridHook,
            TagInputHook: TagInputHook,
            SignaturePadHook: SignaturePadHook,
            ColorPickerHook: ColorPickerHook,
            PasswordStrengthMeterHook: PasswordStrengthMeterHook,
            ConditionalFormHook: ConditionalFormHook,
            TimelineHook: TimelineHook,
            KanbanHook: KanbanHook,
            GanttHook: GanttHook,
            LiveDataTableHook: LiveDataTableHook,
            VirtualScrollHook: VirtualScrollHook,
          },
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

// The lines below enable quality of life phoenix_live_reload
// development features:
//
//     1. stream server logs to the browser console
//     2. click on elements to jump to their definitions in your code editor
//
if (process.env.NODE_ENV === "development") {
  window.addEventListener("phx:live_reload:attached", ({detail: reloader}) => {
    // Enable server log streaming to client.
    // Disable with reloader.disableServerLogs()
    reloader.enableServerLogs()

    // Open configured PLUG_EDITOR at file:line of the clicked element's HEEx component
    //
    //   * click with "c" key pressed to open at caller location
    //   * click with "d" key pressed to open at function component definition location
    let keyDown
    window.addEventListener("keydown", e => keyDown = e.key)
    window.addEventListener("keyup", e => keyDown = null)
    window.addEventListener("click", e => {
      if(keyDown === "c"){
        e.preventDefault()
        e.stopImmediatePropagation()
        reloader.openEditorAtCaller(e.target)
      } else if(keyDown === "d"){
        e.preventDefault()
        e.stopImmediatePropagation()
        reloader.openEditorAtDef(e.target)
      }
    }, true)

    window.liveReloader = reloader
  })
}

