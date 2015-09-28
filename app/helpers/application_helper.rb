module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(MarkdownPygments,
      fenced_code_blocks: true,
      autolink: true,
      tables: true)
    markdown.render(text).html_safe
  end
end
