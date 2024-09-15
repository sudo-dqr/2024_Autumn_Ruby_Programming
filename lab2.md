# <div align = "center">lab2:case equlity调研</div>

## 1. case equality(===)

​	**`===`主要用于case语句的相容性判断**：

* 在左侧为Range时，`===`用于判断等号右边的对象是否包含于等号左边的Range

  ```ruby
  (1..10) === 5
  ```

* 在左侧为正则表达式时，`===`用于判断等号右边的字符串对象是否匹配左边的字符串模式

  ```ruby
  /\d+/ === '123'
  ```

* 在左侧为类名时，`===`用来判断一个对象是否为类的实例

  ```ruby
  String === 's'
  ```

* 在左侧为符号时，`===`用来判断等号两边的符号对象是否相同
  ```ruby
  :s === 's'
  ```

​	对于`===`判断语句的真假性，可以如下理解：**将等号左边视为一个容器，将等号右边的对象放在该容器中，如果有意义返回值就是true，否则返回false**

​	运算符`===`在Ruby中作为``case-when``语句的底层实现，例如：

```ruby
case some_object
when /a regex/
  # The regex matches
when 2..4
  # some_object is in the range 2..4
when lambda {|x| some_crazy_custom_predicate }
  # the lambda returned true
end

#等同于

if /a regex/ === some_object
  # The regex matches
elsif (2..4) === some_object
  # some_object is in the range 2..4
elsif lambda {|x| some_crazy_custom_predicate } === some_object
  # the lambda returned true
end
```

## 2. Ruby中的其他相等比较符号

* `==`：比较对象的值相等性，只做字面值上的比较，而不对内存进行比较
* `eql?`：比较对象的hash值，更加严格的比较
* `equal?`：比较两个对象是否相同(是否有相同的``oject_id``、引用？)

