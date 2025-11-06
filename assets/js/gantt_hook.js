// Gantt Chart Hook for interactive task management
export const GanttHook = {
  mounted() {
    this.chartId = this.el.id;
    this.startDate = new Date(this.el.dataset.startDate);
    this.endDate = new Date(this.el.dataset.endDate);
    this.rowHeight = parseInt(this.el.dataset.rowHeight) || 40;
    this.barHeight = parseInt(this.el.dataset.barHeight) || 24;
    this.allowDrag = this.el.dataset.allowDrag === "true";
    this.allowResize = this.el.dataset.allowResize === "true";
    this.dayWidth = 30; // pixels per day

    this.draggingTask = null;
    this.resizingTask = null;
    this.resizeHandle = null;
    this.dragStartX = 0;
    this.dragStartDate = null;

    if (this.allowDrag || this.allowResize) {
      this.initInteractivity();
    }
  },

  updated() {
    // Update dates if changed
    if (this.el.dataset.startDate) {
      this.startDate = new Date(this.el.dataset.startDate);
    }
    if (this.el.dataset.endDate) {
      this.endDate = new Date(this.el.dataset.endDate);
    }
  },

  initInteractivity() {
    const taskBars = this.el.querySelectorAll(".gantt-task-bar");
    
    taskBars.forEach(bar => {
      if (this.allowDrag) {
        bar.addEventListener("mousedown", (e) => {
          // Don't start drag if clicking on resize handle
          if (e.target.classList.contains("gantt-resize-handle-left") ||
              e.target.classList.contains("gantt-resize-handle-right")) {
            return;
          }
          this.startDrag(bar, e);
        });
      }

      if (this.allowResize) {
        const leftHandle = bar.querySelector(".gantt-resize-handle-left");
        const rightHandle = bar.querySelector(".gantt-resize-handle-right");

        if (leftHandle) {
          leftHandle.addEventListener("mousedown", (e) => {
            e.stopPropagation();
            this.startResize(bar, "left", e);
          });
        }

        if (rightHandle) {
          rightHandle.addEventListener("mousedown", (e) => {
            e.stopPropagation();
            this.startResize(bar, "right", e);
          });
        }
      }
    });
  },

  startDrag(bar, event) {
    event.preventDefault();
    const hook = this;
    hook.draggingTask = bar;
    hook.dragStartX = event.clientX;
    hook.dragStartDate = new Date(bar.dataset.startDate);

    const handleDragMove = (e) => {
      if (!hook.draggingTask) return;

      const deltaX = e.clientX - hook.dragStartX;
      const deltaDays = Math.round(deltaX / hook.dayWidth);
      const newStartDate = new Date(hook.dragStartDate);
      newStartDate.setDate(newStartDate.getDate() + deltaDays);

      const oldEndDate = new Date(hook.draggingTask.dataset.endDate);
      const duration = Math.ceil((oldEndDate - hook.dragStartDate) / (1000 * 60 * 60 * 24));
      const newEndDate = new Date(newStartDate);
      newEndDate.setDate(newEndDate.getDate() + duration);

      const timeline = hook.draggingTask.closest(".gantt-timeline");
      if (timeline) {
        const timelineRect = timeline.getBoundingClientRect();
        const taskRow = hook.draggingTask.closest(".gantt-task-row");
        const rowRect = taskRow.getBoundingClientRect();
        const barLeft = e.clientX - timelineRect.left - (deltaX % hook.dayWidth);
        const barWidth = duration * hook.dayWidth;
        
        hook.draggingTask.style.left = `${Math.max(0, barLeft)}px`;
        hook.draggingTask.style.width = `${barWidth}px`;
      }
    };

    const handleDragEnd = (e) => {
      if (!hook.draggingTask) return;

      const deltaX = e.clientX - hook.dragStartX;
      const deltaDays = Math.round(deltaX / hook.dayWidth);
      const newStartDate = new Date(hook.dragStartDate);
      newStartDate.setDate(newStartDate.getDate() + deltaDays);

      const oldEndDate = new Date(hook.draggingTask.dataset.endDate);
      const duration = Math.ceil((oldEndDate - hook.dragStartDate) / (1000 * 60 * 60 * 24));
      const newEndDate = new Date(newStartDate);
      newEndDate.setDate(newEndDate.getDate() + duration);

      hook.pushEvent("gantt-task-moved", {
        task_id: hook.draggingTask.dataset.taskId,
        start_date: newStartDate.toISOString().split("T")[0],
        end_date: newEndDate.toISOString().split("T")[0]
      });

      hook.draggingTask = null;
      document.removeEventListener("mousemove", handleDragMove);
      document.removeEventListener("mouseup", handleDragEnd);
    };

    document.addEventListener("mousemove", handleDragMove);
    document.addEventListener("mouseup", handleDragEnd);
  },

  startResize(bar, handle, event) {
    event.preventDefault();
    const hook = this;
    hook.resizingTask = bar;
    hook.resizeHandle = handle;
    hook.dragStartX = event.clientX;
    hook.dragStartDate = new Date(bar.dataset.startDate);

    const handleResizeMove = (e) => {
      if (!hook.resizingTask || !hook.resizeHandle) return;

      const deltaX = e.clientX - hook.dragStartX;
      const deltaDays = Math.round(deltaX / hook.dayWidth);
      const startDate = new Date(hook.resizingTask.dataset.startDate);
      const endDate = new Date(hook.resizingTask.dataset.endDate);

      if (hook.resizeHandle === "left") {
        const newStartDate = new Date(startDate);
        newStartDate.setDate(newStartDate.getDate() + deltaDays);
        
        if (newStartDate < endDate) {
          const timeline = hook.el.querySelector(".gantt-timeline");
          const taskRow = hook.resizingTask.closest(".gantt-task-row");
          if (timeline && taskRow) {
            const timelineRect = timeline.getBoundingClientRect();
            const rowRect = taskRow.getBoundingClientRect();
            const newLeft = (e.clientX - timelineRect.left);
            const newWidth = (endDate - newStartDate) / (1000 * 60 * 60 * 24) * hook.dayWidth;
            
            hook.resizingTask.style.left = `${Math.max(0, newLeft)}px`;
            hook.resizingTask.style.width = `${Math.max(hook.dayWidth, newWidth)}px`;
          }
        }
      } else if (hook.resizeHandle === "right") {
        const newEndDate = new Date(endDate);
        newEndDate.setDate(newEndDate.getDate() + deltaDays);
        
        if (newEndDate > startDate) {
          const newWidth = (newEndDate - startDate) / (1000 * 60 * 60 * 24) * hook.dayWidth;
          hook.resizingTask.style.width = `${Math.max(hook.dayWidth, newWidth)}px`;
        }
      }
    };

    const handleResizeEnd = (e) => {
      if (!hook.resizingTask || !hook.resizeHandle) return;

      const deltaX = e.clientX - hook.dragStartX;
      const deltaDays = Math.round(deltaX / hook.dayWidth);
      const startDate = new Date(hook.resizingTask.dataset.startDate);
      const endDate = new Date(hook.resizingTask.dataset.endDate);

      if (hook.resizeHandle === "left") {
        const newStartDate = new Date(startDate);
        newStartDate.setDate(newStartDate.getDate() + deltaDays);
        
        if (newStartDate < endDate) {
          hook.pushEvent("gantt-task-resized", {
            task_id: hook.resizingTask.dataset.taskId,
            start_date: newStartDate.toISOString().split("T")[0],
            end_date: endDate.toISOString().split("T")[0]
          });
        }
      } else if (hook.resizeHandle === "right") {
        const newEndDate = new Date(endDate);
        newEndDate.setDate(newEndDate.getDate() + deltaDays);
        
        if (newEndDate > startDate) {
          hook.pushEvent("gantt-task-resized", {
            task_id: hook.resizingTask.dataset.taskId,
            start_date: startDate.toISOString().split("T")[0],
            end_date: newEndDate.toISOString().split("T")[0]
          });
        }
      }

      hook.resizingTask = null;
      hook.resizeHandle = null;
      document.removeEventListener("mousemove", handleResizeMove);
      document.removeEventListener("mouseup", handleResizeEnd);
    };

    document.addEventListener("mousemove", handleResizeMove);
    document.addEventListener("mouseup", handleResizeEnd);
  }
};


