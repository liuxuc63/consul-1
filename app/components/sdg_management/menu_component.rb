class SDGManagement::MenuComponent < ApplicationComponent
  private

    def sdg?
      controller_name == "goals" || controller_name == "targets"
    end

    def relatable_list_item(type, &block)
      active = controller_name == "relations" && params[:relatable_type] == type.tableize

      tag.li class: ("is-active" if active) do
        link_to relatable_type_path(type), &block
      end
    end

    def relatable_type_path(type)
      send("sdg_management_#{table_name(type)}_path")
    end

    def table_name(type)
      type.constantize.table_name
    end
end
