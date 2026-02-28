## [[<% tp.date.now("YYYY-MM-DD", -1, tp.file.title, "YYYY-MM-DD") %>| <<]] | <% tp.file.title %> | [[<% tp.date.now("YYYY-MM-DD", 1, tp.file.title, "YYYY-MM-DD") %> | >> ]]


# 📅  일정

# 📒 메모


# 🔁 습관
- [ ] 약 먹기 ⏰<% tp.file.title %> 📅 <% tp.file.title %>

# 🗓️ 할 일
```tasks 
not done 
due <% tp.file.title %> 
description regex does not match /^$/ 
path does not include Daily Notes
hide due date
hide recurrence rule
```
# ⏳ 스케쥴
```tasks 
not done 
(scheduled <% tp.file.title %>)
description regex does not match /^$/ 
heading does not include 습관
path does not include Daily Notes
hide due date
hide recurrence rule
```
## ⌛ 놓친 일
```tasks 
not done 
due before <% tp.file.title %> 
hide recurrence rule
```
## 💻업무
### 진행 중 업무
```base
views:
  - type: table
    name: Table
    filters:
      and:
        - file.folder.startsWith("1. Project")
        - '!file.tags.contains("excalidraw")'
        - file.ext != "png"
        - start <= "<% tp.file.title %>"
        - end.isEmpty()
    order:
      - file.name
      - tags
      - start
      - end
      - due
    columnSize:
      file.name: 270
      note.tags: 301
      note.start: 219
      note.end: 123
      note.due: 188

```
### 오늘 마감 해야 될 일
```tasks
path includes 1. Project
due <% tp.file.title %>
not done
sort by due
```
### 오늘 완료 한 업무
```tasks
done due <% tp.file.title %>
path includes 3. Resource OR path includes 4. Archive
sort by done reverse
```
## ⌛ 놓친 일
### Task
```tasks 
not done 
due before <% tp.file.title %> 
hide recurrence rule
```
##  🗒️ 한 일
```tasks 
done <% tp.file.title %> 
hide due date
hide done date
recurrence does not include every day
heading does not include 습관
hide recurrence rule
```

# 회고
## 🗄️ 기록
- 

## Day planner
- 10:00 