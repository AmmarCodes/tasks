import axios from "axios";
axios.defaults.headers.common["X-CSRF-Token"] = document
  .querySelector('meta[name="csrf-token"]')
  .getAttribute("content");

export function completeTask(id) {
  axios.put(`/tasks/${id}/complete`);
}
export function uncompleteTask(id) {
  axios.put(`/tasks/${id}/uncomplete`);
}
export function startTimer(id) {
  axios.put(`/tasks/${id}/start`);
}
export function stopTimer(id) {
  axios.put(`/tasks/${id}/stop`);
}
export function getTasks() {
  return axios.get("/tasks.json");
}
export function getTask(id) {
  return axios.get(`/tasks/${id}.json`);
}
