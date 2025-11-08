const monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
]

const weekdayNames = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]

const pad = value => value.toString().padStart(2, "0")

const parseFromInput = (value, type) => {
  if (!value) return new Date()

  if (type === "datetime-local") {
    const [datePart, timePart] = value.split("T")
    if (!datePart || !timePart) return new Date()
    const [year, month, day] = datePart.split("-").map(Number)
    const [hour, minute] = timePart.split(":").map(Number)
    return new Date(year, month - 1, day, hour, minute)
  }

  if (type === "date") {
    const [year, month, day] = value.split("-").map(Number)
    return new Date(year, month - 1, day)
  }

  return new Date()
}

const formatForInput = (date, type) => {
  const year = date.getFullYear()
  const month = pad(date.getMonth() + 1)
  const day = pad(date.getDate())

  if (type === "datetime-local") {
    const hours = pad(date.getHours())
    const minutes = pad(date.getMinutes())
    return `${year}-${month}-${day}T${hours}:${minutes}`
  }

  return `${year}-${month}-${day}`
}

const buildCalendar = (year, month) => {
  const firstDay = new Date(year, month, 1)
  const daysInMonth = new Date(year, month + 1, 0).getDate()
  const days = []

  for (let i = 0; i < firstDay.getDay(); i++) {
    days.push({ type: "prev" })
  }

  for (let day = 1; day <= daysInMonth; day++) {
    days.push({ type: "current", day })
  }

  while (days.length % 7 !== 0) {
    days.push({ type: "next" })
  }

  return days
}

const findDatepickerRooms = () => {
  return Array.from(document.querySelectorAll("[data-pyraui-datepicker-room]"))
}

const syncOverlay = room => {
  const input = room.querySelector("input[data-pyraui-datepicker-input]")
  const overlay = room.querySelector("[data-pyraui-datepicker-overlay]")
  if (!input || !overlay) return

  const current = overlay._pyrauiCalendar.current
  input.value = formatForInput(current, input.dataset.pyrauiInputType)
  input.dispatchEvent(new Event("input", { bubbles: true }))
  input.dispatchEvent(new Event("change", { bubbles: true }))
}

const renderOverlay = room => {
  const overlay = room.querySelector("[data-pyraui-datepicker-overlay]")
  const input = room.querySelector("input[data-pyraui-datepicker-input]")
  if (!overlay || !input) return

  const state = overlay._pyrauiCalendar
  const view = new Date(state.view)
  const selected = new Date(state.current)
  const today = new Date()
  const days = buildCalendar(view.getFullYear(), view.getMonth())

  overlay.innerHTML = `
    <div class="space-y-4 p-4">
      <div class="flex items-center justify-between">
        <button type="button" data-shift="-1" class="rounded-full bg-white/70 px-3 py-1 text-sm font-semibold text-slate-600 shadow-sm hover:bg-white">‹</button>
        <div class="text-center">
          <div class="text-sm font-semibold text-sky-600">${view.getFullYear()}</div>
          <div class="text-lg font-semibold text-slate-900">${monthNames[view.getMonth()]}</div>
        </div>
        <button type="button" data-shift="1" class="rounded-full bg-white/70 px-3 py-1 text-sm font-semibold text-slate-600 shadow-sm hover:bg-white">›</button>
      </div>
      <div class="grid grid-cols-7 gap-2 text-center text-xs font-semibold uppercase tracking-[0.2em] text-slate-400">
        ${weekdayNames
          .map(name => `<div>${name}</div>`)
          .join("")}
      </div>
      <div class="grid grid-cols-7 gap-2">
        ${days
          .map(day => {
            if (day.type !== "current") {
              return `<div class="rounded-xl py-3 text-sm text-slate-300"></div>`
            }

            const date = new Date(
              view.getFullYear(),
              view.getMonth(),
              day.day,
              selected.getHours(),
              selected.getMinutes()
            )
            const isToday =
              date.getFullYear() === today.getFullYear() &&
              date.getMonth() === today.getMonth() &&
              date.getDate() === today.getDate()
            const isSelected =
              date.getFullYear() === selected.getFullYear() &&
              date.getMonth() === selected.getMonth() &&
              date.getDate() === selected.getDate()

            return `
              <button
                type="button"
                data-day="${day.day}"
                class="rounded-xl py-3 text-sm font-semibold transition ${
                  isSelected
                    ? "bg-gradient-to-br from-sky-500 via-sky-600 to-indigo-500 text-white shadow-lg shadow-sky-500/30"
                    : isToday
                      ? "border border-sky-200 bg-sky-50 text-sky-600"
                      : "text-slate-600 hover:bg-slate-100"
                }"
              >
                ${day.day}
              </button>
            `
          })
          .join("")}
      </div>
      <div class="flex items-center justify-between border-t border-slate-200 pt-3 text-xs text-slate-500">
        <button type="button" data-action="today" class="font-semibold text-sky-600 hover:text-sky-700">
          Today
        </button>
        <span>${selected.toLocaleDateString(undefined, {
          weekday: "long",
          year: "numeric",
          month: "long",
          day: "numeric"
        })}</span>
      </div>
    </div>
  `

  overlay.querySelectorAll("button[data-shift]").forEach(button => {
    button.addEventListener("click", () => {
      const shift = parseInt(button.dataset.shift, 10)
      state.view.setMonth(state.view.getMonth() + shift)
      renderOverlay(room)
    })
  })

  overlay.querySelectorAll("button[data-day]").forEach(button => {
    button.addEventListener("click", () => {
      const day = parseInt(button.dataset.day, 10)
      const base = state.current
      state.current = new Date(
        state.view.getFullYear(),
        state.view.getMonth(),
        day,
        base.getHours(),
        base.getMinutes()
      )
      state.open = false
      overlay.classList.add("hidden")
      syncOverlay(room)
    })
  })

  const todayButton = overlay.querySelector("[data-action='today']")
  if (todayButton) {
    todayButton.addEventListener("click", () => {
      const now = new Date()
      state.current = new Date(
        now.getFullYear(),
        now.getMonth(),
        now.getDate(),
        now.getHours(),
        now.getMinutes()
      )
      state.view = new Date(now.getFullYear(), now.getMonth(), 1)
      renderOverlay(room)
      syncOverlay(room)
      overlay.classList.add("hidden")
      state.open = false
    })
  }
}

const attachDatepicker = room => {
  const input = room.querySelector("input[data-pyraui-datepicker-input]")
  const trigger = room.querySelector("[data-pyraui-datepicker-trigger]")
  const overlay = room.querySelector("[data-pyraui-datepicker-overlay]")
  if (!input || !trigger || !overlay) return

  if (overlay._pyrauiCalendar) {
    return
  }

  const value = parseFromInput(input.value, input.dataset.pyrauiInputType)
  overlay._pyrauiCalendar = {
    open: false,
    current: new Date(value),
    view: new Date(value.getFullYear(), value.getMonth(), 1)
  }

  const closeOverlay = event => {
    if (!overlay._pyrauiCalendar.open) return
    if (!room.contains(event.target)) {
      overlay.classList.add("hidden")
      overlay._pyrauiCalendar.open = false
    }
  }

  renderOverlay(room)
  overlay.classList.add("hidden")

  trigger.addEventListener("click", () => {
    const state = overlay._pyrauiCalendar
    state.open = !state.open
    overlay.classList.toggle("hidden", !state.open)
    renderOverlay(room)
  })

  document.addEventListener("click", closeOverlay)
  room.addEventListener("destroy", () => document.removeEventListener("click", closeOverlay))
}

export const initDatepickers = () => {
  findDatepickerRooms().forEach(room => attachDatepicker(room))
}

if (typeof window !== "undefined") {
  window.addEventListener("load", initDatepickers)
}

