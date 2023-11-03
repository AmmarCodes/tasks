import { createApp } from "vue";
import { createRouter, createWebHistory } from "vue-router";
import App from "~/javascript/components/app.vue";
import TasksApp from "~/javascript/components/tasks_app.vue";
import SingleTaskApp from "~/javascript/components/single_task_app.vue";

const routes = [
  { path: "/", redirect: { name: "tasks" } },
  { path: "/tasks", component: TasksApp, name: "tasks" },
  { path: "/tasks/:id", component: SingleTaskApp, name: "task" },
];

const router = createRouter({ history: createWebHistory(), routes });

const appEl = document.getElementById("app");
if (appEl) {
  createApp(App).use(router).mount(appEl);
}
