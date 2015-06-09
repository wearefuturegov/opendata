module ApplicationHelper
  # Link to a static file and apply decorative classes/tags
  # Usage '%li= static_file('url/to/file.txt')'
  def static_file(url)
    # Filename (inc. extension)
    filename = url.rpartition('/').last
    # File extension
    extension = filename.to_s.rpartition('.').last

    link_to(url, target: '_blank', class: 'document-link') do
      capture do
        # Icon
        concat content_tag(:span, "", class: 'icon icon-document-1')
        # Filetype
        concat content_tag(:span, extension.upcase, class: 'document-type ' + extension)
        concat filename
      end
    end
  end
end
