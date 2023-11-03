<script>
import {
  completeTask,
  uncompleteTask,
  startTimer,
  stopTimer,
  getTask,
} from "../utils/methods";
import Task from "./task.vue";

export default {
  data() {
    return {
      task: null,
    };
  },
  created() {
    getTask(this.$route.params.id).then(({ data }) => {
      this.task = data;
    });
  },
  components: { Task },
  methods: { completeTask, uncompleteTask, startTimer, stopTimer },
};
</script>

<template>
  <div class="d-flex justify-content-between align-items-center my-3">
    <h1>Task</h1>
  </div>
  <div class="row row-cols-1 g-4">
    <Task
      v-if="task"
      v-bind="task"
      :timer-start-date="task.timer?.start_time"
      @complete="completeTask"
      @uncomplete="uncompleteTask"
      @start-timer="startTimer"
      @stop-timer="stopTimer"
    />
  </div>
</template>
