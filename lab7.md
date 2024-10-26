# <div align="center">rails是怎么启动的</div>

​	当执行 `rails server` 命令后，主要会启动一个 Web 服务器程序（如 Puma），然后这个 Web 服务器会把收到的请求路由给 Rails 程序。

## 1. 初始化 Rails 环境

​	当运行 `rails server` 命令时，Rails 会首先加载应用程序的环境配置。这包括加载`config/application.rb` 文件，该文件定义了应用程序的配置和初始化过程。

## 2. 加载 Gemfile 和 Gem

​	Rails 使用 Bundler 来管理 Gem 依赖。在初始化过程中，Rails 会调用 Bundler 来加载 `Gemfile` 中列出的所有 Gem。这些 Gem 会被加载到应用程序的运行时环境中，以便在应用程序中使用。

```ruby
# Gemfile
source 'https://rubygems.org'

gem 'rails', '~> 6.0.3'
gem 'puma', '~> 4.1'
# 其他 Gem 依赖
```

## 3. 启动Web服务器

​	在加载完所有的Gem和配置后，Rails会启动指定的web服务器(默认是Puma)，Puma服务器会监听默认的端口(默认是3000)，等待接收HTTP请求。

```ruby
# config/puma.rb
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
```

## 4. 路由请求

​	当Puma服务器接收到HTTP请求时，他会将请求传递给Rails应用程序，Rails会根据`config/routes.rb`文件中的路由配置，将请求分发到相应的控制器和动作。

```ruby
# config/routes.rb
Rails.application.routes.draw do
  root 'welcome#index'
  # 其他路由配置
end
```

