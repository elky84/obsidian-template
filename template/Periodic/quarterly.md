---
title: <% tp.file.title %>
tags:
  - Quarterly
---

## [[<% moment().subtract(1, "quarter").format("YYYY-[Q]Q") %>| <<]] | <% tp.file.title %> | [[<% moment().add(1, "quarter").format("YYYY-[Q]Q") %> | >> ]]

## 🏆 Goal

## ✅ Tasks
- [ ] 회고 ⏰<% moment().endOf('quarter').format('YYYY-MM-DD') %> 13:00 📅 <% moment().endOf('quarter').format('YYYY-MM-DD') %>
- [ ] Quarterly 노트 생성 ⏰<% moment().startOf('quarter').add(1, 'quarter').format('YYYY-MM-DD') %> 00:00 📅 <% moment().startOf('quarter').add(1, 'quarter').format('YYYY-MM-DD') %>
# 회고
- 
## [[<% moment().startOf('quarter').format('YYYY-MM') %>]]
## [[<% moment().startOf('quarter').add(1, 'month').format('YYYY-MM') %>]]
## [[<% moment().startOf('quarter').add(2, 'month').format('YYYY-MM') %>]]
