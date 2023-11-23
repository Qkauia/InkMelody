<!-- @format -->

# README

# InkMelody

# 上課筆記

=============================================================

## 2023-11-16 Rails-first

### Rails流程:

#### 1.Route(路徑) //如果沒有回傳404

`get "about", to: "∆∆∆s#about"`

#### 2.Controller(控制器)

- **命名慣例(複數)**
  - `rails g controller ∆∆∆s`
  - `生成 ∆∆∆s_controller.rb`
  - 在View生成pages目錄
  - 尋找(∆∆∆s_controller.rb)action

#### 2-1 **controller裡的action會對應View/pages目錄裡同名.erb檔**

- 如果有View沒有action也會自己尋找
  - **erb = embedded ruby** <%= %>(顯示畫面), <% %>(不顯示畫面)
  - erb註解方式 `<%#= (1..42).to_a.sample(5) %>`

#### 3.View(畫面)

- 在∆∆∆s目錄建立一個about.html.erb檔案
- View盡量不要放太多複雜邏輯(會導致切版混亂)丟給**controller**做

##### (練習)更改首頁

- **routes.rb**添加
- `root "wlecome#index"`
- `＄rails g controller welcome`
- **welcome_controller**裡增加**action**(def index)
- **View/welcome/index.html.erb**
- `＄rails s`

=============================================================

## 2023/11/20

### routes:

`get "about", to: "pages#about", as: :about`
**get "about_XXXXXX""**
(as綁定get可以自由更改)**as: :about->>綁定**
**如果沒加`as`路徑會隨著`get`走**

- 修改只要在`routes.rb`
- 閱讀程式碼比較方便
- 有問題馬上會顯示錯誤

**(resources) 列表頁**

- `/products`列表頁
- `/products_new` 新增
- `/products_123` 檢視
- `/products_123/edit` 編輯

### view:

`<%= link_to "about123", about_path %>`
`link_to`
第一個參數`顯示文字` 第二個參數`連結位置(也可以使用"/about")`

#### 為什麼要用框架寫：

- 一致性、有規律

### `RESTful API`

**HTTP Verb 動詞**:

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

`/resource/new -> /resource/create`
`<form action="送到頁面" method="資料操作方法">`

- `action`預設是當下頁面
- `method`沒有寫預設值是`get`

### CSRF

- 跨站請求偽造

`<input type="text" name="authenticity_token" value="<%= form_authenticity_token %>">`
**authenticity_token**驗證

#### 加強版HASH

```
{
"authenticity_token"=>"-oOrHVI1oieK13",
"title"=>"123232",
"description"=>"2312312",
"price"=>"232123",
"controller"=>"products",
"action"=>"create"
}
```

**Ruby`HASH`取得方式:**

- `params[:price]`
- `params["price"]` 方便其他程式語言寫入

#### model 流程:

```
(櫃檯)->人話
action->model->(SQL)->DB(資料庫)
        model<--------DB(DataBase)
        (取資料)->(翻譯)
```

#### 建立model:

**第一步構思資料型別**
**P**roduct(**開頭大寫**)

- title:string
- description:text
- price:decimal
- price:integer

**透過指令建立model:**

1. `$ rails g model Product title description:text price:decimal`

- 表格(table)名字是∆∆∆s(**小寫複數**)
- `model`名字是開頭大寫(**單數**)
- `t.timestamps`縮寫
  1. t.datetime :create_at
  2. t.datetime :updated_at
- 另外有一個隱藏欄位(流水編號)**id**

2. `$rails db:migrate` **資料結構匯入**

- `migration`=> `DB成長記錄`
- 一個資料庫(DataBase)可以有**很多表格**(table)

#### 資料庫資料語法:

**可以透過`$ rails c --sandbox`對資料庫測試
(`--sandbox`**control d後\*\*資料庫會還原)

- `$rails c --sandbox`
- `p1 = Product.new`
- `p1.title = "Rails"`
- `p1.price = 1000`
- `p1.save`

- `content = { title: "Hello", description: "uuuuu", price: 1000}`
- `p1 = Product.new(content)`

- `Product.count`**資料庫幾筆資料**
- `Product.all` **列出所有資料(包含內容)**
- `p1.errors.any?`**有沒有錯**
- `p1.errors.full_messages`**顯示錯誤訊息**

可以透過`HTML`的`name="product[title]"`將`params`另外打包
**範例：**

```
<input type="number" min="0" name="product[price]" id="price">
```

=============================================================

## 2023/11/23

### 存檔驗證判斷：

- model處理驗證
  - 必填欄位
    validates :title, presence: true
    validates :price, numericality: true
    - ruby語法省略小括號跟大括號

### 回傳失敗，希望頁面保留表單內容：

- `render :new`
  借用`app/view/products/new.html.erb`

### 建立成功訊息

- flash[:notice] = "新增商品成功"
- flash[:alert] = "新增商品成功"
  可以直接加在redirect_to後方當參數使用
  redirect_to root_path, notice: "新增商品成功"

### prefix

```module 三重
  class 金城武
  end
end
```

### namespace

`三重::金城武`

`ruby`**最後一個參數**`hash`<u>大括號可以省略</u>
link_to '首頁', root_path , class: 'color-red , method: 'post'

## model 代表資料庫代理人

### form_with 表單

`model: @product`會推測路徑,方法並帶token

### Rails 兩大原則

- DRY = Don't Repeat Yourself
- CoC = Convention over Configuration 遵照慣例優於設定

所有erb檔都在/Users/qkauia/Desktop/InkMelody/app/views/layouts/application.html.erb

### 路徑依照程式碼由上而下閱讀：

- 注意有id路徑記得放下面，要不然其他網址可能會被當id使用

### 找資料：

- find(num流水編號) 找不到回傳錯誤訊息

- [v]find_by(多元) 找不到回傳nil 1個
  - 找到第一筆就結束了
- [v]find_by!(多元) 找不到回傳錯誤訊息 1個

- where(id: ID) 找不到回傳空陣列 找到一堆(陣列) 取值.first

#### ruby替換文字語法

`gsub("\n", '<br />').html_safe`

### 如果要資料要反向排序，請交給controller做

- 使用`order(id: :desc)
