---
title: weekly
tags: weekly
---
## [[<% moment().startOf('week').format("YYYY-[W]WW") %>| <<]] | <% tp.file.title %> | [[<% moment().add(2, 'weeks').startOf('week').format("YYYY-[W]WW") %> | >> ]]

## 🏆 Goal

## ✅ Tasks
- [ ] 식물 물 주기 ⏰ <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %> 19:00 📅 <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>
### 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    start,
    end,
    "진행 중" as Status
WHERE contains(file.path, "1. Project") AND start != null
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    start,
    end,
    "완료" as Status
WHERE (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) AND dateformat(end, "W") = dateformat(date(now), "W")
SORT start DESC
```
# 회고


# 📅 Schedule
##  🗒️[[<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>]] Sun
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
### 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(due, "yyyy-MM-dd") >= "<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>" AND dateformat(due, "yyyy-MM-dd") <= "<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
### 할 일
```tasks 
due <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일
```tasks 
done due <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>]]  Mon
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
### 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(due, "yyyy-MM-dd") >= "<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>" AND dateformat(due, "yyyy-MM-dd") <= "<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
### 할 일
```tasks 
due <% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일
```tasks 
done due <% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
```
###  🗒️ [[<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>]]  Tue
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
### 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(due, "yyyy-MM-dd") >= "<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>" AND dateformat(due, "yyyy-MM-dd") <= "<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
### 할 일
```tasks 
due <% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일
```tasks 
done due <% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>]]  Wed
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
### 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(due, "yyyy-MM-dd") >= "<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>" AND dateformat(due, "yyyy-MM-dd") <= "<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
### 할 일
```tasks 
due <% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일
```tasks 
done due <% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>]]  Thu
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
### 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(due, "yyyy-MM-dd") >= "<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>" AND dateformat(due, "yyyy-MM-dd") <= "<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
### 할 일
```tasks 
due <% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일
```tasks 
done due <% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️ [[<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>]]  Fri
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
### 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(due, "yyyy-MM-dd") >= "<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>" AND dateformat(due, "yyyy-MM-dd") <= "<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
### 할 일
```tasks 
due <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일
```tasks 
done due <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```
###  🗒️[[<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>]]  Sat
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
### 마감 해야 될 일
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(due, "yyyy-MM-dd") >= "<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>" AND dateformat(due, "yyyy-MM-dd") <= "<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>" AND contains(file.path, "1. Project")
SORT start DESC
```
### 완료 한 업무
```dataview
TABLE WITHOUT ID
    file.link as Title,
    tags,
    start,
    due,
    end
WHERE dateformat(end, "yyyy-MM-dd") = "<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>" AND (contains(file.path, "3. Resource") or contains(file.path, "4. Archive")) 
SORT start DESC
```
### 할 일
```tasks 
due <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일
```tasks 
done due <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```