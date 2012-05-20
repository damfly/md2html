require 'tilt'

dirname = File.dirname(__FILE__)

template = Tilt['haml'].new("#{dirname}/ayudo.haml")
data = Tilt['md'].new("#{dirname}/document.md")
@title = "Document de test de tilt" #A rendre dyamique simplement en prenant le nom du fichier markdown
File.open("#{dirname}/resultat.haml", 'w') do |f|
  f.write(template.render(self, :title => @title){ data.render })
end

