---
title: <% tp.file.title %>
tags:
  - Quarterly
---

## [[<% moment().subtract(1, "quarter").format("YYYY-[Q]Q") %>| <<]] | <% tp.file.title %> | [[<% moment().add(1, "quarter").format("YYYY-[Q]Q") %> | >> ]]

## 🏆 Goal

## ✅ Tasks
- [ ] 회고 (@<% moment().endOf('quarter').format('YYYY-MM-DD') %> 13:00) 📅 <% moment().endOf('quarter').format('YYYY-MM-DD') %>
- [ ] Quarterly 노트 생성 (@<% moment().add(3, 'month').format('YYYY-MM-DD') %> 00:00) 📅 <% moment().add(3, 'month').format('YYYY-MM-DD') %>
# 회고
- 
## [[<% moment().format('YYYY-MM') %>]]
## [[<% moment().add(1, 'month').format('YYYY-MM') %>]]
## [[<% moment().add(2, 'month').format('YYYY-MM') %>]]
