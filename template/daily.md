---
title: <% tp.file.title %>
created:  <% tp.file.creation_date() %>
tags: dailynote
---
## [[<% tp.date.now("YYYY-MM-DD", -1, tp.file.title, "YYYY-MM-DD") %>| <<]] | <% tp.file.title %> | [[<% tp.date.now("YYYY-MM-DD", 1, tp.file.title, "YYYY-MM-DD") %> | >> ]]

# 📅  일정

# 🔁 습관
- [ ] 영양제
# 📒 메모
- 
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
## 💻업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    start,
    due,
    end,
    "진행 중" as Status
FROM #
WHERE contains(file.path, "Working") AND !contains(file.path, "Templates") 
SORT start DESC
```
## ⌛ 놓친 일
```tasks 
not done 
due before <% tp.file.title %> 
hide recurrence rule
```

# 📃 회고

##  🗒️ 한 일
```tasks 
done <% tp.file.title %> 
hide due date
hide done date
recurrence does not include every day
heading does not include 습관
hide recurrence rule
```

## 🗄️ 기록
- 
## Day planner
- 00:00 