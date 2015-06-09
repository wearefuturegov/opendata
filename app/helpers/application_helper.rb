module ApplicationHelper
  def static_file(url)
    filename = url.rpartition('/').last
    extension = filename.to_s.rpartition('.').last

    link_to(url, target: '_blank', class: 'document-link') do
      capture do
        concat content_tag(:span, "", class: 'icon icon-document-1')
        concat content_tag(:span, extension.upcase, class: 'document-type ' + extension)
        concat filename
      end
    end
  end
end
