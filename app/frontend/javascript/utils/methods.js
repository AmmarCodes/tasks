import axios from "axios";
axios.defaults.headers.common["X-CSRF-Token"] = document
  .querySelector('meta[name="csrf-token"]')
  .getAttribute("content");

export function completeTask(id) {
  axios.put(`/api/tasks/${id}/complete`);
}
export function uncompleteTask(id) {
  axios.put(`/api/tasks/${id}/uncomplete`);
}
export function startTimer(id) {
  axios.put(`/api/tasks/${id}/start`);
}
export function stopTimer(id) {
  axios.put(`/api/tasks/${id}/stop`);
}
export function getTasks() {
  return axios.get("/api/tasks.json");
}
export function getTask(id) {
  return axios.get(`/api/tasks/${id}.json`);
}
