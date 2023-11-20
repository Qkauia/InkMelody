# README

# InkMelody

# note

## 2023-11-16 Rails-first

### Rails流程:

#### 1.Route(路徑)  //如果沒有回傳404
```get "about", to: "∆∆∆s#about"```

#### 2.Controller(控制器)
- **命名慣例(複數)**
  - ```rails g controller ∆∆∆s```
  - ```生成 ∆∆∆s_controller.rb```
  - 在View生成pages目錄
  - 尋找(∆∆∆s_controller.rb)action

#### 2-1 **controller裡的action會對應View/pages目錄裡同名.erb檔**
  - 如果有View沒有action也會自己尋找
    - **erb = embedded ruby** <%= %>(顯示畫面), <% %>(不顯示畫面)
    - erb註解方式 ```<%#= (1..42).to_a.sample(5) %>```

#### 3.View(畫面)
  - 在∆∆∆s目錄建立一個about.html.erb檔案
  - View盡量不要放太多複雜邏輯(會導致切版混亂)丟給**controller**做

##### (練習)更改首頁
  - **routes.rb**添加
  - ```root "wlecome#index"```
  - ```＄rails g controller welcome```
  - **welcome_controller**裡增加**action**(def index)
  - **View/welcome/index.html.erb**
  - ```＄rails s```

## 2023/11/20

### routes:

```get "about", to: "pages#about", as: :about```
**get "about_XXXXXX""**(as綁定get可以自由更改)**as: :about->>綁定**
**如果沒加`as`路徑會隨著`get`走**
  - 修改只要在routes.rb
  - 閱讀程式碼比較方便
  - 有問題馬上會顯示錯誤

**/(resources) 列表頁**
 - /products 列表頁
 - /products_new 新增
 - /products_123 檢視
 - /products_123/edit 編輯

### view:

```<%= link_to "about123", about_path %>```
`link_to` 第一個參數`顯示文字` 第二個參數`連結位置(也可以使用"/about")`

#### 為什麼要用框架寫：
  - 一致性、有規律

### `RESTful API`
HTTP Verb 動詞:
  - 資源操作：
    - `GET` resource 讀取(最常見讀取手法) 接收資料會顯示在網址頁(送的資料有上限(網址長度))
      收尋引擎也是透過`get`
    - `POST` resource 新增資料 傳送資料不會顯示網址頁(上傳附檔)
    - `PATH` resource 更新資料 資料裡面某些欄位
    - `PUT` resource 更新資料 一筆換一筆
    - `DELETE` resource 刪除資料

輸入框掛上`name`當表單送出會接收
`http://127.0.0.1:3000/products/new?title=123&description=456&price=789`
**`title=123&description=456&price=789`**

/resource/new -> /resource/create
<form action="送到頁面" method="資料操作方法">
  - `action`預設是當下頁面
  - `method`沒有寫預設值是`get`

### CSRF
  - 跨站請求偽造

```<input type="text" name="authenticity_token" value="<%= form_authenticity_token %>">```
**authenticity_token**驗證

#### 加強版HASH

  ```{
  "authenticity_token"=>"-oOrHVI1oieK13", 
  "title"=>"123232", 
  "description"=>"2312312", 
  "price"=>"232123", 
  "controller"=>"products", 
  "action"=>"create"
  }
  ```

`params[:price]`
`params["price"]`


#### model 流程:
(櫃檯)->人話
action->model->(SQL)->DB(資料庫)
        model<--------DB(DataBase)
        (取資料)->(翻譯)
        
#### 建立model:
**第一步構思資料型別**
Product(建議開頭大寫)
  - title:string
  - description:text
  - price:decimal
  - price:integer

**透過指令建立model:**
1. `$ rails g model Product title description:text price:decimal`
  - 表格(table)名字是∆∆∆s(小寫複數)
  - model名字是開頭大寫(單數)
  - `t.timestamps`縮寫
    - t.datetime :create_at
    - t.datetime :updated_at
  - 另外有一個隱藏欄位(流水編號)
2. `$rails db:migrate` **資料結構匯入**
3. 


* `migration`=> `DB成長記錄`
* 一個資料庫(DataBase)可以有很多表格(table)


#### 資料庫資料語法
`$rails c --sandbox`
`p1 = Product.new`
`p1.title = "Rails"`
`p1.price = 1000`
`p1.save`

`content = { title: "Hello", description: "uuuuu", price: 1000}`
`p1 = Product.new(content)`

`Product.count`**資料庫幾筆資料**
`Product.all` **列出所有資料(包含內容)**


可以透過`HTML`的```name="product[title]"```將`params`另外打包