## [[<% tp.date.now("YYYY-MM-DD", -1, tp.file.title, "YYYY-MM-DD") %>| <<]] | <% tp.file.title %> | [[<% tp.date.now("YYYY-MM-DD", 1, tp.file.title, "YYYY-MM-DD") %> | >> ]]

# 📅  일정

# 🔁 습관
- [ ] 영양제 (@<% tp.file.title %> 11:00) 📅 <% tp.file.title %>

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
### 진행 중 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE start != null AND contains(file.path, "1. Project")
SORT start DESC
```
### 오늘 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE due != null AND start != null AND dateformat(due, "yyyy-MM-dd") <= "<% tp.file.title %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 오늘 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% tp.file.title %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
## ⌛ 놓친 일
### Task
```tasks 
not done 
due before <% tp.file.title %> 
hide recurrence rule
```
### Dataview
```dataview
TABLE WITHOUT ID
    file.link as Title,
    start,
    due,
    end,
    (contains(file.path, "4. Archive") or contains(file.path, "3. Resource")) as Completed
WHERE due != null AND contains(file.path, "1. Project") AND dateformat(end, "yyyy-MM-dd") > "<% tp.file.title %>"
SORT start DESC
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
- 10:00 
- [ ] 13:00 점심 식사 (@<% tp.file.title %> 13:00) 📅 <% tp.file.title %>
- 14:00