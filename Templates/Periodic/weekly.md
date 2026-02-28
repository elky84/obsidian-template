---
title: weekly
tags: weekly
---

## [[<% moment().startOf('week').format("YYYY-[W]WW") %>| <<]] | <% tp.file.title %> | [[<% moment().add(2, 'weeks').startOf('week').format("YYYY-[W]WW") %> | >> ]]

# 🏆 Goal

# 📝 Read it later

# ✅ Tasks
- [ ] Read it later 정리 ⏰<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %> 10:00 📅 <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>
- [ ] Weekly 노트 생성 ⏰<% moment().startOf('week').add(1, 'week').format('YYYY-MM-DD') %> 00:00 📅 <% moment().startOf('week').add(1, 'week').format('YYYY-MM-DD') %>

# Works
## 진행 할 일
### Tasks
```tasks
path includes 1. Project
has start date
not done
sort by start reverse
```
### Base
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
## 대기 중인 일
### Tasks
```tasks
path includes 2. Area
path does not include template
has start date
not done
sort by start reverse
```
### base
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("2. Area")
        - '!file.folder.startsWith("Templates")'
        - end.isEmpty()
        - "!start.isEmpty()"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.due: 157
```
## 완료 한 일
### Tasks
```tasks
path does not include 1. Project
path does not include template
done during <% moment().startOf('week').format('YYYY-MM-DD') %> to <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>
sort by done reverse
```

### Base
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - "!end.isEmpty()"
        - "!start.isEmpty()"
		- end >= "<% moment().startOf('week').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```

# 회고


# 📅 Schedule
##  🗒️[[<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>]] Sun

### 진행 중인 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 마감 해야 될 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - due >= "<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 완료 한 일
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
		- end >= "<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
### 할 일 (Tasks)
```tasks 
due <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일  (Tasks)
```tasks 
done due <% moment().startOf('week').add(0, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```

##  🗒️ [[<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>]]  Mon

### 진행 중인 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 마감 해야 될 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - due >= "<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 완료 한 일
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
		- end >= "<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
### 할 일 (Tasks)
```tasks 
due <% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일  (Tasks)
```tasks 
done due <% moment().startOf('week').add(1, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```

##  🗒️ [[<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>]]  Tue


### 진행 중인 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 마감 해야 될 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - due >= "<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 완료 한 일
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
		- end >= "<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
### 할 일 (Tasks)
```tasks 
due <% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일  (Tasks)
```tasks 
done due <% moment().startOf('week').add(2, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```

##  🗒️ [[<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>]]  Wed


### 진행 중인 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 마감 해야 될 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - due >= "<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 완료 한 일
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
		- end >= "<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
### 할 일 (Tasks)
```tasks 
due <% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일  (Tasks)
```tasks 
done due <% moment().startOf('week').add(3, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```

##  🗒️ [[<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>]]  Thu

### 진행 중인 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 마감 해야 될 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - due >= "<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 완료 한 일
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
		- end >= "<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
### 할 일 (Tasks)
```tasks 
due <% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일  (Tasks)
```tasks 
done due <% moment().startOf('week').add(4, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```

##  🗒️ [[<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>]]  Fri


### 진행 중인 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 마감 해야 될 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - due >= "<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 완료 한 일
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
		- end >= "<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
### 할 일 (Tasks)
```tasks 
due <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일  (Tasks)
```tasks 
done due <% moment().startOf('week').add(5, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```

##  🗒️[[<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>]]  Sat


### 진행 중인 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - file.path.contains("1. Project")
        - '!file.folder.startsWith("Templates")'
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 마감 해야 될 일

```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
        - due >= "<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>"
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157
```
### 완료 한 일
```base
views:
  - type: table
    name: Waiting
    filters:
      and:
        - '!file.folder.startsWith("Templates")'
		- end >= "<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>T00:00:00"  
		- end <= "<% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>T23:59:59"          
    order:
      - file.name
      - start
      - end
      - due
      - jira
      - tags
    columns:
      - file.link
      - start
      - end
      - const("대기") as Status
    columnSize:
      file.name: 411
      note.end: 223
      note.due: 157

```
### 할 일 (Tasks)
```tasks 
due <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>
not done
hide due date
hide done date
hide recurrence rule
```
### 한 일  (Tasks)
```tasks 
done due <% moment().startOf('week').add(6, 'days').format('YYYY-MM-DD') %>
hide due date
hide done date
hide recurrence rule
```