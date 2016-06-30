module ArticlesHelper
  def sub_img(image, &text)
    img = image_tag(image, class: "illu-img")
    html = <<-HTML
      <div class="illu-article">
      #{img}
        <div class="illu-legend">
          #{capture(&text)}
        </div>
      </div>
    HTML
    html.html_safe
  end
# def sub_img(img, &text)
#   img = image_tag(img, class: "")
#   content = &text
#   content_d = div_tag()
#   div_tag(img + content_d ...)
# end
end
