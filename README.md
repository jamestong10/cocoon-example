# Cocoon Example

## Gems
- cocoon
- formtastic

## 架構

- project has many tasks
- task belongs_to project


## 使用

1. 設定 Active Record Nested Attributes，在新增、修改、刪除時，不需另外處理 has_many 的屬性

- `:allow_destroy => true`   表示可以在表單中放 `_destory` 核選表單表示刪除
- `:reject_if => :all_blank` 表示如果資料為空，就什麼都不動作


```
# models/project.rb
accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => :all_blank
```

2. 設定`tasks_attributes` strong parameters。設定 `:_destroy` 即可刪除此項目

```
# controllers/projects_controller.rb
def project_params
  params.require(:project).permit(:name, :description, tasks_attributes: [:id, :description, :done, :_destroy])
end
```

3. 套用 cocoon，使用 `link_to_add_association`, `link_to_remove_association`  就可以方便新增、刪除 has_many 的屬性

```
# views/_form.html.erb
<div id="tasks">
  <%= f.semantic_fields_for :tasks do |task| %>
    <%= render 'task_fields', f: task %>
  <% end %>
  <div class="links">
    <%= link_to_add_association 'add task', f, :tasks %>
  </div>
</div>
```



