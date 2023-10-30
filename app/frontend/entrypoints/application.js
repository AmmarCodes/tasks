import { createApp } from "vue";
import TasksApp from "~/javascript/components/tasks_app.vue";
import SingleTaskApp from "~/javascript/components/single_task_app.vue";

const appEl = document.getElementById("app");
if (appEl) {
  createApp(TasksApp).mount(appEl);
}

const singleTaskAppEl = document.getElementById("single-task-app");
if (singleTaskAppEl) {
  createApp(SingleTaskApp)
    .provide("taskId", parseInt(singleTaskAppEl.dataset.taskId, 10))
    .mount(singleTaskAppEl);
}
