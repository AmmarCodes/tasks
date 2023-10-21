<script setup>
const props = defineProps({
  id: Number,
  title: String,
  content: String,
  due_date: String,
  completed: Boolean,
});
const emit = defineEmits(["complete", "uncomplete"]);

const handleTaskChange = (event) => {
  emit(event.target.checked ? "complete" : "uncomplete", props.id);
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
            <label class="form-check-label" :for="'task-' + id">{{
              title
            }}</label>
          </div>
          <small>{{ due_date }}</small>
        </div>
        <div style="padding-left: 1.8rem" class="card-text">{{ content }}</div>
        <!-- <div class="text-end">Edit Delete</div> -->
      </div>
    </div>
  </div>
</template>
