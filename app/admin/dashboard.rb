ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Manage Books" do
          ul do
            Book.all.map do |book|
              li link_to(book.title, book_path(book))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Manage Book categories" do
          ul do
            BookCategory.all.map do |bookcategory|
               li link_to(bookcategory.category.name, book_category_path(bookcategory))

            end
          end
        end
      end
    end



  end # content
end
