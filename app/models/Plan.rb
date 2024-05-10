class Plan < ApplicationRecord
    <%= form_with model:@plan do |form| %>
        <div>
            <%= form.label :タイトル %>
            <%= form.text_field :title %>


end
