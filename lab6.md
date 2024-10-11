# <div align="center">Rails相关gem功能调研</div>

> 调研结果来自https://rubygems.org/gems/rails/versions/7.2.1

### activejob

> Declare job classes that can be run by a variety of queuing backends.

​	Active Job 框架负责声明作业，在各种队列后端中运行。

### activemodel

> A toolkit for building modeling frameworks like Active  Record. Rich support for attributes, callbacks, validations,  serialization, internationalization, and testing.

​	Active Model 库包含很多模块，用于开发要在 Active Record 中存储的类。

### activerecord

> Databases on Rails. Build a persistent domain model by  mapping database tables to Ruby classes. Strong conventions for  associations, validations, aggregations, migrations, and testing come  baked-in.

​	Active Record 是 MVC中的 M（模型），负责处理数据和业务逻辑。Active Record 负责创建和使用需要持久存入数据库中的数据。Active Record 实现了 Active Record 模式，是一种对象关系映射系统。

### activesupport

> A toolkit of support libraries and Ruby core extensions  extracted from the Rails framework. Rich support for multibyte strings,  internationalization, time zones, and testing.

​	Active Support是Ruby on Rails组件，负责提供Ruby语言的扩展和实用工具。它在语言层面上提供了更丰富的功能，既适用于开发Rails应用程序，也适用于开发Ruby on Rails本身。

### actionmailer

> Email on Rails. Compose, deliver, and test emails using the familiar controller/view pattern. First-class support for multipart  email and attachments.

​	Rails 使用 Action Mailer 实现发送邮件功能，邮件由邮件程序和视图控制。邮件程序继承自 `ActionMailer::Base`，作用与控制器类似，保存在 `app/mailers` 文件夹中，对应的视图保存在 `app/views` 文件夹中。

### actionpack

> Web apps on Rails. Simple, battle-tested conventions for  building and testing MVC web applications. Works with any  Rack-compatible server.

​	`ActionPack` 是 Ruby on Rails 框架中的一个组件，它包含了 `ActionController` 和 `ActionView` 两个子模块，用于处理 HTTP 请求和生成响应。`ActionController` 负责控制器逻辑，而 `ActionView` 负责视图渲染。

### actionview

> Simple, battle-tested conventions and helpers for building web pages.

​	`ActionView` 是 Rails 中的视图组件，用于生成 HTML 响应。视图通常与控制器动作对应，并使用模板文件（如 ERB 或 Haml）来定义 HTML 结构。