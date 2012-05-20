require 'tilt'
require 'yaml'

dirname = File.dirname(__FILE__)
template = Tilt['haml'].new("#{dirname}/ayudo.haml")
data = Tilt['md'].new("#{dirname}/document.md")
yamlpart = File.read("#{dirname}/document.md")[/^-+(.*?)^-+/m].delete('---').strip


File.open("#{dirname}/coucou6.html", 'w') do |f|
  f.write(template.render(self, :page => YAML.load(yamlpart)) { data.render })
end



