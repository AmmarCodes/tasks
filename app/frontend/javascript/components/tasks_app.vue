<script>
import {
  completeTask,
  uncompleteTask,
  startTimer,
  stopTimer,
  getTasks,
} from "../utils/methods";
import Task from "./task.vue";

export default {
  data() {
    return {
      tasks: [],
    };
  },
  created() {
    getTasks().then(({ data }) => {
      this.tasks = data;
    });
  },
  components: { Task },
  methods: { completeTask, uncompleteTask, startTimer, stopTimer },
};
</script>

<template>
  <div class="d-flex justify-content-between align-items-center my-3">
    <h1>Tasks</h1>
    <a href="#" class="btn btn-outline-primary">New Task</a>
  </div>
  <div class="row row-cols-1 g-4">
    <Task
      v-for="task in tasks"
      v-bind="task"
      v-bind:key="task.id"
      :timer-start-date="task.timer?.start_time"
      @complete="completeTask"
      @uncomplete="uncompleteTask"
      @start-timer="startTimer"
      @stop-timer="stopTimer"
    />
  </div>
</template>
