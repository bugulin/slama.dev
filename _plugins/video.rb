module Jekyll
  module Tags
    class VideoTag < Liquid::Tag
      def initialize(tag, name, tokens)
        super
        parts = name.split(" ")

        @name = parts[0].strip()

        unless parts[1].nil?
          @style = parts[1].strip()
        end
      end

      def render(context)
        date = @name.scan(/(\d\d\d\d)-(\d\d)-(\d\d)/)

        return "<figure class='video' style='#{@style}'>" \
          "<iframe src='#{@name}' allowfullscreen></iframe>" \
          "<figcaption class='figcaption-margin'>#{date[0][0]}/#{date[0][1]}/#{date[0][2]}</figcaption>" \
          "</figure>"
      end
    end
  end
end

Liquid::Template.register_tag('video', Jekyll::Tags::VideoTag)
