<script setup>
import { Timer } from "easytimer.js";
import parseISO from "date-fns/parseISO";
import { ref } from "vue";
import { onMounted } from "vue";

const props = defineProps({
  id: Number,
  title: String,
  content: String,
  due_date: String,
  completed: Boolean,
  has_active_timer: Boolean,
  timerStartDate: String,
});

let timerStarted = ref(Boolean(props.has_active_timer));

const timer = new Timer();
let timerEventListener;

onMounted(() => {
  // set the current timer to equal the active timer in the backend
  if (timerStarted && props.timerStartDate) {
    const timerStartTime = parseISO(props.timerStartDate);

    const seconds = Math.round((new Date() - timerStartTime) / 1000);
    timer.start({
      startValues: { seconds: seconds },
    });
    setTimeValue();

    timerEventListener = timer.addEventListener("secondsUpdated", () => {
      setTimeValue();
    });
  }
});

const setTimeValue = () => {
  time.value = timer.getTimeValues().toString(["hours", "minutes", "seconds"]);
};

let time = ref("00:00:00");
const emit = defineEmits(["complete", "uncomplete", "startTimer", "stopTimer"]);

const handleTaskChange = (event) => {
  emit(event.target.checked ? "complete" : "uncomplete", props.id);
};

const handleTimerToggle = () => {
  if (timerStarted.value) {
    timerStarted.value = false;
    timer.pause();
    emit("stopTimer", props.id);
    removeEventListener("secondsUpdated", timerEventListener);
  } else {
    timerStarted.value = true;
    timer.start();
    timerEventListener = timer.addEventListener("secondsUpdated", () => {
      setTimeValue();
    });
    emit("startTimer", props.id);
  }
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
