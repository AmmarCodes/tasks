<script setup>
import { ref } from "vue";

const props = defineProps({
  id: Number,
  title: String,
  content: String,
  due_date: String,
  completed: Boolean,
  has_active_timer: Boolean,
});

let timerStarted = ref(Boolean(props.has_active_timer));
const emit = defineEmits([
  "complete",
  "uncomplete",
  "start_timer",
  "stop_timer",
]);

const handleTaskChange = (event) => {
  emit(event.target.checked ? "complete" : "uncomplete", props.id);
};

const handleTimerToggle = () => {
  if (timerStarted.value) {
    timerStarted.value = false;
    emit("stopTimer", props.id);
  } else {
    timerStarted.value = true;
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
              :id="'task-' + id"
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
            <span>time counter 00:30</span>
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
