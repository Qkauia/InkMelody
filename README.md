# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# InkMelody

note:
2023-11-16 Rails-first
Rails流程:


1.Route(路徑)  //如果沒有回傳404
- get "about", to: "∆∆∆s#about"

2.Controller(控制器)
- 命名慣例(複數)
- rails g controller ∆∆∆s
  - 生成 ∆∆∆s_controller.rb
  - 在View生成pages目錄
- 尋找(∆∆∆s_controller.rb)action

2-1 controller裡的action會對應View/pages目錄裡同名.erb檔
  - 如果有View沒有action也會自己尋找
  -*erb = embedded ruby <%= %>(顯示畫面), <% %>(不顯示畫面)
    - erb註解方式 <%#= (1..42).to_a.sample(5) %>

3.View(畫面)
- 在∆∆∆s目錄建立一個about.html.erb檔案
 -View盡量不要放太多複雜邏輯(會導致切版混亂)丟給controller做

0.(練習)更改首頁
  -routes.rb添加
  -＊root "wlecome#index"
  -＄rails g controller welcome
  -＊welcome controller裡增加action(def index)
  -＊View/welcome/index.html.erb
  -＄rails s

