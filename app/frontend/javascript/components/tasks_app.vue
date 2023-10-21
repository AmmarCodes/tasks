<script setup>
import { ref } from "vue";
const greeting = ref("Hello World!");
</script>

<template>
  <h1>Tasks</h1>
  <div class="text-end mb-3">
    <a href="#" class="btn btn-outline-primary">New Task</a>
  </div>
  <div class="row row-cols-1 g-4">
    <div class="card">
      <div class="card-body">
        <div class="d-flex w-100 justify-content-between">
          <div class="fw-semibold fs-5 card-title">
            <input
              class="form-check-input me-1"
              type="checkbox"
              value=""
              id="task-"
            />
            <label class="form-check-label" for="task">Tast title</label>
          </div>
          <small>due date</small>
        </div>
        <div style="padding-left: 1.8rem" class="card-text">content</div>
        <div class="text-end">Edit Delete</div>
      </div>
    </div>
  </div>
</template>
