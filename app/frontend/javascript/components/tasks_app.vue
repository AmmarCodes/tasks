<script>
import axios from "axios";
import Task from "./task.vue";
axios.defaults.headers.common["X-CSRF-Token"] = document
  .querySelector('meta[name="csrf-token"]')
  .getAttribute("content");

export default {
  data() {
    return {
      tasks: [],
    };
  },
  created() {
    axios.get("/tasks.json").then(({ data }) => {
      this.tasks = data;
    });
  },
  components: { Task },
  methods: {
    completeTask(id) {
      axios.put(`/tasks/${id}/complete`).then((result) => {
        console.log(result);
      });
    },
    uncompleteTask(id) {
      axios.put(`/tasks/${id}/uncomplete`).then((result) => {
        console.log(result);
      });
    },
  },
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
      @complete="completeTask"
      @uncomplete="uncompleteTask"
    />
  </div>
</template>
