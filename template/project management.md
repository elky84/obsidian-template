---
title: project management
date:  <% tp.date.now("YYYY-MM-DD") %>
tags: 'project'
---

# PM-projectname
## 🏆 Goal
> 프로젝트의 목표를 작성한다.

## 📅  Scheduel
> 프로젝트의 일정을 작성한다. 
> 프로젝트의 일정을 표현하는 라는 태그를 달아서 tasks에서 볼 수 있도록 한다.
> 내가 설정한 Milestone 마감 기한도 이곳에 작성한다.

##  💎Milestones
> 중간 지점을 표현한다

## ✅Tasks
- 각 마일스톤을 달성하기 위해서 필요한 태스크들을 하나씩 열거한다.
- 할당시간과 그에 따른 마감일 기록한다.

## 📊 Gantt
> 스케쥴을 바탕으로 Gantt 차트를 작성한다.
```mermaid
gantt
    dateFormat  YYYY-MM-DD
	title  Gantt
	
    section A section
    Completed task            :done,    des1, 2021-09-06,2021-09-08
    Active task               :active,  des2, 2021-09-09, 3d
    Future task               :         des3, after des2, 5d
    Future task2              :         des4, after des3, 5d

    section Critical tasks
    Completed task in the critical line :crit, done, 2021-09-06,24h
    Implement parser and jison          :crit, done, after des1, 2d
    Create tests for parser             :crit, active, 3d
    Future task in critical line        :crit, 5d
    Create tests for renderer           :2d
    Add to mermaid                      :1d

    section Documentation
    Describe gantt syntax               :active, a1, after des1, 3d
    Add gantt diagram to demo page      :after a1  , 20h
    Add another diagram to demo page    :doc1, after a1  , 48h

    section Last section
    Describe gantt syntax               :after doc1, 3d
    Add gantt diagram to demo page      :20h
    Add another diagram to demo page    :48h
	
	section test
	Active task 			: doc1, 2021-09-02, 2021-09-04
	
```
---
## Reference