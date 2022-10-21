# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content do
    columns do
      column do
        panel 'Recently added books' do
          ul do
            Book.last(5).map do |book|
              li link_to(book.title, admin_book_path(book))
            end
          end
        end
      end
      column do
        panel 'Recently added stores' do
          ul do
            Store.last(5).map do |store|
              li link_to(store.name, admin_store_path(store))
            end
          end
        end
      end
    end
  end
end
