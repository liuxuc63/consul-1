module SDGManagement::Header
  extend ActiveSupport::Concern

  def header(options: {})
    provide(:title) do
      "#{t("sdg_management.header.title")} - #{title}"
    end

    tag.h2 options do
      title
    end
  end
end
