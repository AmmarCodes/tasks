<script>
import { Timer } from "easytimer.js";
import parseISO from "date-fns/parseISO";

let timerEventListener;

export default {
  name: "Task",
  emitt: ["complete", "uncomplete", "startTimer", "stopTimer"],
  data() {
    return {
      time: "00:00:00",
      timerStarted: false,
      timer: null,
    };
  },
  props: {
    id: Number,
    title: String,
    content: String,
    due_date: String,
    completed: Boolean,
    has_active_timer: Boolean,
    timerStartDate: String,
    duration: Number,
  },
  mounted() {
    this.timerStarted = this.has_active_timer;
    // add any existing `duration` to the `seconds` of the last timer
    let seconds = this.duration;

    if (this.timerStarted && this.timerStartDate) {
      // set the current timer to equal the active timer in the backend
      const timerStartTime = parseISO(this.timerStartDate);
      seconds += Math.round((new Date() - timerStartTime) / 1000);
      this.timer = new Timer();
      this.timer.start({
        startValues: { seconds: seconds },
      });

      timerEventListener = this.timer.addEventListener(
        "secondsUpdated",
        this.setTimeValue,
      );
    } else {
      this.timer = new Timer({
        startValues: { seconds: seconds },
      });
    }
    this.setTimeValue();
  },
  methods: {
    handleTaskChange(event) {
      this.$emit(event.target.checked ? "complete" : "uncomplete", this.id);
    },
    handleTimerToggle() {
      if (this.timerStarted) {
        this.timerStarted = false;
        this.timer.pause();
        this.$emit("stopTimer", this.id);
        removeEventListener("secondsUpdated", timerEventListener);
      } else {
        this.timerStarted = true;
        this.timer.start();
        timerEventListener = this.timer.addEventListener(
          "secondsUpdated",
          this.setTimeValue,
        );
        this.$emit("startTimer", this.id);
      }
    },
    setTimeValue() {
      this.time = this.timer
        .getTimeValues()
        .toString(["hours", "minutes", "seconds"]);
    },
  },
};
</script>

<template>
  <div class="col">
    <div class="card">
      <div class="card-body">
        <div class="d-flex w-100 justify-content-between">
          <div class="fw-semibold fs-5 card-title m-0">
            <input
              class="form-check-input me-2"
              type="checkbox"
              value="true"
              :checked="completed"
              @change="handleTaskChange"
            />
            <span>{{ title }}</span>
          </div>
          <small>{{ due_date }}</small>
        </div>
        <div style="padding-left: 1.8rem" class="card-text">{{ content }}</div>
        <!-- <div class="text-end">Edit Delete</div> -->
      </div>
      <div class="card-footer">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <i class="bi bi-stopwatch"></i>
            Estimated time: xx min
          </div>
          <div>
            <span>{{ time }}</span>
            <button
              class="btn btn-icon"
              title="Start a timer"
              @click="handleTimerToggle"
            >
              <i
                class="bi"
                :class="timerStarted ? 'bi-pause-circle' : 'bi-play-circle'"
              ></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
