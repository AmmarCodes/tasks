# README

Rails app created using:

```bash
rails new tasks --skip-action-mailbox --skip-hotwire --skip-action-text --database=postgresql --css bootstrap
```

## Requirements

- [x] Make the Vue app loads on tasks index only
- [x] Convert tasks from html to Vue components
- [x] Load tasks from API
- [x] Check off tasks
- [x] Start/stop timers for a task
- [x] Get how much minutes each task has on record
- [ ] Show a report for a task how long did it take over the days
- [ ] Convert Create new task form to Vue

## Database structure

This is a basic initial structure of the models

```mermaid
classDiagram
    direction LR
    Task <-- User
    Task <-- Timelog
    Dependency *-- Source
    Task <-- Dependency
    class Task {
        +bool completed
        +string title
        +text body
        +int estimated_time
        +int actual_time
        +date due_date
        +mark_done()
    }
    class User {
        +String name
    }
    class Timelog {
      +timestamp start
      +timestamp end
      +start_timer()
      +stop_timer()
    }
    namespace Nice_To_Have {
        class Dependency {
            +string title
            +string url
        }
        class Source {
            +string title
            +string base_url
        }
        %% Source could be Todoist, Calendar, Email, Obsidian file, etc.
    }
```
